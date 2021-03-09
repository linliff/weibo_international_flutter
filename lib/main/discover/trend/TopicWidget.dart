import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/GlobalConfig.dart';

class TopicWidget extends StatelessWidget {
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
                _getItemWidget("#货拉拉涉事司机被批捕货拉拉涉事司机被批捕#"),
                Container(
                  width: 20,
                ),
                _getItemWidget("#个税起征点有必要提高吗个税起征点有必要提高吗#"),
              ],
            ),
            Container(
              height: 10,
            ),
            Row(
              children: <Widget>[
                _getItemWidget("#女生到年龄就一定要结婚吗#"),
                Container(
                  width: 20,
                ),
                _getItemWidget("#黑寡妇引进#"),
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
                  child: Text('热门话题',
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
      ],
    );
  }

  Widget _getItemWidget(content) {
    return new Expanded(
      child: Text(
        content,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      flex: 1,
    );
  }
}
