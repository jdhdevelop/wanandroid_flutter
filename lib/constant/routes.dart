
import 'package:flutter/widgets.dart';
import 'package:wanandroidflutter/page/demo_page.dart';
import 'package:wanandroidflutter/page/home_page.dart';
import 'package:wanandroidflutter/page/login_page.dart';
import 'package:wanandroidflutter/page/mine_page.dart';

class Routes{
  static String root = '/';
  static String minePage = '/minePage';
  static String loginPage = '/loginPage';
  static String homePage = '/homePage';
  static String demoPage = '/demoPage';
  static Map<String, WidgetBuilder> routes = {};

  static void init(){
    routes[minePage] = (context) => MinePage();
    routes[loginPage] = (context) => LoginPage();
    routes[homePage] = (context) => HomePage();
    routes[demoPage] = (context) => DemoPage();
  }
}