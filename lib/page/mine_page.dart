import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePage();
}

class _MinePage extends State<MinePage> {
  int _index = 0; //Dart任何变量声明时未赋值都默认为null
  List<Widget> widgets = [
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatefulContainer(),
    ),
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: StatefulContainer(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('mine'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.undo),
        onPressed: (){
          showAboutDialog(context: context,
            applicationIcon: Icon(Icons.error),
            applicationVersion: '1.0.0',
            children: [
            Text('111111'),
          ],);
        },
      ),
    );
  }

  switchWidget() {
    print('执行switch');
    widgets.insert(0, widgets.removeAt(1));
    setState(() {});
  }
}



class StatefulContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StatefulContainer();
  }

  StatefulContainer({Key key}) : super(key: key);
}

class _StatefulContainer extends State<StatefulContainer> {
  static final colors = [Colors.red, Colors.green, Colors.orange, Colors.blue];
  final Color color = colors[Random().nextInt(4)];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}
