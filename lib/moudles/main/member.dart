///会员购
import 'package:bilibili_flutter/common/base/base_state.dart';
import 'package:bilibili_flutter/common/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MemberPage extends BiliWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MemberState();
}

class _MemberState extends BiliState {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
