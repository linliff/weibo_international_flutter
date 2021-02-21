import 'package:json_annotation/json_annotation.dart';
import 'package:weibo_international_flutter/model/discover/video/VideoBean.dart';

part 'VideoListBean.g.dart';

@JsonSerializable()
class VideoListBean {
  int pageNum;
  int pageSize;
  int size;
  int startRow;
  int endRow;
  int total;
  int pages;
  List<VideoBean> list;
  int firstPage;
  int prePage;
  int nextPage;
  int lastPage;
  bool isFirstPage;
  bool isLastPage;
  bool hasPreviousPage;
  bool hasNextPage;
  int navigatePages;

  VideoListBean({
    int pageNum,
    int pageSize,
    int size,
    int startRow,
    int endRow,
    int total,
    int pages,
    List<VideoBean> list,
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

  factory VideoListBean.fromJson(Map<String, dynamic> json) =>
      _$VideoListBeanFromJson(json);
}
