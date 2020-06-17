import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wanandroidflutter/utils/common_utils.dart';
import 'package:wanandroidflutter/widget/bezier_login_widget.dart';
import 'package:wanandroidflutter/widget/bottom_sheet.dart';
import 'package:wanandroidflutter/widget/loading_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            BezierLoginWidget(
              backgroundHeight: 300,
              imagePath: 'assets/images/login_bg_1.jpg',
              avatar: NetworkImage(
                  'https://pics1.baidu.com/feed/4b90f603738da9770d648fff72572d1f8718e3ac.jpeg?token=125819beac8b93c77627177f8b424bc9'),
              controlPointHeight: 100.0,
            ),
            
          ],
        ),
    );
  }


}
