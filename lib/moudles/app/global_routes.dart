import 'package:bilibili_flutter/common/base/base_state.dart';
import 'package:bilibili_flutter/moudles/empty/empty.dart';
import 'package:bilibili_flutter/moudles/main/main_page.dart';
import 'package:flutter/material.dart';

///注册全局的路由
class GlobalRoutes {
  GlobalRoutes._private();

  static const String mainPage = "/main_page";
  static final Map<String, Widget> _globalRoutes = <String, Widget>{
    mainPage: MainPage(),
  };

  static Widget? getWidgetByName(String name, {param = String}) {
    var widget = _globalRoutes[name];
    if (widget is BiliWidget) {
      widget.setParam(param);
    }
    return widget;
  }
}
