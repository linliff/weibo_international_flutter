import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/Constant.dart';

class TrendFourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 10),
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Expanded(
            child: _getItemWidget('ic_ditu.png', '疫情地图'),
            flex: 1,
          ),
          new Expanded(
            child: _getItemWidget('ic_tongcheng.png', '同城'),
            flex: 1,
          ),
          new Expanded(
            child: _getItemWidget('ic_huati.png', '超级话题'),
            flex: 1,
          ),
          new Expanded(
            child: _getItemWidget('ic_bangdan.png', '榜单'),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget _getItemWidget(String imgName, String title) {
    return Column(
      children: <Widget>[
        Image.asset(
          Constant.ASSETS_IMG + imgName,
          width: 30.0,
          height: 30.0,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
