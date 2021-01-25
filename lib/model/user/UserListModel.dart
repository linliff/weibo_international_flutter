import 'package:json_annotation/json_annotation.dart';
import 'package:weibo_international_flutter/model/RootModel.dart';

import 'UserListBean.dart';

part 'UserListModel.g.dart';

@JsonSerializable()
class UserListModel extends RootModel<UserListBean> {
  UserListModel(UserListBean data, int errorCode, String errorMsg)
      : super(data, errorCode, errorMsg);

  factory UserListModel.fromJson(Map<String, dynamic> json) =>
      _$UserListModelFromJson(json);

  toJson() => _$UserListModelToJson(this);
}
