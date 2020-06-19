import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanandroidflutter/utils/common_utils.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _rePwdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: CommonUtils.getCommonAppBar(context, "注册", true),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: 10,
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            child: Form(
              autovalidate: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "请输入用户名",
                      icon: Icon(Icons.person),
                    ),
                    validator: (v) {
                      return v.trim().length > 0 ? null : "用户名不能为空";
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "请输入密码",
                      icon: Icon(Icons.lock),
                    ),
                    validator: (v) {
                      return v.trim().length > 5 ? null : "密码不能少于6位";
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _rePwdController,
                    decoration: InputDecoration(
                      labelText: "确认密码",
                      hintText: "请再次输入密码",
                      icon: Icon(Icons.lock),
                    ),
                    validator: (v) {
                      var password = _passwordController.text;
                      if (v.trim().length < 6) {
                        return "密码不能少于6位";
                      } else {
                        if (password != v.trim()) {
                          return "两次密码不一致！";
                        } else {
                          return null;
                        }
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              return RaisedButton(
                                padding: EdgeInsets.all(10),
                                color: Theme.of(context).primaryColor,
                                textColor: Colors.white,
                                child: Text(
                                  '注册',
                                ),
                                onPressed: () {
                                  if(Form.of(context).validate()){

                                  }else{
                                    CommonUtils.showToast(msg: '请正确填写！');
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
