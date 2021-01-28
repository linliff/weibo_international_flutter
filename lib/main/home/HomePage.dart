import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/http/CommonService.dart';
import 'package:weibo_international_flutter/main/home/WeiboListPage.dart';

class HomePage extends StatefulWidget {
  @override
  WeiboListPageState createState() => WeiboListPageState();
}

class WeiboListPageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WeiboListPage(
      request: (page) {
        return CommonService().getWeiboList(page);
      },
    );
  }
}
