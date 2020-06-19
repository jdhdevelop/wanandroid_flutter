import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:wanandroidflutter/common/application.dart';
import 'package:wanandroidflutter/data/apis.dart';
import 'package:wanandroidflutter/data/http_utils.dart';
import 'package:wanandroidflutter/data/model/base_response.dart';
import 'package:wanandroidflutter/data/model/home_article_model.dart';
import 'package:wanandroidflutter/widget/log_util.dart';

import 'model/login_model.dart';
DataUtils dataUtils = DataUtils();
class DataUtils {

  static DataUtils _instance = DataUtils._internal();
  factory DataUtils() => _instance;
  DataUtils._internal();
  static DataUtils _getInstance(){
    if(_instance == null){
      _instance = DataUtils._internal();
    }
    return _instance;
  }

  Future<List<Datas>> getHomeArticleList(int index) async{
    HomeArticleModel homeArticleModel
    = HomeArticleModel.fromJson(await httpUtils.get(Apis.homeArticleList+"$index/json"));
    return homeArticleModel == null? Future.error("homeArticleModel为空"):homeArticleModel.datas;
  }

  Future<LoginModel> login(String username, String password, BuildContext context) async{
    FormData formData = FormData.fromMap({'username':username,'password':password});
    var data = await httpUtils.post(Apis.login,formData: formData,
        isAddLoading: true,context: context,loadingText: "登录中...");
    //如果登录失败，则data为null
    if(data!=null){
      Application.isLogin = true;
    }
    LogUtil.d(data);
    return data == null ? null : LoginModel.fromJson(data);
  }

}
