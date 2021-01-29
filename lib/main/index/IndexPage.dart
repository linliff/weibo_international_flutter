import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/Constant.dart';
import 'package:weibo_international_flutter/main/DiscoverPage.dart';
import 'package:weibo_international_flutter/main/home/HomePage.dart';
import 'package:weibo_international_flutter/main/MessagePage.dart';
import 'package:weibo_international_flutter/utils/ImageSourceUtil.dart';

class IndexPage extends StatefulWidget {
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  int currentIndex = 0;
  var tabImages;
  var title = "全部";
  var pages = [HomePage(), DiscoverPage(), MessagePage()];
  List<BottomNavigationBarItem> bottomTabs;
  PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    _initData();

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 300,
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.red,
            onPressed: () {},
          ),
          drawer: _buildLeftDrawer(),
          appBar: AppBar(
            title: Text(title),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomTabs,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) {
              // title = "aaa" + '${index}';
              controller.jumpToPage(index);
            },
          ),
          body: _buildBodyWidget(),
        ));
  }

  Widget _buildBodyWidget() {
    return PageView.builder(
      controller: controller,
      itemCount: pages.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return pages[index];
      },
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
    );
  }

  Drawer _buildLeftDrawer() => Drawer(
        elevation: 1,
        child: Image.asset(Constant.ASSETS_IMG + 'tabbar_home.png',
            fit: BoxFit.cover),
      );

  void _initData() {
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
      BottomNavigationBarItem(icon: _getTabIcon(0), label: ''),
      BottomNavigationBarItem(icon: _getTabIcon(1), label: ''),
      BottomNavigationBarItem(icon: _getTabIcon(2), label: ''),
    ];
  }

  Image _getTabIcon(int curIndex) {
    if (curIndex == currentIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  void _changePage(int index) {
    controller.jumpToPage(index);
  }
}
