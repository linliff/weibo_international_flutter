import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/GlobalConfig.dart';
import 'package:weibo_international_flutter/main/discover/HotSearchWidget.dart';
import 'package:weibo_international_flutter/main/discover/QushiFourWidget.dart';
import 'package:weibo_international_flutter/main/discover/QushiPage.dart';
import 'package:weibo_international_flutter/main/discover/RemenPage.dart';

class DiscoverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabBarWidgetState();
  }
}

class TabBarWidgetState extends State<DiscoverPage> {
  final List<String> _tabValues = [
    '趋势',
    '热门',
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabValues.length, //Tab页数量
      vsync: ScrollableState(), //动画效果的异步处理
    );
    _tabController.addListener(() {
      setState(() {
        // print("_tabController.index的值:"+_tabController.index.toString());
      });
    });
  }

  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: GlobalConfig.color_light_gray,
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: 50,
                color: Color(0xffffffff),
                alignment: Alignment.center,
                child: TabBar(
                    isScrollable: true,
                    indicatorColor: Color(0xffFF3700),
                    indicator: UnderlineTabIndicator(
                        borderSide:
                            BorderSide(color: Color(0xffFF3700), width: 2),
                        insets: EdgeInsets.only(bottom: 7)),
                    labelColor: Color(0xff333333),
                    unselectedLabelColor: Color(0xff666666),
                    labelStyle:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                    unselectedLabelStyle: TextStyle(fontSize: 16.0),
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: _tabController,
                    tabs: [
                      new Tab(
                        text: _tabValues[0],
                      ),
                      new Tab(
                        text: _tabValues[1],
                      ),
                    ]),
              ),
            ],
          ),
          new Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[new HotSearchWidget(), new RemenPage()],
            ),
          )
        ],
      ),
    ));
  }
}
