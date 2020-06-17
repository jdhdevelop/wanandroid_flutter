import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanandroidflutter/utils/common_utils.dart';

class DemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DemoPage();
}

class _DemoPage extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonUtils.getCommonAppBar(context, 'demo', false),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '白糖50KG/袋',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '40001212',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _buildCenterWidget('生产日期', '2020-01-12'),
              _buildCenterWidget('应移位数量', '459件',
                  rightTextColor: Colors.red, topBorder: false),
              _buildCenterWidget('目标库位', 'C001-2-1',
                  rightTextColor: Colors.red, topBorder: false),
              SizedBox(
                height: 40,
              ),
              _buildBorder(),
              TextField(
                decoration: InputDecoration(
                  hintText: '请输入您实际位移数量',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: '请扫描或输入目标库位码',
                ),
              ),
              _buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCenterWidget(String left, String right,
      {Color leftTextColor = Colors.grey,
      Color rightTextColor = Colors.grey,
      bool topBorder = true,
      bool bottomBorder = true}) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: topBorder ? Colors.grey : Colors.transparent,
              width: topBorder ? 1 : 0),
          left: BorderSide(color: Colors.grey, width: 1),
          right: BorderSide(color: Colors.grey, width: 1),
          bottom: BorderSide(
              color: bottomBorder ? Colors.grey : Colors.transparent,
              width: bottomBorder ? 1 : 0),
        ),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Text(
              left,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: leftTextColor,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              right,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
                color: rightTextColor,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildBorder() {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Text(
              '商品单位:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '件:',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(){
    return FlatButton(
      color: Colors.blue,
      child: Container(
        width: double.infinity,
        height: 40,
        alignment: Alignment.center,
        child: Text(
          '确   认',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
      onPressed: () {
        print('enter');
      },
    );
  }
}
