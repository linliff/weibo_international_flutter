import 'package:flutter/material.dart';

import 'constant/constant.dart';
import 'discover_page.dart';
import 'home_page.dart';
import 'message_page.dart';
import 'utils/image_source_util.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int currentIndex = 0;
  var tabImages;
  var title = "";
  var pages = [HomePage(), DiscoverPage(), MessagePage()];
  List<BottomNavigationBarItem> bottomTabs;

  @override
  Widget build(BuildContext context) {
    initData();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        bottomNavigationBar: BottomNavigationBar(
          items: bottomTabs,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            _changePage(index);
          },
        ),
        body: pages[currentIndex],
      ),
    );
  }

  void initData() {
    tabImages = [
      [
        ImageSourceUtil.getImageByPath(
            Constant.ASSETS_IMG + 'tabbar_home.png', 25, 25),
        ImageSourceUtil.getImageByPath(
            Constant.ASSETS_IMG + 'tabbar_home_highlighted.png', 25, 25),
      ],
      [
        ImageSourceUtil.getImageByPath(
            Constant.ASSETS_IMG + 'tabbar_discover.png', 25, 25),
        ImageSourceUtil.getImageByPath(
            Constant.ASSETS_IMG + 'tabbar_discover_highlighted.png', 25, 25),
      ],
      [
        ImageSourceUtil.getImageByPath(
            Constant.ASSETS_IMG + 'tabbar_message_center.png', 25, 25),
        ImageSourceUtil.getImageByPath(
            Constant.ASSETS_IMG + 'tabbar_message_center_highlighted.png',
            25,
            25),
      ],
    ];

    bottomTabs = [
      BottomNavigationBarItem(icon: getTabIcon(0), label: title),
      BottomNavigationBarItem(icon: getTabIcon(1), label: title),
      BottomNavigationBarItem(icon: getTabIcon(2), label: title),
    ];
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == currentIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
