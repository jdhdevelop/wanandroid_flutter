class HomeArticleModel {
  int curPage;
  List<Datas> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  HomeArticleModel.fromJson(Map<String,dynamic> json)
    : curPage = json["curPage"],
      datas = (json["datas"] as List).map((i)=>Datas.fromJson(i)).toList(),
      offset = json["offset"],
      over = json["over"],
      pageCount = json["pageCount"],
      size = json["size"],
      total = json["total"];

}

//            {
//                "apkLink":"",
//                "audit":1,
//                "author":"",
//                "canEdit":false,
//                "chapterId":502,
//                "chapterName":"自助",
//                "collect":false,
//                "courseId":13,
//                "desc":"",
//                "descMd":"",
//                "envelopePic":"",
//                "fresh":true,
//                "id":13806,
//                "link":"https://mp.weixin.qq.com/s?__biz=MzA5ODQ1ODU5NA==&mid=2247484037&idx=1&sn=5745ee913af677fee192bac77507d418&chksm=90900c08a7e7851ec4bf6f2b3a9af3406c9ab78402722dc623409b949ad683c1d7aa084cca57&token=1449112143&lang=zh_CN#rd",
//                "niceDate":"1小时前",
//                "niceShareDate":"1小时前",
//                "origin":"",
//                "prefix":"",
//                "projectLink":"",
//                "publishTime":1591578736000,
//                "selfVisible":0,
//                "shareDate":1591578736000,
//                "shareUser":"ClericYi",
//                "superChapterId":494,
//                "superChapterName":"广场Tab",
//                "tags":[
//
//                ],
//                "title":"锦囊篇｜一文摸懂LeakCanary",
//                "type":0,
//                "userId":43964,
//                "visible":1,
//                "zan":0
class Datas {
  String title;
  bool fresh;
  String author;//作者(如果是分享人分享的，那么作者为空)
  String shareUser;//分享人
  int superChapterId;
  String superChapterName;//一级分类的名称
  int chapterId;
  String chapterName;
  String niceDate;//分享的时间
  int type;//type=1 是置顶数据
  List<Tag> tags;

  Datas.fromJson(Map<String,dynamic> json):
      title = json["title"],
      fresh = json["fresh"],
      author = json["author"],
      shareUser = json["shareUser"],
      superChapterId = json["superChapterId"],
      superChapterName = json["superChapterName"],
      chapterId = json["chapterId"],
      chapterName = json["chapterName"],
      niceDate = json["niceDate"],
      type = json["type"],
      tags = (json["tags"] as List).map((i)=>Tag.fromJson((i))).toList();

  @override
  String toString() {
    return "Datas{title:$title, fresh:$fresh, author$author, "
        "shareUser:$shareUser, superChapterId:$superChapterId, "
        "superChapterName:$superChapterName, chapterId:$chapterId, "
        "chapterName:$chapterName, niceDate:$niceDate}, type:$type";
  }
}

class Tag{
  String name;
  String url;
  Tag.fromJson(Map<String,dynamic> json)
    : name = json["name"],
      url = json["url"];
}