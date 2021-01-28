// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WeiboItemBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeiboItemBean _$WeiboItemBeanFromJson(Map<String, dynamic> json) {
  return WeiboItemBean(
    weiboId: json['weiboId'] as String,
    categoryId: json['categoryId'] as String,
    content: json['content'] as String,
    userInfo: json['userInfo'] == null
        ? null
        : WeiboUserBean.fromJson(json['userInfo'] as Map<String, dynamic>),
    picurl: (json['picurl'] as List)?.map((e) => e as String)?.toList(),
    zfContent: json['zfContent'] as String,
    zfNick: json['zfNick'] as String,
    zfUserId: json['zfUserId'] as String,
    zfPicurl: (json['zfPicurl'] as List)?.map((e) => e as String)?.toList(),
    zfWeiBoId: json['zfWeiBoId'] as String,
    containZf: json['containZf'] as bool,
    vediourl: json['vediourl'] as String,
    zfVedioUrl: json['zfVedioUrl'] as String,
    tail: json['tail'] as String,
    createtime: json['createtime'] as int,
    zanStatus: json['zanStatus'] as int,
    zhuanfaNum: json['zhuanfaNum'] as int,
    likeNum: json['likeNum'] as int,
    commentNum: json['commentNum'] as int,
  );
}

Map<String, dynamic> _$WeiboItemBeanToJson(WeiboItemBean instance) =>
    <String, dynamic>{
      'weiboId': instance.weiboId,
      'categoryId': instance.categoryId,
      'content': instance.content,
      'userInfo': instance.userInfo,
      'picurl': instance.picurl,
      'zfContent': instance.zfContent,
      'zfNick': instance.zfNick,
      'zfUserId': instance.zfUserId,
      'zfPicurl': instance.zfPicurl,
      'zfWeiBoId': instance.zfWeiBoId,
      'zfVedioUrl': instance.zfVedioUrl,
      'containZf': instance.containZf,
      'vediourl': instance.vediourl,
      'tail': instance.tail,
      'createtime': instance.createtime,
      'zanStatus': instance.zanStatus,
      'zhuanfaNum': instance.zhuanfaNum,
      'likeNum': instance.likeNum,
      'commentNum': instance.commentNum,
    };
