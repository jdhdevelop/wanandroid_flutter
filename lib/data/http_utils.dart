
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wanandroidflutter/data/apis.dart';
import 'package:wanandroidflutter/utils/common_utils.dart';
import 'package:wanandroidflutter/widget/log_util.dart';
HttpUtils httpUtils = HttpUtils();
class HttpUtils {
  Dio _dio;
  //私有化构造方法
  HttpUtils._internal(){
    if(null == _dio){
      _dio = Dio();
      _dio.options.baseUrl = Apis.BASE_URL;
      _dio.options.connectTimeout = 30 * 1000;
      _dio.options.sendTimeout = 30 * 1000;
      _dio.options.receiveTimeout = 30 * 1000;
    }
  }

  static HttpUtils _singleton = HttpUtils._internal();
  factory HttpUtils() =>_singleton;

  Future get(String url,{Map<String,dynamic> params}) async{
    Response response;
    try{
      if(params != null){
        response = await _dio.get(url,queryParameters: params);
      }else{
        response = await _dio.get(url);
      }
      //直接把外层解析了
      if(response.data['errorCode'] == 0){
        return response.data['data'];
      }else{
        String data = response.data["errorMsg"];
        CommonUtils.showToast(msg: data);
        LogUtil.d("网络请求错误: $data");
      }
    }on DioError catch(e){
      if(e.response != null){
        LogUtil.d(e.response.headers.toString());
        LogUtil.d(e.response.request.toString());
      }else {
        LogUtil.d(e.request.toString());
      }
    }
    return null;
  }

  Future post(String url,{FormData formData,Map<String, dynamic> queryParameters,bool isAddLoading = false, BuildContext context, String loadingText}) async{
    Response response;
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    var dir = Directory("$documentsPath/cookies");
    await dir.create();

    //cookie
    _dio.interceptors.add(CookieManager(PersistCookieJar(dir: dir.path)));

    //loading
    if (isAddLoading) {
      CommonUtils.showLoadingDialog(context, loadingText);
    }
    try{
      if(formData != null){
        response = await _dio.post(url, data: formData);
      }else if(queryParameters != null){
        response = await _dio.post(url, queryParameters: queryParameters);
      }else{
        response = await _dio.post(url);
      }
      //隐藏loading
      CommonUtils.disMissLoadingDialog(isAddLoading, context);
      if(response.data['errorCode'] == 0){
        return response.data['data'];
      }else{
        String data = response.data["errorMsg"];
        CommonUtils.showToast(msg: data);
        LogUtil.d("请求网络错误 : $data");
      }
    }on DioError catch(e){
      if (e.response != null) {
        LogUtil.d(e.response.headers.toString());
        LogUtil.d(e.response.request.toString());
      } else {
        LogUtil.d(e.request.toString());
      }
      //隐藏loading
      CommonUtils.disMissLoadingDialog(isAddLoading, context);
      return null;
    }
  }



}