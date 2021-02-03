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

class TrendVideoWidget extends StatelessWidget {
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
          _getBottomWidget(""),
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

  Widget _getBottomWidget(String content) {
    return Row(
      children: <Widget>[
       new Flexible(child: _getUserWidget('content'),
       flex: 1,),
        new Flexible(child: _getRePraCom(null,null),
          flex: 1,)


      ],
    );
  }


  Widget _getUserWidget(String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              image: DecorationImage(
                  image: NetworkImage(''),
                  fit: BoxFit.cover),
            )),
        Text(
          "name",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),


      ],
    );
  }


//转发收藏点赞布局
  Widget _getRePraCom(BuildContext context, WeiboItemBean weiboItem) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 50,
        ),
        new Flexible(
          child: InkWell(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              //   return RetWeetPage(
              //     mModel: weiboItem,
              //   );
              // }));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                LikeButton(
                  isLiked: weiboItem.zanStatus == 1,
                  onTap: (bool isLiked) {
                    return onLikeButtonTapped(isLiked, weiboItem);
                  },
                  size: 21,
                  circleColor:
                  CircleColor(start: Colors.orange, end: Colors.deepOrange),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Colors.orange,
                    dotSecondaryColor: Colors.deepOrange,
                  ),
                  likeBuilder: (bool isLiked) {
                    return /*Icon(
                    Icons.home,
                    color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                    size: 20,
                  )*/
                      ImageSourceUtil.getImageByPath(
                        isLiked
                            ? Constant.ASSETS_IMG + 'ic_home_liked.webp'
                            : Constant.ASSETS_IMG + 'ic_home_like.webp',
                        21.0,
                        21.0,
                      );
                  },
                  likeCount: weiboItem.likeNum,
                  countBuilder: (int count, bool isLiked, String text) {
                    var color = isLiked ? Colors.orange : Colors.black;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "",
                        style: TextStyle(color: color, fontSize: 13),
                      );
                    } else
                      result = Text(
                        text,
                        style: TextStyle(color: color, fontSize: 13),
                      );
                    return result;
                  },
                ),
              ],
            ),
          ),
          flex: 1,
        ),
        new Flexible(
          child: InkWell(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              //   return RetWeetPage(
              //     mModel: weiboItem,
              //   );
              // }));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ImageSourceUtil.getImageByPath(
                  Constant.ASSETS_IMG + 'ic_home_comment.webp',
                  22.0,
                  22.0,
                ),
                Container(
                  child: Text(weiboItem.commentNum.toString() + "",
                      style: TextStyle(color: Colors.black, fontSize: 13)),
                  margin: EdgeInsets.only(left: 4.0),
                ),
              ],
            ),
          ),
          flex: 1,
        ),
        new Flexible(
          child: InkWell(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              //   return RetWeetPage(
              //     mModel: weiboItem,
              //   );
              // }));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ImageSourceUtil.getImageByPath(
                  Constant.ASSETS_IMG + 'ic_home_reweet.png',
                  22.0,
                  22.0,
                ),
                Container(
                  child: Text(weiboItem.zhuanfaNum.toString() + "",
                      style: TextStyle(color: Colors.black, fontSize: 13)),
                  margin: EdgeInsets.only(left: 4.0),
                ),
              ],
            ),
          ),
          flex: 1,
        ),
      ],
    );
  }

}
