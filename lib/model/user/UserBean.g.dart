// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBean _$UserBeanFromJson(Map<String, dynamic> json) {
  return UserBean(
    id: json['id'] as String,
    nick: json['nick'] as String,
    headurl: json['headurl'] as String,
    decs: json['decs'] as String,
    relation: json['relation'] as int,
    ismember: json['ismember'] as int,
    isvertify: json['isvertify'] as int,
  );
}

Map<String, dynamic> _$UserBeanToJson(UserBean instance) => <String, dynamic>{
      'id': instance.id,
      'nick': instance.nick,
      'decs': instance.decs,
      'headurl': instance.headurl,
      'relation': instance.relation,
      'ismember': instance.ismember,
      'isvertify': instance.isvertify,
    };
