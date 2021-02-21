import 'package:json_annotation/json_annotation.dart';
import 'package:weibo_international_flutter/model/RootModel.dart';
import 'package:weibo_international_flutter/model/discover/video/VideoListBean.dart';
import 'package:weibo_international_flutter/model/list/WeiboListBean.dart';

part 'VideoModel.g.dart';

@JsonSerializable()
class VideoModel extends RootModel<VideoListBean> {
  VideoModel(VideoListBean data, int errorCode, String errorMsg)
      : super(data, errorCode, errorMsg);

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  toJson() => _$VideoModelToJson(this);
}
