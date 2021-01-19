import 'package:json_annotation/json_annotation.dart';
import 'package:weibo_international_flutter/model/RootModel.dart';

import 'HotSearchBean.dart';

part 'HotSearchModel.g.dart';

@JsonSerializable()
class HotSearchModel extends RootModel<List<HotSearchBean>> {
  HotSearchModel(
      List<HotSearchBean> data, int errorCode, String errorMsg)
      : super(data, errorCode, errorMsg);

  factory HotSearchModel.fromJson(Map<String, dynamic> json) =>
      _$HotSearchModelFromJson(json);

  toJson() => _$HotSearchModelToJson(this);
}
