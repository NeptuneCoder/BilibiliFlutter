import 'package:bilibili_flutter/common/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class EmptyPage extends BiliWidget {
  String title = "";

  EmptyPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EmptyState();
}

class _EmptyState extends State<EmptyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
