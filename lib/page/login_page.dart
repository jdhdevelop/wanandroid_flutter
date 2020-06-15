import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wanandroidflutter/utils/common_utils.dart';
import 'package:wanandroidflutter/widget/bottom_sheet.dart';
import 'package:wanandroidflutter/widget/loading_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> data = List();
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 20; i++) {
      data.add("item:$i");
    }
  }

  var spinkit = SpinKitDoubleBounce(
    color: Colors.black38,
    size: 50.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonUtils.getCommonAppBar(context, "login", false),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          RaisedButton(
            child: Text('show bottomSheet'),
            onPressed: () {
              showDialog(
                  barrierDismissible: true, //是否点击空白区域关闭对话框,默认为true，可以关闭
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
                        print(list[index]);
                        Navigator.pop(context);
                      },
                      onTitleClickListener: () async {
                        print("title");
                        Navigator.pop(context);
                      },
                    );
                  });
            },
          ),
          RaisedButton(
            child: Text('第三方插件'),
            onPressed: () {
              showLoading();
              getData().then((datas) {
                Navigator.pop(context);
                Picker picker = Picker(
                    title: Text('标题'),
                    cancelText: "取消",
                    confirmText: "确定",
                    adapter: PickerDataAdapter<String>(pickerdata: datas),
                    changeToFirst: false,
                    textAlign: TextAlign.left,
                    textStyle: const TextStyle(color: Colors.blue),
                    selectedTextStyle: TextStyle(color: Colors.black),
                    columnPadding: const EdgeInsets.all(8.0),
                    onConfirm: (Picker picker, List value) {
                      print(value.toString());
                      print(picker.getSelectedValues());
                    });
                picker.showModal(context);
              });
            },
          ),
          spinkit,
        ],
      ),
    );
  }

  Future<List<String>> getData() async {
    List<String> datas = [];
    for (int i = 0; i < 20; i++) {
      datas.add("item:$i");
    }
    return Future.delayed(Duration(seconds: 5), () => datas);
  }

  showLoading() {
  showDialog(context: context,
    barrierDismissible: false,
    builder: (context){
    return LoadingDialog(
      color: Colors.orangeAccent,
      animationType: AnimationType.Wave,
    );
    }
  );
  }
}
