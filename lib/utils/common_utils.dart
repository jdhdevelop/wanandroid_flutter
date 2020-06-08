import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonUtils {

  static AppBar getCommonAppBar(BuildContext context,String title,bool needBack,
      {double fontSize,List<Widget> actions}){
    if(title == null){
      title = "";
    }
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: fontSize == null ? 18 : fontSize,
          color: Colors.white,
        ),
      ),
      leading: !needBack ? null : IconButton(
        icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        onPressed: (){
          if(context !=null) {
            Navigator.pop(context);
          }
        },
      ),
      centerTitle: true,//标题栏居中
      actions: actions == null ? <Widget>[] : actions,
    );
  }

  ///展示toast
  static void showToast({@required String msg}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

}