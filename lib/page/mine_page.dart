import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePage();
}

class _MinePage extends State<MinePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('mine'),
      ),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath( //路径裁切组件
                  clipper: BottomClipper(), //路径
                  child: Container(
                    constraints: BoxConstraints(maxHeight: 400),
                    decoration: BoxDecoration(),
                    child: Image.asset('assets/images/flower1.jpg',fit: BoxFit.cover,width: double.infinity,),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child:Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.cyanAccent,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }

}

class MyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    //画棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Color(0x77cdb175); //背景为纸黄色
    canvas.drawRect(Offset.zero & size, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (int i = 0; i <= 15; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 15; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    //画一个黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    canvas.drawCircle(
      Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );

    //再画一个黑子
    canvas.drawCircle(
        Offset(size.width / 2 - eWidth * 1.5, size.height / 2 - eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);

    canvas.drawCircle(
        Offset(size.width / 2 - eWidth * 1.5, size.height / 2 + eHeight * 1.5),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);

    canvas.drawCircle(
        Offset(size.width / 2 - eWidth * 2.5, size.height / 2 + eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);

    canvas.drawCircle(
        Offset(size.width / 2 - eWidth * 3.5, size.height / 2 + eHeight * 1.5 ),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);

    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );

    canvas.drawCircle(
        Offset(size.width / 2 - eWidth / 2, size.height / 2 + eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);

    canvas.drawCircle(
        Offset(size.width / 2 - eWidth * 1.5, size.height / 2 + eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);
    canvas.drawCircle(
        Offset(size.width / 2 - eWidth * 2.5, size.height / 2 - eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);
    canvas.drawCircle(
        Offset(size.width / 2 - eWidth * 0.5 , size.height / 2 - eHeight * 1.5),
        min(eWidth / 2, eHeight / 2) - 2,
        paint);
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}

class MyPainter2 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
    ..style = PaintingStyle.fill
    ..isAntiAlias= true
    ..color = Colors.orangeAccent
    ..strokeWidth = 1;

    canvas.drawRect(Offset.zero & size, paint);

    paint = Paint()
    ..color = Colors.blue
    ..isAntiAlias = true
    ..strokeWidth = 1;

    double side = min(size.width, size.height);
    double waveWidth = side * 0.8;
    double waveHeight = side / 6;

    var path = Path();
    path.reset();
    path.moveTo(-waveWidth, waveHeight);
    for (double i = -waveWidth; i < side; i += waveWidth) {
      path.relativeQuadraticBezierTo(
          waveWidth / 4, -waveHeight, waveWidth / 2, 0);
      path.relativeQuadraticBezierTo(
          waveWidth / 4, waveHeight, waveWidth / 2, 0);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}


class BottomClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0, 0); //第1个点
    path.lineTo(0, size.height-80.0); //第2个点
    var firstControlPoint = Offset(size.width/2, size.height);
    var firstEdnPoint = Offset(size.width, size.height-80.0);
    path.quadraticBezierTo(
        firstControlPoint.dx,
        firstControlPoint.dy,
        firstEdnPoint.dx,
        firstEdnPoint.dy
    );
    path.lineTo(size.width, size.height-80.0); //第3个点
    path.lineTo(size.width, 0); //第4个点

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


