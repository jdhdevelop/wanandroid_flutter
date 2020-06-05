import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MinePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MinePage();
}

class _MinePage extends State<MinePage> {
  int _index = 0;//Dart任何变量声明时未赋值都默认为null


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('mine'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          IndexedStack(
            index: _index,
            children: <Widget>[
              Center(
                child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.fastfood,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.cake,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.yellow,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.local_cafe,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(icon: Icon(Icons.fastfood), onPressed: (){
                setState(() {
                  _index = 0;
                });
              }),
              IconButton(icon: Icon(Icons.cake), onPressed: (){
                setState(() {
                  _index = 1;
                });
              }),
              IconButton(icon: Icon(Icons.local_cafe), onPressed: (){
                setState(() {
                  _index = 2;
                });
              }),
            ],
          ),
        ],
      ),
    );
  }
}
