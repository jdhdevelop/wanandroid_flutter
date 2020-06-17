import 'package:flutter/material.dart';

///常用登录页面的具有贝塞尔曲线的顶部组件
class BezierLoginWidget extends StatelessWidget {
  final double backgroundHeight;
  final String imagePath;

  ///贝塞尔曲线控制点距离直线那边的高度
  final double controlPointHeight;

  ///头像大小
  final double avatarSize;
  final ImageProvider avatar;

  BezierLoginWidget(
      {this.backgroundHeight = 300,
      this.avatarSize = 100,
      @required this.avatar,
      @required this.imagePath,
      this.controlPointHeight = 80.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ClipPath(
              clipper: BottomClipper(controlPointHeight),
              child: Container(
                height: backgroundHeight,
                //constraints: BoxConstraints(maxHeight: maxHeight),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    )),
                child: avatar == null
                    ? Icon(
                        Icons.person,
                        size: avatarSize - 10,
                        color: Colors.black38,
                      )
                    : CircleAvatar(
                        backgroundImage: avatar,//AssetImage(avatar),
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

///自定义贝塞尔曲线裁剪
class BottomClipper extends CustomClipper<Path> {
  final double controlPointHeight;

  BottomClipper(this.controlPointHeight);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0); //第1个点
    path.lineTo(0, size.height - controlPointHeight); //第2个点
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEdnPoint = Offset(size.width, size.height - controlPointHeight);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEdnPoint.dx, firstEdnPoint.dy);
    path.lineTo(size.width, size.height - controlPointHeight); //第3个点
    path.lineTo(size.width, 0); //第4个点

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
