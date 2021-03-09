import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/Constant.dart';
import 'package:weibo_international_flutter/model/discover/video/VideoBean.dart';
import 'package:weibo_international_flutter/utils/ImageSourceUtil.dart';
import 'package:weibo_international_flutter/widget/MatchText.dart';
import 'package:weibo_international_flutter/widget/ParsedText.dart';
import 'package:weibo_international_flutter/widget/likebutton/LikeButton.dart';
import 'package:weibo_international_flutter/widget/likebutton/utils/LikeButtonModel.dart';

class HotItemContentWidget extends StatelessWidget {

  VideoBean videoData;

  List<String> pic = new List();

  HotItemContentWidget(VideoBean data) {
    videoData = data;
    pic.add(videoData.coverimg);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: _iItemWidget(context, videoData),
    );
  }

  Widget _iItemWidget(BuildContext context, VideoBean videoData) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _picWidget(context, videoData.coverimg),
          _textContent(videoData.introduce, context),
          _getBottomWidget(context, videoData),
        ],
      ),
    );
  }

  Widget _textContent(String mTextContent, BuildContext context) {
    mTextContent = mTextContent.replaceAll("\\n", "\n");
    return Container(
        alignment: FractionalOffset.centerLeft,
        margin: EdgeInsets.only(top: 5.0, left: 15, right: 15, bottom: 10),
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
                onTap: (String content, String contentId) async {}),
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

  Widget _picWidget(BuildContext context, String picUrl) {
    if (picUrl != null) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 0.0),
          child: Container(
            constraints: BoxConstraints(
                maxHeight: 250, maxWidth: 250, minHeight: 200, minWidth: 200),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.network(picUrl, fit: BoxFit.cover),
            ),
          ));
    } else {
      return Container(
        height: 0,
      );
    }
  }

  Widget _getBottomWidget(BuildContext context, VideoBean videoData) {
    return Row(
      children: <Widget>[
        new Flexible(
          child: _getUserWidget(videoData.username, videoData.userheadurl),
          flex: 1,
        ),
        new Flexible(
          child: _getRePraCom(context, videoData),
          flex: 1,
        )
      ],
    );
  }

  Widget _getUserWidget(String name, String headerUrl) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 15, right: 10),
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              image: DecorationImage(
                  image: NetworkImage(headerUrl), fit: BoxFit.cover),
            )),
        Text(
          name,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }


  Widget _getRePraCom(BuildContext context, VideoBean videoData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        LikeButton(
          onTap: (bool isLiked) {},
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
          countBuilder: (int count, bool isLiked, String text) {
            var color = isLiked ? Colors.orange : Colors.black;
            Widget result;
            if (count == 0) {
              result = Text(
                '${videoData.playnum}',
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
        Container(
          width: 10,
        ),
        ImageSourceUtil.getImageByPath(
          Constant.ASSETS_IMG + 'ic_home_comment.webp',
          22.0,
          22.0,
        ),
        Container(
          child: Text('${videoData.zannum}',
              style: TextStyle(color: Colors.black, fontSize: 13)),
          margin: EdgeInsets.only(left: 4.0),
        ),
        Container(
          width: 10,
        ),
        ImageSourceUtil.getImageByPath(
          Constant.ASSETS_IMG + 'ic_discover_share.png',
          17.0,
          16.0,
        ),
        Container(
          width: 20,
        ),
      ],
    );
  }
}
