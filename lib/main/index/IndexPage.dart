import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/Constant.dart';
import 'package:weibo_international_flutter/main/discover/DiscoverPage.dart';
import 'package:weibo_international_flutter/main/home/HomePage.dart';
import 'package:weibo_international_flutter/main/message/MessagePage.dart';
import 'package:weibo_international_flutter/utils/ImageSourceUtil.dart';

///首页最外层的壳子
class IndexPage extends StatefulWidget {
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  static const double INDEX_HOME = 0;
  static const double INDEX_DISCOVER = 1.0;
  static const double INDEX_MESSAGE = 2.0;

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
    controller.addListener(() {
      var index = controller.page;
      print("page scroll index $index");
      if (index == INDEX_HOME) {
        title = "全部";
      } else if (index == INDEX_DISCOVER) {
        title = "探索";
      } else if (index == INDEX_MESSAGE) {
        title = "消息提醒";
      }
    });
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
            onPressed: () {
              _showDialog();
            },
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
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            _getUserHeader(),
            _getUserItem("收藏", 'ic_shoucang.png'),
            _getUserItem("点赞", 'ic_dianzan.png'),
            _getUserItem("浏览记录", 'ic_liulanjilu.png'),
            _getUserItem("草稿", 'ic_caogao.png'),
            _getUserItem("设置", 'ic_setting.png'),
          ],
        ),
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
            Constant.ASSETS_IMG + 'tabbar_discover.png', 21, 21),
        ImageSourceUtil.getImageByPath(
            Constant.ASSETS_IMG + 'tabbar_discover_highlighted.png', 21, 21),
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

  Widget _getUserHeader() {
    return UserAccountsDrawerHeader(
        margin: EdgeInsets.only(top: 20),
        accountName: Text('linlif',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            )),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        currentAccountPicture: Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              image: DecorationImage(
                  image: NetworkImage(
                      'https://img2.doubanio.com/view/photo/l/public/p2509706082.webp'),
                  fit: BoxFit.cover),
            )));
  }

  Widget _getUserItem(String title, String icon) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15, right: 20, top: 20, bottom: 20),
            child: ImageSourceUtil.getImageByPath(
                Constant.ASSETS_IMG + icon, 25, 25),
          ),
          Container(
            child: Text(title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                )),
          ),
        ]);
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("编写你的第一条微博吧！"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
