import 'package:json_annotation/json_annotation.dart';

part 'WeiboUserBean.g.dart';

@JsonSerializable()
class WeiboUserBean {
  int id;
  String nick;
  String decs;
  String headurl;
  int relation;
  int ismember;
  int isvertify;

  WeiboUserBean({this.id, this.nick, this.headurl, this.decs, this.relation, this.ismember, this.isvertify});

  factory WeiboUserBean.fromJson(Map<String, dynamic> json) =>
      _$WeiboUserBeanFromJson(json);

}
