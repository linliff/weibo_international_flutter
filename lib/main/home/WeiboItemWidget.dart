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

class WeiboItemWidget extends StatelessWidget {
  WeiboItemBean weiboData;

  WeiboItemWidget(WeiboItemBean data) {
    weiboData = data;
  }

  @override
  Widget build(BuildContext context) {
    return _iItemWidget(context, weiboData);
  }
}

Widget _iItemWidget(BuildContext context, WeiboItemBean weiboItem) {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _userInfo(context, weiboItem),
        _textContent(weiboItem.content, context),
        _nineGrid(context, weiboItem.picurl),
        _retWeetLayout(context, weiboItem),
        Visibility(
          visible: true,
          child: Column(
            children: <Widget>[
              _rePraCom(context, weiboItem),
              new Container(
                height: 12,
                color: Color(0xffEFEFEF),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _userInfo(BuildContext context, WeiboItemBean weiboItem) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 2.0),
    child: Row(
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(right: 5),
            child: weiboItem.userInfo.isvertify == 0
                ? Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: NetworkImage(weiboItem.userInfo.headurl),
                          fit: BoxFit.cover),
                    ))
                : Stack(
                    children: <Widget>[
                      Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: NetworkImage(weiboItem.userInfo.headurl),
                                fit: BoxFit.cover),
                          )),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          child: ImageSourceUtil.getImageByPath(
                            (weiboItem.userInfo.isvertify == 1)
                                ? Constant.ASSETS_IMG + 'home_vertify.webp'
                                : Constant.ASSETS_IMG + 'home_vertify2.webp',
                            15.0,
                            15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Center(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(6.0, 0.0, 0.0, 0.0),
                      child: Text(weiboItem.userInfo.nick,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: weiboItem.userInfo.ismember == 0
                                  ? Colors.black
                                  : Color(0xffF86119)))),
                ),
                Center(
                  child: weiboItem.userInfo.ismember == 0
                      ? new Container()
                      : Container(
                          margin: EdgeInsets.only(left: 5),
                          child: ImageSourceUtil.getImageByPath(
                            Constant.ASSETS_IMG + 'home_memeber.webp',
                            15.0,
                            13.0,
                          ),
                        ),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(6.0, 2.0, 0.0, 0.0),
                child: weiboItem.tail.isEmpty
                    ? Text(weiboItem.userInfo.decs,
                        style:
                            TextStyle(color: Color(0xff808080), fontSize: 11.0))
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                              DateUtil.getFormatTime(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      weiboItem.createtime)),
                              style: TextStyle(
                                  color: Color(0xff808080), fontSize: 11.0)),
                          Container(
                            margin: EdgeInsets.only(left: 7, right: 7),
                            child: Text("来自",
                                style: TextStyle(
                                    color: Color(0xff808080), fontSize: 11.0)),
                          ),
                          Text(weiboItem.tail,
                              style: TextStyle(
                                  color: Color(0xff5B778D), fontSize: 11.0))
                        ],
                      )),
          ],
        )
      ],
    ),
  );
}

Widget _textContent(String mTextContent, BuildContext context) {
  //如果字数过长
  if (mTextContent.length > 150) {
    mTextContent = mTextContent.substring(0, 148) + ' ... ' + '全文';
  }
  mTextContent = mTextContent.replaceAll("\\n", "\n");
  return Container(
      alignment: FractionalOffset.centerLeft,
      margin: EdgeInsets.only(top: 5.0, left: 15, right: 15, bottom: 5),
      child: ParsedText(
        text: mTextContent,
        style: TextStyle(
          height: 1.5,
          fontSize: 15,
          color: Colors.black,
        ),
        parse: <MatchText>[
          MatchText(
              pattern: r"\[(@[^:]+):([^\]]+)\]",
              style: TextStyle(
                color: Color(0xff5B778D),
                fontSize: 15,
              ),
              renderText: ({String str, String pattern}) {
                Map<String, String> map = Map<String, String>();
                RegExp customRegExp = RegExp(pattern);
                Match match = customRegExp.firstMatch(str);
                map['display'] = match.group(1);
                map['value'] = match.group(2);
                print("正则:" + match.group(1) + "---" + match.group(2));
                return map;
              },
              onTap: (content, contentId) {}),
          MatchText(
              pattern: '#.*?#',
              style: TextStyle(
                color: Color(0xff5B778D),
                fontSize: 15,
              ),
              renderText: ({String str, String pattern}) {
                Map<String, String> map = Map<String, String>();

                String idStr =
                    str.substring(str.indexOf(":") + 1, str.lastIndexOf("#"));
                String showStr = str
                    .substring(str.indexOf("#"), str.lastIndexOf("#") + 1)
                    .replaceAll(":" + idStr, "");
                map['display'] = showStr;
                map['value'] = idStr;
                return map;
              },
              onTap: (String content, String contentId) async {
                print("id是:" + contentId.toString());
              }),
          MatchText(
            pattern: '(\\[/).*?(\\])',
            style: TextStyle(
              fontSize: 15,
            ),
            renderText: ({String str, String pattern}) {
              Map<String, String> map = Map<String, String>();
              print("表情的正则:" + str);
              String mEmoji2 = "";
              try {
                String mEmoji = str.replaceAll(RegExp('(\\[/)|(\\])'), "");
                int mEmojiNew = int.parse(mEmoji);
                mEmoji2 = String.fromCharCode(mEmojiNew);
              } on Exception catch (_) {
                mEmoji2 = str;
              }
              map['display'] = mEmoji2;

              return map;
            },
          ),
          MatchText(
              pattern: '全文',
              style: TextStyle(
                color: Color(0xff5B778D),
                fontSize: 15,
              ),
              renderText: ({String str, String pattern}) {
                Map<String, String> map = Map<String, String>();
                map['display'] = '全文';
                map['value'] = '全文';
                return map;
              },
              onTap: (display, value) async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: new Text("Mentions clicked"),
                      content: new Text("点击全文了"),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("Close"),
                          onPressed: () {},
                        ),
                      ],
                    );
                  },
                );
              }),
        ],
      ));
}

