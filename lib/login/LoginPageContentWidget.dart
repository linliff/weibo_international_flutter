import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/Constant.dart';
import 'package:weibo_international_flutter/GlobalConfig.dart';
import 'package:weibo_international_flutter/model/hotsearch/HotSearchBean.dart';
import 'package:weibo_international_flutter/model/user/UserBean.dart';
import 'package:weibo_international_flutter/utils/ImageSourceUtil.dart';

typedef Future<Response> RequestData(int page);

class LoginPageContentWidget extends StatelessWidget {
  double iconWidth = 17.0;
  double iconHeight = 17.0;

  List<Object> hotSearchList = new List();
  List<Object> hotUserList = new List();

  LoginPageContentWidget(List hotSearchList, List hotUserList) {
    this.hotSearchList = hotSearchList;
    this.hotUserList = hotUserList;
  }

  @override
  Widget build(BuildContext context) {
    return _buildContentView();
  }

  Widget _buildContentView() {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.only(top: 10),
        children: <Widget>[
          _buildHotUserListView(),
          _buildSplitWidget(),
          _buildHotSearchListView(),
        ],
      ),
    );
  }

  // 热门用户和热搜之间的间隔
  Container _buildSplitWidget() {
    return Container(
      height: 10,
      color: GlobalConfig.color_light_gray,
    );
  }

  // 热门用户
  Widget _buildHotUserListView() {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        //解决无限高度问题
        physics: NeverScrollableScrollPhysics(),
        //禁用滑动事件
        itemCount: hotUserList.length,
        itemBuilder: (context, index) =>
            _buildHotUserListItem(hotUserList[index], index),
      ),
    );
  }

  /// 热搜词
  Widget _buildHotSearchListView() {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10, bottom: 20),
        shrinkWrap: true,
        //解决无限高度问题
        physics: NeverScrollableScrollPhysics(),
        //禁用滑动事件
        itemCount: hotSearchList.length,
        itemBuilder: (context, index) =>
            _buildHotWordListItem(hotSearchList[index], index),
      ),
    );
  }

  Widget _buildHotUserListItem(Object user, int index) => Container(
        alignment: Alignment.center,
        child: _buildHotUserItemContent(user, index),
      );

  Widget _buildHotWordListItem(Object searchWord, int index) => Container(
        alignment: Alignment.center,
        child: _buildHotWordItemContent(searchWord, index),
      );

  //==========热搜词=================

  Widget _buildHotWordItemContent(Object searchWord, int index) {
    if (searchWord == null) {
      return null;
    }

    if (searchWord is HotSearchBean) {
      return _getHotItemWidget(searchWord, index - 1);
    } else if (searchWord is String) {
      return _getHotTitleWidget(searchWord);
    }
    return null;
  }

  Widget _getHotTitleWidget(String title) {
    return Column(
      children: <Widget>[
        Container(
          height: 30,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Text(title,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Text("全部",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      )),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 0.5,
          color: GlobalConfig.color_light_gray,
        )
      ],
    );
  }

  Widget _getHotItemWidget(HotSearchBean searchWord, int index) {
    Widget hotSearchIcon = _buildItemIconWidget(index);

    return Column(
      children: <Widget>[
        Container(
          height: 40,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Text((index + 1).toString() + "",
                      style: TextStyle(
                        fontFamily: "HotSearch", // 指定该Text的字体。
                        fontSize: 14,
                        color: Colors.red,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(searchWord.hot_word + "",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      )),
                ),
                Container(
                  child: Text(searchWord.hot_word_num,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: hotSearchIcon,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 0.5,
          color: GlobalConfig.color_light_gray,
        )
      ],
    );
  }

  //==========热门用户=================

  Widget _buildHotUserItemContent(Object hotUser, int index) {
    if (hotUser is UserBean) {
      return _buildHotUserWidget(hotUser);
    } else if (hotUser is String) {
      return _getHotUserTitleWidget(hotUser);
    }

    return null;
  }

  Widget _buildHotUserWidget(UserBean userBean) {
    if (userBean == null) {
      return null;
    }

    return Column(
      children: <Widget>[
        Container(
          height: 80,
          padding: EdgeInsets.only(top: 5, bottom: 5),
          child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(userBean.headurl),
                  )),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      '${userBean.nick}',
                      style: TextStyle(
                          letterSpacing: 0, color: Colors.black, fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    child: Text(
                      '${userBean.decs}',
                      style: TextStyle(
                          letterSpacing: 0,
                          color: Color(0xff666666),
                          fontSize: 12),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Text(
                      '粉丝 ' + '${Random().nextInt(10000)}' + '万',
                      style: TextStyle(
                          letterSpacing: 0,
                          color: Color(0xff666666),
                          fontSize: 12),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 0.5,
          margin: EdgeInsets.only(left: 80),
          color: GlobalConfig.color_light_gray,
          //  margin: EdgeInsets.only(left: 60),
        ),
      ],
    );
  }

  Widget _getHotUserTitleWidget(String title) {
    return Column(
      children: <Widget>[
        Container(
          height: 30,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Text(title,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Text("全部",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      )),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 0.5,
          color: GlobalConfig.color_light_gray,
        )
      ],
    );
  }

  //==========热搜词前面的icon=================

  Widget _buildItemIconWidget(int index) {
    Widget hotSearchIcon;
    if (index == 0) {
      hotSearchIcon = ImageSourceUtil.getImageByPath(
        Constant.ASSETS_IMG + 'ic_hot_hot.jpg',
        iconWidth,
        iconHeight,
      );
    } else if (index == 1 || index == 2) {
      hotSearchIcon = ImageSourceUtil.getImageByPath(
        Constant.ASSETS_IMG + 'ic_hot_new.jpg',
        iconWidth,
        iconHeight,
      );
    } else if (index >= 3 && index <= 8) {
      hotSearchIcon = ImageSourceUtil.getImageByPath(
        Constant.ASSETS_IMG + 'ic_hot_rec.jpg',
        iconWidth,
        iconHeight,
      );
    } else {
      hotSearchIcon = Container(
        height: iconHeight,
      );
    }
    return hotSearchIcon;
  }
}
