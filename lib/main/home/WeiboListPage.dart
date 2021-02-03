import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/main/home/WeiboItemWidget.dart';
import 'package:weibo_international_flutter/model/list/WeiboItemBean.dart';
import 'package:weibo_international_flutter/model/list/WeiboListModel.dart';
import 'package:weibo_international_flutter/widget/EmptyHolder.dart';

typedef Future<Response> RequestData(int page);

class WeiboListPage extends StatefulWidget {
  final Widget header;
  final RequestData request;
  final String emptyMsg;
  final bool keepAlive;
  final bool selfControl;

  WeiboListPage(
      {Key key,
      this.header,
      @required this.request,
      this.emptyMsg,
      this.selfControl = true,
      this.keepAlive = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WeiboListPageState();
  }
}

class WeiboListPageState extends State<WeiboListPage>
    with AutomaticKeepAliveClientMixin {
  List<WeiboItemBean> listData = List();
  int listDataPage = -1;
  var haveMoreData = true;
  ListView listView;
  ScrollController _controller;
  bool isLoading = false;

  @override
  bool get wantKeepAlive => widget.keepAlive;

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
    var itemCount = ((null == listData) ? 0 : listData.length) +
        (null == widget.header ? 0 : 1) +
        (haveMoreData ? 1 : 0);
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
        controller: getControllerForListView(),
        itemBuilder: (context, index) {
          if (index == 0 && null != widget.header) {
            return widget.header;
          } else if (index - (null == widget.header ? 0 : 1) >=
              listData.length) {
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
        onRefresh: handleRefresh,
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

    return InkWell(
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        //   return WeiBoDetailPage(
        //     mModel: model,
        //   );
        // }));
      },
      child: WeiboItemWidget(listData[index], false),
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

  Future<Null> handleRefresh() async {
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
    //至少加载8个，如果初始化加载不足，则加载下一页,如果使用递归的话需要考虑中止操作
    if (listData.length < 8) {
      listDataPage++;
      result = await _loadListData(listDataPage);
    }
    if (this.mounted) setState(() {});
    isLoading = false;
    return result;
  }

  ScrollController getControllerForListView() {
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
      var newList = WeiboListModel.fromJson(response.data).data.list;
      var originListLength = listData.length;
      if (newList != null && newList.length > 0) {
        listData.addAll(newList);
      }
      if(page == 0){
        setTopData();
      }
      haveMoreData = originListLength != listData.length;
    });
  }


  void setTopData() {

    listData.add('TrendFore');
    listData.add('TrendFore');
    listData.add('TrendFore');

  }

  @override
  void dispose() {
    _controller?.dispose();
    listData?.clear();
    super.dispose();
  }

}
