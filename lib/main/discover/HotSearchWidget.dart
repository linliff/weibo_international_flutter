import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/Constant.dart';
import 'package:weibo_international_flutter/GlobalConfig.dart';
import 'package:weibo_international_flutter/model/list/WeiboItemBean.dart';
import 'package:weibo_international_flutter/utils/DataUtil.dart';
import 'package:weibo_international_flutter/utils/ImageSourceUtil.dart';
import 'package:weibo_international_flutter/widget/MatchText.dart';
import 'package:weibo_international_flutter/widget/ParsedText.dart';
import 'package:weibo_international_flutter/widget/likebutton/LikeButton.dart';
import 'package:weibo_international_flutter/widget/likebutton/utils/LikeButtonModel.dart';

class HotSearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(top: 10, right: 15, left: 15),
        color: Colors.white,
        child: Column(
          children: [
            _getTitleWidget('热搜'),
            Container(
              height: 0.5,
              color: GlobalConfig.color_light_gray,
            ),
            Row(
              children: <Widget>[
                new Expanded(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "疫情地图",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child:ImageSourceUtil.getImageByPath(
                          Constant.ASSETS_IMG + 'ic_hot_hot.jpg',
                          17,
                          17,
                        ),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                new Expanded(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "疫情地图",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        "同城",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
              ],
            ),
          ],
        ));
  }

  Widget _getTitleWidget(String title) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
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
}
