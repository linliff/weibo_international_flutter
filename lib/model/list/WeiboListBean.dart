import 'package:json_annotation/json_annotation.dart';
import 'package:weibo_international_flutter/model/list/WeiboItemBean.dart';
part 'WeiboListBean.g.dart';

@JsonSerializable()
class WeiboListBean {
  int pageNum;
  int pageSize;
  int size;
  int startRow;
  int endRow;
  int total;
  int pages;
  List<WeiboItemBean> list;
  int firstPage;
  int prePage;
  int nextPage;
  int lastPage;
  bool isFirstPage;
  bool isLastPage;
  bool hasPreviousPage;
  bool hasNextPage;
  int navigatePages;

  WeiboListBean({
    int pageNum,
    int pageSize,
    int size,
    int startRow,
    int endRow,
    int total,
    int pages,
    List<WeiboItemBean> list,
    int firstPage,
    int prePage,
    int nextPage,
    int lastPage,
    bool isFirstPage,
    bool isLastPage,
    bool hasPreviousPage,
    bool hasNextPage,
    int navigatePages,
  }) {
    this.pageNum = pageNum;
    this.pageSize = pageSize;
    this.size = size;
    this.startRow = startRow;
    this.endRow = endRow;
    this.total = total;
    this.pages = pages;
    this.list = list;
    this.firstPage = firstPage;
    this.prePage = prePage;
    this.nextPage = nextPage;
    this.lastPage = lastPage;
    this.isFirstPage = isFirstPage;
    this.isLastPage = isLastPage;
    this.hasPreviousPage = hasPreviousPage;
    this.hasNextPage = hasNextPage;
    this.navigatePages = navigatePages;
  }

  factory WeiboListBean.fromJson(Map<String, dynamic> json) =>
      _$WeiboListBeanFromJson(json);
}
