import 'package:json_annotation/json_annotation.dart';

part 'HotSearchBean.g.dart';

@JsonSerializable()
class HotSearchBean{

  String hot_word;
  String hot_word_num;

  HotSearchBean(this.hot_word, this.hot_word_num);

  factory HotSearchBean.fromJson(Map<String, dynamic> json) =>
      _$HotSearchBeanFromJson(json);
}