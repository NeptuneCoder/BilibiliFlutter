import 'package:flutter/material.dart';

@immutable
abstract class BiliWidget extends StatefulWidget {
  BiliWidget({
    Key? key,
  }) : super(key: key);

  String param = "";

  void setParam(String param) {
    this.param = param;
  }
}
