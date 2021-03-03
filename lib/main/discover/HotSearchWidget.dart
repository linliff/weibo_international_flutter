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
        padding: EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 10),
        color: Colors.white,
        child: Column(
          children: [
            _getTitleWidget(),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              height: 0.5,
              color: GlobalConfig.color_light_gray,
            ),
            Row(
              children: <Widget>[
                new Expanded(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "全球疫情",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: ImageSourceUtil.getImageByPath(
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
                        "李现被家里长辈催婚",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: ImageSourceUtil.getImageByPath(
                          Constant.ASSETS_IMG + 'ic_hot_hot.jpg',
                          17,
                          17,
                        ),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 0.5,
            ),
            Row(
              children: <Widget>[
                new Expanded(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "赘婿",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: ImageSourceUtil.getImageByPath(
                          Constant.ASSETS_IMG + 'ic_hot_new.jpg',
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
                        "创造营",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: ImageSourceUtil.getImageByPath(
                          Constant.ASSETS_IMG + 'ic_hot_rec.jpg',
                          17,
                          17,
                        ),
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

  Widget _getTitleWidget() {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Text('热搜',
                      style: TextStyle(
                        fontSize: 12,
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
      ],
    );
  }
}
