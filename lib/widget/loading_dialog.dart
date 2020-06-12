import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends Dialog {
  final String loadingText;
  final AnimationType animationType;
  final Color color;
  final double animationSize;
  final double size;
  var spinkit;

  LoadingDialog(
      {Key key,
      this.loadingText='数据加载中...',
      this.animationType = AnimationType.FadingCircle,
      this.color = Colors.cyanAccent,
      this.animationSize = 50,
      this.size = 120})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: size,
          height: size,
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: buildWidgetList(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildWidgetList() {
    switch (animationType) {
      case AnimationType.Wave:
        spinkit = SpinKitWave(
          color: color,
          size: animationSize,
        );
        break;
      case AnimationType.DoubleBonce:
        spinkit = SpinKitDoubleBounce(
          color: color,
          size: animationSize,
        );
        break;
      case AnimationType.WanderingCubes:
        spinkit = SpinKitWanderingCubes(
          color: color,
          size: animationSize,
        );
        break;
      case AnimationType.CubeGrid:
        spinkit = SpinKitCubeGrid(
          color: color,
          size: animationSize,
        );
        break;
      case AnimationType.Circle:
        spinkit = SpinKitCircle(
          color: color,
          size: animationSize,
        );
        break;
      case AnimationType.ChasingDots:
        spinkit = SpinKitChasingDots(
          color: color,
          size: animationSize,
        );
        break;
      case AnimationType.FadingCube:
        spinkit = SpinKitFadingCircle(
          color: color,
          size: animationSize,
        );
        break;
      case AnimationType.FadingCircle:
        spinkit = SpinKitFadingCircle(
          color: color,
          size: animationSize,
        );
        break;
    }
    return [
      spinkit,
      Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text(loadingText),
      ),
    ];
  }
}

///加载动画种类，根据第三方插件flutter_spinkit而来
enum AnimationType {
  Wave,
  DoubleBonce,
  WanderingCubes,
  CubeGrid,
  Circle,
  ChasingDots,
  FadingCube,
  FadingCircle,
}
