import 'package:bilibili_flutter/common/base/base_state.dart';
import 'package:bilibili_flutter/common/base/base_widget.dart';
import 'package:bilibili_flutter/moudles/main/dynamic.dart';
import 'package:bilibili_flutter/moudles/main/home.dart';
import 'package:bilibili_flutter/moudles/main/me.dart';
import 'package:bilibili_flutter/moudles/main/member.dart';
import 'package:bilibili_flutter/moudles/main/publish.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

/// 接受首页五个tab界面
@immutable
class MainPage extends BiliWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainState();
}

class _MainState extends BiliState {
  var _currentIndex = 0;
  var _pageController = PageController(initialPage: 0);

  void _pageChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Color _getCurItemColor(int index) {
    if (index == _currentIndex) {
      return Theme.of(context).primaryColor;
    } else {
      return Colors.grey.shade400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: _pageChange,
          physics: const NeverScrollableScrollPhysics(), //禁止滚动
          children: [
            HomePage(),
            DynamicPage(),
            PublishPage(),
            MemberPage(),
            MePage()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: _getCurItemColor(0)),
                label: "首页"),
            BottomNavigationBarItem(
                icon: Icon(Icons.dynamic_feed, color: _getCurItemColor(1)),
                label: "动态"),
            BottomNavigationBarItem(
                icon: Icon(Icons.publish, color: _getCurItemColor(2)),
                label: "发布"),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_membership, color: _getCurItemColor(3)),
                label: "会员购"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: _getCurItemColor(4)), label: "我的")
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _pageController.jumpToPage(index);
          },
        ));
  }
}
