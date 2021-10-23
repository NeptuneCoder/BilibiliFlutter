///会员购
import 'package:bilibili_flutter/common/base/base_state.dart';
import 'package:bilibili_flutter/common/base/base_widget.dart';
import 'package:bilibili_flutter/common/widget/bili_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MemberPage extends BiliWidget {
   MemberPage({Key? key}) : super(key: key);

  @override
  State<MemberPage> createState() => _MemberState();
}

class _MemberState extends BiliState<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppbar("会员购"),
    );
  }
}
