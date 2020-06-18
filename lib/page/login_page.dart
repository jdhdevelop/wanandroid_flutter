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
  GlobalKey _formKey= new GlobalKey<FormState>();
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
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
            Form(
              key: _formKey,//设置globalKey，用于后面获取FormState
              autovalidate: true,//开启自动校验
              onChanged: (){},
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    controller: _unameController,
                    decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "请输入用户名",
                      icon: Icon(Icons.person),
                    ),
                    validator: (v){
                      return v.trim().length>0?null:"用户名不能为空";
                    },
                  ),
                  TextFormField(
                    controller: _pwdController,
                    decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "请输入密码",
                      icon: Icon(Icons.lock),
                    ),
                    validator: (v){
                      return v.trim().length>5?null:"密码不能少于6位";
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10,left: 16,right: 16),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Builder(
                            builder: (context){
                              return RaisedButton(
                                child: Text('登录'),
                                padding: EdgeInsets.all(10),
                                color: Theme.of(context).primaryColor,
                                textColor: Colors.white,
                                onPressed: (){
                                  // 通过_formKey.currentState 获取FormState后，
                                  // 调用validate()方法校验用户名密码是否合法，校验
                                  // 通过后再提交数据。
                                  if(Form.of(context).validate()){
                                    //验证通过提交数据
                                    var username = _unameController.text;
                                    var pwd = _pwdController.text;
                                    if(username=='jdh'&&pwd=='123456'){
                                      CommonUtils.showToast(msg: '登录成功！');
                                    }else{
                                      CommonUtils.showToast(msg: '登录失败！');
                                    }
                                  }
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }


}
