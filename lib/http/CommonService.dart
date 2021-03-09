import 'dart:async';

import 'package:dio/dio.dart';
import 'package:weibo_international_flutter/model/hotsearch/HotSearchModel.dart';
import 'package:weibo_international_flutter/model/user/UserListModel.dart';

import 'Api.dart';

class CommonService {
  /// 获取热搜词
  void getHotSearch(int num, Function callback) async {
    Map<String, dynamic> params = new Map();
    params["num"] = num;
    Dio().get(Api.HOT_SEARCH_LIST, queryParameters: params).then((response) {
      callback(HotSearchModel.fromJson(response.data));
    });
  }

  ///热门用户
  void getHotUser(Function callback) async {
    Dio().get(Api.HOT_USER_LIST).then((response) {
      callback(UserListModel.fromJson(response.data));
    });
  }

  ///微博列表
  Future<Response> getWeiboList(int page) async {
    FormData formData = new FormData.fromMap(
        {"cateid": 4, "paneNum": page, "pageSize": 20, "userId": 123});
    return Dio().post(Api.WEIBO_LIST, data: formData);
  }

  ///发现页面的趋势列表
  Future<Response> getDiscoverTrendList(int page) async {
    FormData formData = new FormData.fromMap({"paneNum": page, "pageSize": 20});
    return Dio().post(Api.DISVOVER_TREND_LIST, data: formData);
  }

  ///发现页面的热门列表
  Future<Response> getDiscoverHotList(int page) async {
    FormData formData = new FormData.fromMap({"paneNum": page, "pageSize": 20});
    return Dio().post(Api.DISVOVER_HOT_LIST, data: formData);
  }

}
