import 'package:json_annotation/json_annotation.dart';

part 'UserBean.g.dart';

@JsonSerializable()
class UserBean {
  String id;
  String nick;
  String decs;
  String headurl;
  int relation;
  int ismember;
  int isvertify;

  UserBean({this.id, this.nick, this.headurl, this.decs, this.relation, this.ismember, this.isvertify});

  factory UserBean.fromJson(Map<String, dynamic> json) =>
      _$UserBeanFromJson(json);

}
