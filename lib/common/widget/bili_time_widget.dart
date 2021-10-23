import 'package:bilibili_flutter/common/base/base_state.dart';
import 'package:bilibili_flutter/common/base/base_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

///用于splash界面中倒计时按钮

class CountdownWidget extends BiliWidget {
  final String time;

  CountdownWidget(this.time, {Key? key}) : super(key: key);

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends BiliState<CountdownWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Card(
        elevation: 1,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text("倒计时${widget.time}s"),
          ),
        ),
      ),
    );
  }
}
