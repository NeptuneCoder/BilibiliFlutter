import 'package:bilibili_flutter/common/constant/bl_constant.dart';

class Log {
  Log._private();

  static void i(String content) {
    if (GlobalConstant.isDebug) {
      print("Bili=$content");
    }
  }
}
