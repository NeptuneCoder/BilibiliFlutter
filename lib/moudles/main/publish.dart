///发布
import 'package:bilibili_flutter/common/base/base_state.dart';
import 'package:bilibili_flutter/common/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class PublishPage extends BiliWidget {
  const PublishPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PublishState();
}

class _PublishState extends BiliState {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
