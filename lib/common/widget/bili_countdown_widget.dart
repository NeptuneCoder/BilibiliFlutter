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
  final int total;
  final double borderRadius;
  final String content;
  final double? height;

  final Color? textColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;

  CountdownWidget(
      {this.total = 5,
      Key? key,
      this.height = 40,
      this.onClick,
      this.onFinish,
      this.borderRadius = 20,
      this.content = "倒计时",
      this.textColor = Colors.black,
      this.focusColor,
      this.hoverColor,
      this.highlightColor})
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
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      highlightColor: widget.highlightColor,
      onTap: () {
        widget.onClick?.call();
      },
      child: SizedBox(
        height: widget.height,
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "${widget.content}${widget.total - _count}s",
                style: TextStyle(color: widget.textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
