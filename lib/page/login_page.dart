
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanandroidflutter/utils/common_utils.dart';
import 'package:wanandroidflutter/widget/bottom_sheet.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginPage();

}

class _LoginPage extends State<LoginPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonUtils.getCommonAppBar(context, "login", false),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('show bottomSheet'),
            onPressed: (){
              showDialog(
                  barrierDismissible: true,//是否点击空白区域关闭对话框,默认为true，可以关闭
                  context: context,
                  builder: (BuildContext context) {
                    var list = List();
                    list.add('意见与建议');
                    list.add('功能问题');
                    list.add('内容问题');
                    list.add('使用问题');
                    list.add('其他问题');
                    return BottomSheetWidget(
                      itemGravity: Alignment.center,
                      title: 'title',
                      list: list,
                      onItemClickListener: (index) async {
                        print( list[index]);
                        Navigator.pop(context);
                      },
                      onTitleClickListener: () async{
                        print("title");
                        Navigator.pop(context);
                      },
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
  
  

}