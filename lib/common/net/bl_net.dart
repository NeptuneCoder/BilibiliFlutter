import 'dart:convert';
import 'dart:io';

import 'package:bilibili_flutter/common/constant/bl_constant.dart';
import 'package:bilibili_flutter/common/log/bl_log.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'dart:convert' as convert;

typedef ErrorTypeCallback = void Function();
typedef SuccessCallback = void Function(dynamic);

class NetUtil {
  NetUtil._private();

  factory NetUtil() {
    return _instance ??= NetUtil._private();
  }

  static NetUtil? _instance;

  static NetUtil _getInstance() {
    _instance ??= NetUtil._private();
    return _instance!;
  }

  static get instance => _getInstance();

  getCurrentTimeMillis() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  final _dio = Dio(BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 5000,
  ));

  Future<dynamic> fetchUser(
    String path, {
    Map<String, dynamic> paramData = const <String, dynamic>{},
    SuccessCallback? successCallback,
    ErrorTypeCallback? errorTypeCallback,
  }) async {
    return await fetchData("${GlobalConstant.host}$path",
        param: paramData,
        successCallback: successCallback,
        errorTypeCallback: errorTypeCallback);
  }

  Future<dynamic> fetchData(
    String url, {
    Map<String, dynamic> param = const <String, dynamic>{},
    SuccessCallback? successCallback,
    ErrorTypeCallback? errorTypeCallback,
  }) async {
    try {
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback = (cert, host, port) {
          Log.i("host === $host");
          Log.i("port === $port");
          Log.i("sha1 === ${cert.sha1}");
          Log.i("issuer === ${cert.issuer}");
          Log.i("pem === ${cert.pem}");
          return true;
        };
      };
      Log.i("被调用了一次");
      Log.i("url == $url");
      var jsonParam = <String, dynamic>{};
      param.forEach((key, value) {
        jsonParam[key] = value;
      });

      jsonParam["ts"] = getCurrentTimeMillis();

      _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        _dio.lock();
        options.headers.remove("Content-Type");
        var headerParam = {
          "Connection": "true",
          "os": _getPlatformName(),
          "lang": "zh-cn",
          "ENCRYPT": "1",
          "Content-Type": "application/x-www-form-urlencoded"
        };
        // headerParam["token"] = token;
        options.headers.addAll(headerParam);
        _dio.unlock();
        //请求数据前拦截
        handler.next(options);
      }, onResponse: (response, handler) {
        //响应数据拦截
        Log.i("onResponse:x === $response  y ==== $handler");
        handler.next(response); //保证链路关联上，不然请求不会被调用。
      }, onError: (error, handler) {
        //异常数据拦截
        Log.i("onError:x === $error  y ==== $handler");
        handler.next(error);
      }));
      var requestParam = convert.jsonEncode(jsonParam);

      Log.i("请求参数未加密:$requestParam");
      // var encodeParam = aesEncode(requestParam, encryptKey, aesIv);

      // Log.i("请求参数已加密:$encodeParam");
      // var response =
      //     await _dio.post<String>(url, data: "post_data=$encodeParam");
      var response = await _dio.post<String>(url, data: "post_data=");

      if (response.statusCode == 200) {
        Log.i("response statusCode ==  ${response.statusCode}");
        Log.i("response data ==  ${response.data}");
        var resContent =response.data ?? "";
            ""; //aesDecode(response.data ?? "", encryptKey, aesIv);
        var resValue = json.decode(resContent);
        successCallback?.call(resValue);
        // Log.i("解密数据:$resContent");
        return resValue;
      } else {
        //TODO 其他异常进行对应提示
        errorTypeCallback?.call();
      }
    } catch (e) {
      Log.i("发送了错误 === $e");
      errorTypeCallback?.call();
    }
  }

  /**
   * 定义私有的获取平台的类型
   */
  String _getPlatformName() {
    if (Platform.isAndroid) {
      return "Android";
    } else if (Platform.isIOS) {
      return "ios";
    } else {
      return "OtherOS";
    }
  }
}
