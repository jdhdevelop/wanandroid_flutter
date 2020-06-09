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

  static Widget borderText(String content,{Color textColor, double borderWidth, Color borderColor}){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 11,
          color: textColor == null?Colors.red:textColor,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 0.5,horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: borderColor == null ? Colors.red : borderColor,
          width: borderWidth == null ? 1 : borderWidth,
        )
      ),
    );
  }

  //剪切时间字符串，2020-01-01 00:00:00 切为 2020-01-01
  static String cutTimeString(String time){
    if(time.length>=9){
      return time.substring(0,10);
    }else{
      return time;
    }
  }

}