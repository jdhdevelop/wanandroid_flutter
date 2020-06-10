import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 底部弹出框
class BottomSheetWidget extends StatefulWidget {
  BottomSheetWidget({Key key, this.list, this.onItemClickListener, this.title})
      : assert(list != null),
        super(key: key);
  final List list;
  final OnItemClickListener onItemClickListener;
  final String title;

  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

typedef OnItemClickListener = void Function(int index);

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  OnItemClickListener onItemClickListener;
  var itemCount;
  double itemHeight = 44;
  double circular = 10;
  List list;

  @override
  void initState() {
    super.initState();
    onItemClickListener = widget.onItemClickListener;
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
    itemCount = listLength + 1;
    var height;
    if (listLength == 1) {
      height = ((listLength + 2) * 48).toDouble();
    } else {
      height = ((listLength + 1) * 48).toDouble();
    }

    var cancelContainer = getCancelContainer();
    var listView = getListView(cancelContainer, listLength);
    var totalContainer = getTotalContainer(height, deviceWidth, listView);
    var stack = getStack(totalContainer);
    return stack;
  }

  getCancelContainer() {
    return Container(
      height: itemHeight,
      margin: EdgeInsets.only(left: 10, right: 10),
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
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          if (index == itemCount - 1) {
            return new Container(
              child: cancelContainer,
              margin: const EdgeInsets.only(top: 10),
            );
          }
          return getItemContainer(context, index, listLength);
        });
  }

  getTotalContainer(var height, var deviceWidth, Widget listView) {
    return Container(
      child: listView,
      height: height,
      width: deviceWidth * 0.98,
    );
  }

  getStack(Widget totalContainer) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          bottom: 0,
          child: totalContainer,
        ),
      ],
    );
  }

  Widget getItemContainer(BuildContext context, int index, int listLength) {
    if (list == null) {
      return Container();
    }
    var onTap2 = () {
      if (onItemClickListener != null) {
        onItemClickListener(index);
      }
    };
    var text = list[index];
    var contentText = FlatButton(
      child: Align(
        alignment: widget.title!=null&&index ==0?Alignment.center:Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
              color: Color(0xFF333333),
              fontSize: 18),
        ),
      ),
      onPressed: onTap2,
    );

    var decoration = getDecoration(index, listLength);

    var center;
    var itemContainer;
    center = Container(
      child: contentText,
    );

    itemContainer = Container(
        height: itemHeight,
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: decoration,
        child: center);

    return itemContainer;
  }

  Decoration getDecoration(int index, int listLength) {
    if (listLength == 1) {
      return BoxDecoration(
          color: Colors.white, // 底色
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.5, color: Color(0xffe5e5e5)));
    } else if (listLength > 1) {
      if (index == 0) {
        return BoxDecoration(
          color: Colors.white, // 底色
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          border: Border.all(width: 0.5, color: Color(0xffe5e5e5)),
        );
      } else if (index == listLength - 1) {
        return BoxDecoration(
          color: Colors.white, // 底色
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          border: Border.all(width: 0.5, color: Color(0xffe5e5e5)),
        );
      } else {
        return BoxDecoration(
          color: Colors.white, // 底色
          border: Border(
              left: BorderSide(color: Colors.white, width: 0.5),
              right: BorderSide(color: Colors.white, width: 0.5),
              bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5))),
        );
      }
    } else {
      return null;
    }
  }
}
