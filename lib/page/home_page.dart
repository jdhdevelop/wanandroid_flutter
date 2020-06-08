import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanandroidflutter/data/data_utils.dart';
import 'package:wanandroidflutter/utils/common_utils.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePage();

}

class _HomePage extends State<HomePage>{

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonUtils.getCommonAppBar(context, "WanAndroid",false),
      body: Center(
        child: RaisedButton(
          child: Text('request'),
          onPressed: (){
            var homeArticleList = DataUtils.instance.getHomeArticleList().then((value){
              print(value);
            });
          },
        ),
      ),
    );
  }

}