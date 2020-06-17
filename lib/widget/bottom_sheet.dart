import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//使用示例：
//onPressed: () {
//showDialog(
//barrierDismissible: true, //是否点击空白区域关闭对话框,默认为true，可以关闭
//context: context,
//builder: (BuildContext context) {
//var list = List();
//list.add('意见与建议');
//list.add('功能问题');
//list.add('内容问题');
//list.add('使用问题');
//list.add('其他问题');
//return BottomSheetWidget(
//itemGravity: Alignment.center,
//title: 'title',
//list: list,
//onItemClickListener: (index) async {
//print(list[index]);
//Navigator.pop(context);
//},
//onTitleClickListener: () async {
//print("title");
//Navigator.pop(context);
//},
//);
//});
class BottomSheetWidget extends StatefulWidget {
  final OnItemClickListener onItemClickListener;
  final OnTitleClickListener onTitleClickListener;
  final List list;
  final String title;
  final itemGravity;
  final Widget item; //item的内层widget，可以允许自定义

  BottomSheetWidget(
      {Key key,
      this.onItemClickListener,
      @required this.list,
      this.title,
      this.itemGravity = Alignment.centerLeft,
      this.item,
      this.onTitleClickListener})
      : assert(list != null),
        assert(itemGravity is Alignment),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomSheet();
  }
}

//给方法取个别名
typedef OnItemClickListener = void Function(int index);
typedef OnTitleClickListener = void Function();

class _BottomSheet extends State<BottomSheetWidget> {
  OnItemClickListener onItemClickListener;
  OnTitleClickListener onTitleClickListener;
  int itemCount;
  double itemHeight = 44;
  double circular = 10; //圆角度数
  List list;
  var item;

  @override
  void initState() {
    super.initState();
    onItemClickListener = widget.onItemClickListener;
    onTitleClickListener = widget.onTitleClickListener;
    item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    if (widget.title != null) {
      list = [widget.title];
      list.addAll(widget.list);
    } else {
      list = [];
      list.addAll(widget.list);
    }
    int listLength = list.length;

    /// 最后还有一个cancel，所以加1
    var height;
    if (listLength == 1) {
      height = ((listLength + 1) * itemHeight).toDouble();
    } else {
      height = ((listLength ) * itemHeight).toDouble();
    }

    var cancelContainer = getCancelContainer(deviceWidth);
    var listView = getListView(cancelContainer, listLength);
    var totalContainer = getTotalContainer(height, deviceWidth, listView);
    var stack = getStack(totalContainer, cancelContainer);
    return stack;
  }

  //构建item
  _buildItem(BuildContext context, int index, int listLength) {
    if (list == null) {
      return Container();
    }
    var text = list[index];
    return widget.item != null
        ? item
        : Container(
            height: itemHeight,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: getDecoration(index, listLength),
            child: Center(
              child: _getContentWidget(text, index, listLength),
            ),
          );
  }

  //item中内层widget
  _getContentWidget(String text, int index, int listLength) {
    return FlatButton(
      shape: index == listLength - 1
          ? null
          : Border(
              bottom: BorderSide(color: Color(0xffe5e5e5), width: 0.5),
            ),
      child: Align(
        alignment: widget.title != null && index == 0
            ? Alignment.center
            : widget.itemGravity,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
              color: Color(0xFF333333),
              fontSize: 18),
        ),
      ),
      onPressed: () {
        if (widget.title != null &&
            widget.onTitleClickListener != null &&
            index == 0) {
          onTitleClickListener();
        } else {
          if (widget.title != null) {
            onItemClickListener(index - 1);
          } else {
            onItemClickListener(index);
          }
        }
      },
    );
  }

  Decoration getDecoration(int index, int listLength) {
    if (listLength == 1) {
      return BoxDecoration(
          color: Colors.white, // 底色
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5, color: Color(0xffe5e5e5)));
    } else if (listLength > 1) {
      if (index == 0) {
        //第一个item
        return BoxDecoration(
          color: Colors.white, // 底色
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        );
      } else if (index == listLength - 1) {
        //最后一个item
        return BoxDecoration(
          color: Colors.white, // 底色
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        );
      } else {
        return BoxDecoration(
          color: Colors.white, // 底色
        );
      }
    } else {
      return null;
    }
  }

  getCancelContainer(double deviceWidth) {
    print("cancelWidth:${deviceWidth * 0.98}");
    return Container(
      width: deviceWidth * 0.98,
      height: itemHeight,
      margin: EdgeInsets.only(left: 15, right: 15,top: 10,bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white, // 底色
        borderRadius: BorderRadius.circular(circular),
      ),
      child: FlatButton(
        child: Text(
          "取消",
          style: TextStyle(
              fontFamily: 'Robot',
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
              color: Color(0xff333333),
              fontSize: 18),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  getListView(Widget cancelContainer, int listLength) {
    return ListView.builder(
        itemCount: listLength,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(context, index, listLength);
        });
  }

  getTotalContainer(var height, var deviceWidth, Widget listView) {
    print("getTotalContainer:${deviceWidth * 0.98}");
    return Container(
      child: Align(child: listView,alignment: Alignment.bottomCenter,),
      height: height,
      width: deviceWidth * 0.98,
    );
  }

  getStack(Widget totalContainer, Widget cancelContainer) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: totalContainer,
          ),
        ),
        cancelContainer,
      ],
    );
  }
}
