import 'package:json_annotation/json_annotation.dart';
import 'package:weibo_international_flutter/model/RootModel.dart';
import 'package:weibo_international_flutter/model/list/WeiboListBean.dart';

part 'WeiboListModel.g.dart';

@JsonSerializable()
class WeiboListModel extends RootModel<WeiboListBean> {
  WeiboListModel(WeiboListBean data, int errorCode, String errorMsg)
      : super(data, errorCode, errorMsg);

  factory WeiboListModel.fromJson(Map<String, dynamic> json) =>
      _$WeiboListModelFromJson(json);

  toJson() => _$WeiboListModelToJson(this);
}
