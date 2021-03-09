/// API取自 https://github.com/huangruiLearn/flutter_hrlweibo

class Api {
  static const BASE_URL = 'http://212.64.95.5:8080/hrlweibo/';

  static final String HOT_SEARCH_LIST =
      "https://v1.alapi.cn/api/new/wbtop"; //热搜列表

  static String HOT_USER_LIST =
      BASE_URL + 'manage/hrlweibo/getWeiBoAtUserList.do'; //获获取热门用户

  static String WEIBO_LIST = BASE_URL + 'manage/hrlweibo/list.do'; // 获取首页微博列表

  static String DISVOVER_TREND_LIST =
      BASE_URL + 'manage/hrlvedio/hotlist.do'; //发现-趋势

  static String DISVOVER_HOT_LIST =
      BASE_URL + 'manage/hrlvedio/recommendlist.do'; //发现-热门


}
