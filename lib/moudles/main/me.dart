///我的
import 'package:bilibili_flutter/common/base/base_state.dart';
import 'package:bilibili_flutter/common/base/base_widget.dart';
import 'package:bilibili_flutter/common/widget/bili_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MePage extends BiliWidget {
  MePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MeState();
}

class _MeState extends BiliState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppbar("我的"),
      body: Text("我的"),
    );
  }
}
