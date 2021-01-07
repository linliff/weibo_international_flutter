import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/discover_page.dart';
import 'package:weibo_international_flutter/home_page.dart';
import 'package:weibo_international_flutter/message_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int currentIndex = 0;
  var tabImages;
  var title = new Text("");
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
        getTabImage('assets/images/tabbar_home.png'),
        getTabImage('assets/images/tabbar_home_highlighted.png')
      ],
      [
        getTabImage('assets/images/tabbar_discover.png'),
        getTabImage('assets/images/tabbar_discover_highlighted.png')
      ],
      [
        getTabImage('assets/images/tabbar_message_center.png'),
        getTabImage('assets/images/tabbar_message_center_highlighted.png')
      ],
    ];

    bottomTabs = [
      BottomNavigationBarItem(icon: getTabIcon(0), title: title),
      BottomNavigationBarItem(icon: getTabIcon(1), title: title),
      BottomNavigationBarItem(icon: getTabIcon(2), title: title),
    ];
  }

  Image getTabImage(path) {
    return new Image.asset(path, width: 25.0, height: 25.0);
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
