import 'dart:async';

import 'package:bilibili_flutter/common/base/base_state.dart';
import 'package:bilibili_flutter/common/base/base_widget.dart';
import 'package:bilibili_flutter/common/log/bl_log.dart';
import 'package:bilibili_flutter/common/widget/bili_countdown_widget.dart';
import 'package:bilibili_flutter/moudles/app/global_routes.dart';
import 'package:bilibili_flutter/moudles/empty/empty.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BiliApp());
}

class BiliApp extends StatelessWidget {
  const BiliApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          return GlobalRoutes.getWidgetByName(settings.name!,
                  param: ((settings.arguments ?? "") as String)) ??
              EmptyPage();
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;
          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        });
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class SplashPage extends BiliWidget {
  SplashPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BiliState<SplashPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CountdownWidget(
              onClick: () {
                _skip2main();
              },
              onFinish: () {
                _skip2main();
              },
            ),
            CountdownWidget(
              total: 10,
              content: "已发送",
              textColor: Colors.blue,
              borderRadius: 2,
              onClick: () {
                _skip2main();
              },
              onFinish: () {
                _skip2main();
              },
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  ///点击直接进入到首页
  void _skip2main() {
    Navigator.pushReplacementNamed(context, GlobalRoutes.mainPage);
  }
}
