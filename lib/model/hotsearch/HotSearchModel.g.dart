// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HotSearchModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotSearchModel _$HotSearchModelFromJson(Map<String, dynamic> json) {
  return HotSearchModel(
    (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : HotSearchBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['errorCode'] as int,
    json['errorMsg'] as String,
  );
}

Map<String, dynamic> _$HotSearchModelToJson(HotSearchModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };
