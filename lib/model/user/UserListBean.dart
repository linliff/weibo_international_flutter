import 'package:json_annotation/json_annotation.dart';

import 'UserBean.dart';

part 'UserListBean.g.dart';

@JsonSerializable()
class UserListBean {
  List<UserBean> hotusers;

  UserListBean({this.hotusers});

  factory UserListBean.fromJson(Map<String, dynamic> json) =>
      _$UserListBeanFromJson(json);

}
