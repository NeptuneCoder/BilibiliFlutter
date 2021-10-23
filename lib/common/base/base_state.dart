import 'package:flutter/material.dart';

abstract class BiliWidget extends StatefulWidget {
  String? param;

  BiliWidget({
    Key? key,
  }) : super(key: key);

  void setParam(String param) {
    this.param = param;
  }
}
