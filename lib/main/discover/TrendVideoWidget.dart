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
      child: Column(
        children: <Widget>[
          _getVideoWidget(context, ''),
          _getContentWidget(""),
          _getUserWidget(""),
        ],
      ),
    );
  }

  Widget _getVideoWidget(BuildContext context, String videoUrl) {
    return Container(
      child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: (videoUrl.isEmpty || "null" == videoUrl)
              ? new Container()
              : Container(
                  constraints: BoxConstraints(
                      maxHeight: 250,
                      maxWidth: MediaQuery.of(context).size.width,
                      //    maxWidth: 200,
                      minHeight: 150,
                      minWidth: 150),
                  child: VideoWidget(
                    videoUrl,
                  ))),
    );
  }

  Widget _getContentWidget(String content) {
    return Container(
        child: Text(
      "微博内容",
      style: TextStyle(fontSize: 12, color: Colors.grey),
    ));
  }

  Widget _getUserWidget(String content) {
    return Row(
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
    );
  }
}
