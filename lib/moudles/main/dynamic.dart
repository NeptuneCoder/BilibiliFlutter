///动态
import 'package:bilibili_flutter/common/base/base_state.dart';
import 'package:bilibili_flutter/common/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class DynamicPage extends BiliWidget {
   DynamicPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DynamicState();
}

class _DynamicState extends BiliState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("动态"),
    );
  }
}

///
