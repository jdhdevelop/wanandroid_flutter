import 'package:dio/dio.dart';
import 'package:wanandroidflutter/data/apis.dart';
import 'package:wanandroidflutter/data/http_utils.dart';
import 'package:wanandroidflutter/data/model/base_response.dart';
import 'package:wanandroidflutter/data/model/home_article_model.dart';

DataUtils dataUtils = DataUtils();
class DataUtils {

  static DataUtils _instance;
  static DataUtils get instance => _getInstance();
  factory DataUtils() => _instance;
  DataUtils._internal();
  static DataUtils _getInstance(){
    if(_instance == null){
      _instance = DataUtils._internal();
    }
    return _instance;
  }

  Future<List<Datas>> getHomeArticleList() async{
    HomeArticleModel homeArticleModel
    = HomeArticleModel.fromJson(await httpUtils.get(Apis.homeArticleList));
    return homeArticleModel == null? Future.error("homeArticleModel为空"):homeArticleModel.datas;
  }


}