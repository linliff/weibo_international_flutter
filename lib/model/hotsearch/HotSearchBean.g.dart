// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HotSearchBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotSearchBean _$HotSearchBeanFromJson(Map<String, dynamic> json) {
  return HotSearchBean(
    json['hot_word'] as String,
    json['hot_word_num'] as String,
  );
}

Map<String, dynamic> _$HotSearchBeanToJson(HotSearchBean instance) =>
    <String, dynamic>{
      'hot_word': instance.hot_word,
      'hot_word_num': instance.hot_word_num,
    };
