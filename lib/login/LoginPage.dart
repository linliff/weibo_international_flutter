import 'package:flutter/material.dart';
import 'package:weibo_international_flutter/Constant.dart';
import 'package:weibo_international_flutter/http/CommonService.dart';
import 'package:weibo_international_flutter/login/LoginPageContentWidget.dart';
import 'package:weibo_international_flutter/main/index/IndexPage.dart';
import 'package:weibo_international_flutter/model/hotsearch/HotSearchModel.dart';
import 'package:weibo_international_flutter/model/user/UserListModel.dart';
import 'package:weibo_international_flutter/utils/ImageSourceUtil.dart';

/// 引导登录页面，没有实现真正的登录，点击后直接进入首页
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<LoginPage> {

  List<Object> hotSearchList = new List();
  List<Object> hotUserList = new List();

  @override
  void initState() {
    super.initState();

    _loadHotUserData();
    _loadHotSearchData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildAppBar(),
      body: LoginPageContentWidget(hotSearchList, hotUserList),
      floatingActionButton: _buildFloatingLoginButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  FloatingActionButton _buildFloatingLoginButton() {
    return FloatingActionButton.extended(
        label: Text("登录/注册",
            style: TextStyle(
              fontSize: 16,
            )),
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return IndexPage();
          }));
        },
        backgroundColor: Colors.orange);
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

  //===============网络请求==========

  /// 获取热搜数据
  void _loadHotSearchData() {
    CommonService().getHotSearch(20, (HotSearchModel _bean) {
      if (_bean.data.length > 0) {
        setState(() {
          //todo setstate之后页面重新渲染了吗
          hotSearchList.addAll(_bean.data);
          hotSearchList.insert(0, "热门搜索");
        });
      }
    });
  }

  ///  获取热门用户
  void _loadHotUserData() {
    CommonService().getHotUser((UserListModel _bean) {
      if (_bean.data != null) {
        setState(() {
          //todo setstate之后页面重新渲染了吗
          hotUserList.addAll(_bean.data.hotusers);
          hotUserList.insert(0, "热门微博用户");
        });
      }
    });
  }
}
