import 'package:flutter/material.dart';
import 'package:wanandroidflutter/constant/routes.dart';
import 'package:wanandroidflutter/data/data_utils.dart';
import 'package:wanandroidflutter/page/login_page.dart';
import 'package:wanandroidflutter/page/mine_page.dart';
import 'package:wanandroidflutter/utils/common_utils.dart';

import 'home_page.dart';

class WanAndroidAppPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//去掉debug模式下，右上角的banner
      routes: Routes.routes,
      home: LoginPage(),
    );
  }

}


