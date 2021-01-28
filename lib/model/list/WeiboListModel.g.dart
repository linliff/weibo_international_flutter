// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeiboListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeiboListModel _$WeiboListModelFromJson(Map<String, dynamic> json) {
  return WeiboListModel(
    json['data'] == null
        ? null
        : WeiboListBean.fromJson(json['data'] as Map<String, dynamic>),
    json['errorCode'] as int,
    json['errorMsg'] as String,
  );
}

Map<String, dynamic> _$WeiboListModelToJson(WeiboListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
