import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/main/discover/trend/HotSearchWidget.dart';
import 'package:weibo_international_flutter/main/discover/trend/TopicWidget.dart';
import 'package:weibo_international_flutter/main/discover/trend/TrendFourWidget.dart';
import 'package:weibo_international_flutter/main/discover/trend/TrendVideoWidget.dart';
import 'package:weibo_international_flutter/model/discover/video/VideoModel.dart';
import 'package:weibo_international_flutter/widget/EmptyHolder.dart';

typedef Future<Response> RequestData(int page);

class TrendPage extends StatefulWidget {
  final RequestData request;
  final String emptyMsg;
  final bool keepAlive;
  final bool selfControl;

  TrendPage(
      {Key key,
      @required this.request,
      this.emptyMsg,
      this.selfControl = true,
      this.keepAlive = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TrendPageState();
  }
}

class TrendPageState extends State<TrendPage>
    with AutomaticKeepAliveClientMixin {
  final int TYPE_FOUR_WIDGET = 1;
  final int TYPE_HOT_SEARCH = 2;
  final int TYPE_HOT_TOPIC = 3;

  List<Object> listData = List();
  int listDataPage = -1;
  var haveMoreData = true;
  ListView listView;
  ScrollController _controller;
  bool isLoading = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadNextPage();
  }

  void handleScroll(double offset, {ScrollController controller}) {
    ((null == controller) ? _controller : controller)?.animateTo(offset,
        duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    var itemCount =
        ((null == listData) ? 0 : listData.length) + (haveMoreData ? 1 : 0);
    if (itemCount <= 0) {
      return EmptyHolder(
        msg: (widget.emptyMsg == null)
            ? (haveMoreData ? "Loading" : "not found")
            : widget.emptyMsg,
      );
    }
    listView = ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: itemCount,
        controller: _getControllerForListView(),
        itemBuilder: (context, index) {
          if (index >= listData.length) {
            return _buildLoadMoreItem();
          } else {
            return _buildListViewItemLayout(context, index);
          }
        });

    var body = NotificationListener<ScrollNotification>(
      onNotification: onScrollNotification,
      child: RefreshIndicator(
        child: listView,
        color: Colors.black45,
        onRefresh: _handleRefresh,
      ),
    );
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: body,
    );
  }

  bool onScrollNotification(ScrollNotification scrollNotification) {
    if (scrollNotification.metrics.pixels >=
        scrollNotification.metrics.maxScrollExtent) {
      _loadNextPage();
    }

    return false;
  }

  _buildListViewItemLayout(BuildContext context, int index) {
    if (null == listData ||
        listData.length <= 0 ||
        index < 0 ||
        index >= listData.length) {
      return Container();
    }

    Object data = listData[index];
    if (data is int) {
      if (data == TYPE_FOUR_WIDGET) {
        return TrendFourWidget();
      }
      if (data == TYPE_HOT_SEARCH) {
        return new HotSearchWidget();
      }

      if (data == TYPE_HOT_TOPIC) {
        return new TopicWidget();
      }
    }

    return InkWell(
      onTap: () {},
      child: TrendVideoWidget(listData[index]),
    );
  }

  Widget _buildLoadMoreItem() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Loading ..."),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    listDataPage = -1;
    listData.clear();
    await _loadNextPage();
  }

  Future<Null> _loadNextPage() async {
    if (isLoading || !this.mounted) {
      return null;
    }
    isLoading = true;
    listDataPage++;
    var result = await _loadListData(listDataPage);
    //????????????8??????????????????????????????????????????????????????,????????????????????????????????????????????????
    if (listData.length < 8) {
      listDataPage++;
      result = await _loadListData(listDataPage);
    }
    if (this.mounted) setState(() {});
    isLoading = false;
    return result;
  }

  ScrollController _getControllerForListView() {
    if (widget.selfControl) {
      if (null == _controller) _controller = ScrollController();
      return _controller;
    } else {
      return null;
    }
  }

  Future<Null> _loadListData(int page) {
    haveMoreData = true;
    return widget.request(page).then((response) {
      var newList = VideoModel.fromJson(response.data).data.list;
      var originListLength = listData.length;
      if (newList != null && newList.length > 0) {
        listData.addAll(newList);
      }
      if (page == 0) {
        _setTopData();
      }
      haveMoreData = originListLength != listData.length;
    });
  }

  void _setTopData() {
    listData.insert(0, TYPE_FOUR_WIDGET);
    listData.insert(1, TYPE_HOT_SEARCH);
    listData.insert(2, TYPE_HOT_TOPIC);
  }

  @override
  void dispose() {
    _controller?.dispose();
    listData?.clear();
    super.dispose();
  }
}
