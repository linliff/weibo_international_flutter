import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/Constant.dart';
import 'package:weibo_international_flutter/model/list/WeiboItemBean.dart';
import 'package:weibo_international_flutter/utils/DataUtil.dart';
import 'package:weibo_international_flutter/utils/ImageSourceUtil.dart';
import 'package:weibo_international_flutter/widget/MatchText.dart';
import 'package:weibo_international_flutter/widget/ParsedText.dart';
import 'package:weibo_international_flutter/widget/likebutton/LikeButton.dart';
import 'package:weibo_international_flutter/widget/likebutton/utils/LikeButtonModel.dart';

class QushiFourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 10, right: 15, left: 15),
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Expanded(
            child: Column(
              children: <Widget>[
                Image.asset(
                  Constant.ASSETS_IMG + 'ic_ditu.png',
                  width: 30.0,
                  height: 30.0,
                ),
                Text(
                  "疫情地图",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            flex: 1,
          ),
          new Expanded(
            child: Column(
              children: <Widget>[
                Image.asset(
                  Constant.ASSETS_IMG + 'ic_tongcheng.png',
                  width: 30.0,
                  height: 30.0,
                ),
                Text(
                  "同城",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            flex: 1,
          ),
          new Expanded(
            child: Column(
              children: <Widget>[
                Image.asset(
                  Constant.ASSETS_IMG + 'ic_huati.png',
                  width: 30.0,
                  height: 30.0,
                ),
                Text(
                  "超级话题",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            flex: 1,
          ),
          new Expanded(
            child: Column(
              children: <Widget>[
                Image.asset(
                  Constant.ASSETS_IMG + 'ic_bangdan.png',
                  width: 30.0,
                  height: 30.0,
                ),
                Text(
                  "榜单",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
