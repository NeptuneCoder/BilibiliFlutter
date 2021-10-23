///动态
import 'package:bilibili_flutter/common/base/base_state.dart';
import 'package:bilibili_flutter/common/base/base_widget.dart';
import 'package:bilibili_flutter/common/widget/bili_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class DynamicPage extends BiliWidget {
  DynamicPage({Key? key}) : super(key: key);

  @override
  State<DynamicPage> createState() => _DynamicState();
}

class _DynamicState extends BiliState<DynamicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppbar("动态"),
      body: Text("动态"),
    );
  }
}

///
