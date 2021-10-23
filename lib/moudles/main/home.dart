///首页
import 'package:bilibili_flutter/common/base/base_state.dart';
import 'package:bilibili_flutter/common/base/base_widget.dart';
import 'package:bilibili_flutter/common/widget/bili_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends BiliWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends BiliState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppbar("首页"),
      body: Text("首页"),
    );
  }
}