Widget _retWeetLayout(BuildContext context, WeiboItemBean weiboItem) {
  if (weiboItem.containZf) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Container(
          padding: EdgeInsets.only(bottom: 12),
          margin: EdgeInsets.only(top: 5),
          color: Color(0xffF7F7F7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _textContent(
                  '[@' +
                      weiboItem.zfNick +
                      ':' +
                      weiboItem.zfUserId +
                      ']' +
                      ":" +
                      weiboItem.zfContent,
                  context),
              _nineGrid(context, weiboItem.zfPicurl),
            ],
          )),
    );
  } else {
    return Container(
      height: 0,
    );
  }
}

Widget _rePraCom(BuildContext context, WeiboItemBean weiboItem) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        height: 50,
      ),
      new Flexible(
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              LikeButton(
                isLiked: weiboItem.zanStatus == 1,
                onTap: (bool isLiked) {
                  return _onLikeButtonTapped(isLiked, weiboItem);
                },
                size: 21,
                circleColor:
                    CircleColor(start: Colors.orange, end: Colors.deepOrange),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Colors.orange,
                  dotSecondaryColor: Colors.deepOrange,
                ),
                likeBuilder: (bool isLiked) {
                  return ImageSourceUtil.getImageByPath(
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
          onTap: () {},
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
          onTap: () {},
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

Future<bool> _onLikeButtonTapped(bool isLiked, WeiboItemBean weiboItem) async {
  final Completer<bool> completer = new Completer<bool>();
  return completer.future;
}

//九宫格图片布局
Widget _nineGrid(BuildContext context, List<String> picUrlList) {
  List<String> picList = picUrlList;
  //如果包含九宫格图片
  if (picList != null && picList.length > 0) {
    //一共有几张图片
    num len = picList.length;
    //算出一共有几行
    int rowlength = 0;
    //一共有几列
    int conlength = 0;
    if (len <= 3) {
      conlength = len;
      rowlength = 1;
    } else if (len <= 6) {
      conlength = 3;
      rowlength = 2;
      if (len == 4) {
        conlength = 2;
      }
    } else {
      conlength = 3;
      rowlength = 3;
    }
    //一行的组件
    List<Widget> imgList = [];
    //一行包含三个图片组件
    List<List<Widget>> rows = [];
    //遍历行数和列数,计算出宽高生成每个图片组件,
    for (var row = 0; row < rowlength; row++) {
      List<Widget> rowArr = [];
      for (var col = 0; col < conlength; col++) {
        num index = row * conlength + col;
        num screenWidth = MediaQuery.of(context).size.width;
        double cellWidth = (screenWidth - 40) / 3;
        double itemW = 0;
        double itemH = 0;
        if (len == 1) {
          itemW = cellWidth;
          itemH = cellWidth;
        } else if (len <= 3) {
          itemW = cellWidth;
          itemH = cellWidth;
        } else if (len <= 6) {
          itemW = cellWidth;
          itemH = cellWidth;
          if (len == 4) {
            itemW = cellWidth;
            itemH = cellWidth;
          }
        } else {
          itemW = cellWidth;
          itemH = cellWidth;
        }
        if (len == 1) {
          rowArr.add(Container(
            constraints: BoxConstraints(
                maxHeight: 250, maxWidth: 250, minHeight: 200, minWidth: 200),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.network(picList[index], fit: BoxFit.cover),
            ),
          ));
        } else {
          if (index < len) {
            EdgeInsets mMargin;
            if (len == 4) {
              if (index == 0) {
                mMargin = const EdgeInsets.only(right: 2.5, bottom: 5);
              } else if (index == 1) {
                mMargin = const EdgeInsets.only(left: 2.5, bottom: 5);
              } else if (index == 2) {
                mMargin = const EdgeInsets.only(right: 2.5);
              } else if (index == 3) {
                mMargin = const EdgeInsets.only(left: 2.5);
              }
            } else {
              if (index == 1 || index == 4 || index == 7) {
                mMargin =
                    const EdgeInsets.only(left: 2.5, right: 2.5, bottom: 5);
              } else if (index == 0 || index == 3 || index == 6) {
                mMargin = const EdgeInsets.only(right: 2.5, bottom: 5);
              } else if (index == 2 || index == 5 || index == 8) {
                mMargin = const EdgeInsets.only(left: 2.5, bottom: 5);
              }
            }

            rowArr.add(Container(
              child: Container(
                margin: mMargin,
                child: Image.network(
                  picList[index],
                  fit: BoxFit.cover,
                  width: itemW,
                  height: itemH,
                ),
              ),
            ));
          }
        }
      }
      rows.add(rowArr);
    }
    for (var row in rows) {
      imgList.add(Row(
        children: row,
      ));
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
      child: Column(
        children: imgList,
      ),
    );
  } else {
    return Container(
      height: 0,
    );
  }
}
