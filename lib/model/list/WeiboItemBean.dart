

import 'package:json_annotation/json_annotation.dart';
import 'package:weibo_international_flutter/model/list/WeiboUserBean.dart';

part 'WeiboItemBean.g.dart';

@JsonSerializable()
class WeiboItemBean {
  String weiboId;
  String categoryId;
  String content;
  WeiboUserBean userInfo;
  List<String> picurl;
  String zfContent;
  String zfNick;
  String zfUserId;
  List<String> zfPicurl;
  String zfWeiBoId;

  String zfVedioUrl;
  bool containZf;

  String vediourl;
  String tail;
  int  createtime;
  int zanStatus;

  int zhuanfaNum;
  int likeNum;
  int commentNum;


  WeiboItemBean(
      {this.weiboId,
        this.categoryId,
        this.content,
        this.userInfo,
        this.picurl,
        this.zfContent,
        this.zfNick,
        this.zfUserId,
        this.zfPicurl,
        this.zfWeiBoId,
        this.containZf,
        this.vediourl,
        this.zfVedioUrl,
        this.tail,
        this.createtime,
        this.zanStatus,
        this.zhuanfaNum,
        this.likeNum,
        this.commentNum
       });


  factory WeiboItemBean.fromJson(Map<String, dynamic> json) =>
      _$WeiboItemBeanFromJson(json);

}