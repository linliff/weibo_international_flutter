
import 'package:json_annotation/json_annotation.dart';

part 'VideoBean.g.dart';

@JsonSerializable()
class VideoBean {
  int id;
  String coverimg;
  int videotime;
  int playnum;
  int userid;
  String tag;
  String recommengstr;
  int type;
  String introduce;
  int createtime;
  String username;
  String userheadurl;
  int userisvertify;
  int zannum;
  String videourl;
  int userfancount;
  String userdesc;

  VideoBean(
      {this.id,
      this.coverimg,
      this.videotime,
      this.playnum,
      this.userid,
      this.tag,
      this.recommengstr,
      this.type,
      this.introduce,
      this.createtime,
      this.username,
      this.userheadurl,
      this.userisvertify,
      this.zannum,
      this.videourl,
      this.userfancount,
      this.userdesc});

  factory VideoBean.fromJson(Map<String, dynamic> json) =>
      _$VideoBeanFromJson(json);
}
