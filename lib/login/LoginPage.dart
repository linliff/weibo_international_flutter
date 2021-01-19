import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/http/CommonService.dart';
import 'package:weibo_international_flutter/model/hotsearch/HotSearchBean.dart';
import 'package:weibo_international_flutter/model/hotsearch/HotSearchModel.dart';

import '../Constant.dart';
import '../utils/ImageSourceUtil.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<LoginPage> {
  double iconWidth = 17.0;
  double iconHeight = 17.0;

  List<HotSearchBean> hotSearchList = new List();

  @override
  void initState() {
    super.initState();
    _loadHotSearchData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: _buildListView(),
    );
  }

  void _loadHotSearchData() {
    CommonService().getHotSearch(20, (HotSearchModel _bean) {
      if (_bean.data.length > 0) {
        setState(() {
          //todo setstate之后页面重新渲染了吗
          hotSearchList = _bean.data;
        });
      }
    });
  }

  AppBar _buildAppBar() {
    return new AppBar(
      leading: IconButton(
        iconSize: 30,
        icon: ImageSourceUtil.getImageByPath(
            Constant.ASSETS_IMG + 'ic_logo.png', 30, 30),
      ),
      title: Text(
        "微博国际版",
        style: TextStyle(fontWeight: FontWeight.normal),
      ),
      actions: [
        IconButton(
            iconSize: 30,
            icon: Icon(Icons.search, color: Colors.black45)), //自定义图标,
      ],
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 10),
      shrinkWrap: true,
      itemCount: hotSearchList.length,
      itemBuilder: (context, index) =>
          _buildListItem(hotSearchList[index], index),
    );
  }

  Widget _buildListItem(HotSearchBean searchWord, int index) => Container(
        alignment: Alignment.center,
        width: 100,
        height: 50,
        child: _buildItemContent(searchWord, index),
      );

  Widget _buildItemContent(HotSearchBean searchWord, int index) {
    if (searchWord == null) {
      return null;
    }

    Widget hotSearchIcon = _buildItemIconWidget(index);

    return Column(
      children: <Widget>[
        Container(
          height: 40,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Text((index + 1).toString() + "",
                      style: TextStyle(
                        fontFamily: "HotSearch", // 指定该Text的字体。
                        fontSize: 14,
                        color: Colors.red,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text(searchWord.hot_word + "",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      )),
                ),
                Container(
                  child: Text(searchWord.hot_word_num,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: hotSearchIcon,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 0.5,
          color: Color(0xffE6E4E3),
        )
      ],
    );
  }

  Widget _buildItemIconWidget(int index) {
    Widget hotSearchIcon;
    if (index == 0) {
      hotSearchIcon = ImageSourceUtil.getImageByPath(
        Constant.ASSETS_IMG + 'ic_hot_hot.jpg',
        iconWidth,
        iconHeight,
      );
    } else if (index == 1 || index == 2) {
      hotSearchIcon = ImageSourceUtil.getImageByPath(
        Constant.ASSETS_IMG + 'ic_hot_new.jpg',
        iconWidth,
        iconHeight,
      );
    } else if (index >= 3 && index <= 7) {
      hotSearchIcon = ImageSourceUtil.getImageByPath(
        Constant.ASSETS_IMG + 'ic_hot_rec.jpg',
        iconWidth,
        iconHeight,
      );
    } else {
      hotSearchIcon = Container(
        height: iconHeight,
      );
    }
    return hotSearchIcon;
  }
}

/**
    import 'package:flutter/material.dart';
    class BuilderListView extends StatelessWidget {
    final data = <Color>[
    Colors.purple[50],
    Colors.purple[100],
    Colors.purple[200],
    Colors.purple[300],
    Colors.purple[400],
    Colors.purple[500],
    Colors.purple[600],
    Colors.purple[700],
    Colors.purple[800],
    Colors.purple[900],
    ];

    @override
    Widget build(BuildContext context) {
    return Container(
    height: 200,
    child: ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index) => _buildItem(data[index]),
    ),
    );
    }

    String colorString(Color color) =>
    "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";

    Widget _buildItem(Color color) => Container(
    alignment: Alignment.center,
    width: 100,
    height: 50,
    color: color,
    child: Text(
    colorString(color),
    style: TextStyle(color: Colors.white, shadows: [
    Shadow(color: Colors.black, offset: Offset(.5, .5), blurRadius: 2)
    ]),
    ),
    );
    }

 **/
