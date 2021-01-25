// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserListBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserListBean _$UserListBeanFromJson(Map<String, dynamic> json) {
  return UserListBean(
    hotusers: (json['hotusers'] as List)
        ?.map((e) =>
            e == null ? null : UserBean.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserListBeanToJson(UserListBean instance) =>
    <String, dynamic>{
      'hotusers': instance.hotusers,
    };
