import 'dart:async';

import 'package:bilibili_flutter/common/base/base_state.dart';
import 'package:bilibili_flutter/common/base/base_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

///用于splash界面中倒计时按钮

class CountdownWidget extends BiliWidget {
  ///构造中传入函数
  final VoidCallback? onClick;

  final VoidCallback? onFinish;

  int total = 5;

  CountdownWidget(int total, {Key? key, this.onClick, this.onFinish})
      : super(key: key);

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends BiliState<CountdownWidget> {
  var _count = 0;

  late Timer _timer;

  ///注册倒计时
  @override
  void initState() {
    super.initState();
    var duration = const Duration(seconds: 1);
    _timer = Timer.periodic(duration, (timer) {
      if (_count < widget.total) {
        setState(() {
          _count++;
        });
      } else {
        widget.onFinish?.call();
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onClick?.call();
      },
      child: SizedBox(
        height: 40,
        child: Card(
          elevation: 1,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text("倒计时${widget.total - _count}s"),
            ),
          ),
        ),
      ),
    );
  }
}
