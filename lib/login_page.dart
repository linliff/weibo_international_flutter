import 'package:flutter/material.dart';

import 'constant/constant.dart';
import 'utils/image_source_util.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
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
      ),
    );
  }

}
