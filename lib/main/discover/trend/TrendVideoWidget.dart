import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/Constant.dart';
import 'package:weibo_international_flutter/model/discover/video/VideoBean.dart';
import 'package:weibo_international_flutter/utils/DataUtil.dart';

class TrendVideoWidget extends StatelessWidget {
  VideoBean videoData;

  List<String> pic = new List();

  TrendVideoWidget(VideoBean data) {
    videoData = data;
    pic.add(videoData.coverimg);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      color: Colors.white,
      child: _getContentItem(context, videoData),
    );
  }

  Widget _getContentItem(BuildContext context, VideoBean videoBean) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 100,
            width: MediaQuery.of(context).size.width * 3 / 8,
            child: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 3 / 8,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholder:
                          AssetImage(Constant.ASSETS_IMG + 'img_default.png'),
                      image: NetworkImage(
                        videoBean.coverimg,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    child: new Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,

                      children: <Widget>[
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Text(
                              DateUtil.getFormatTime4(videoBean.videotime)
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 40,
                  child: Text(videoBean.introduce,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14.0, color: Colors.black)),
                  //  margin: EdgeInsets.only(left: 60),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.all(2),
                  child: Text(
                    videoBean.recommengstr,
                    style: TextStyle(fontSize: 11, color: Color(0xffFB9213)),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      //圆角
                      Radius.circular(5.0),
                    ),
                    color: Color(0xffFEF5E2),
                  ),
                ),
                Container(
                  child: Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text(
                        "@" + videoBean.username,
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Text(
                        videoBean.playnum.toString(),
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      )),
                      Container(
                          child: Text(
                        "次观看 · ",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )),
                      Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Center(
                            child: Text(
                              DateUtil.getFormatTime(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          videoBean.createtime))
                                  .toString(),
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
