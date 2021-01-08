import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/index_page.dart';

import 'constant/constant.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SplashState();
  }
}

class SplashState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(new Duration(seconds: 1), () {

      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return IndexPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
        backgroundColor: Colors.white,
        body: new Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      Constant.ASSETS_IMG + 'welcome_android_logo.png',
                      width: 100.0,
                      height: 100.0,
                    ),
                    color: Color(0xFFFFFFFF),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
