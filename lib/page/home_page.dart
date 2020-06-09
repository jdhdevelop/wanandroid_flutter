import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanandroidflutter/data/data_utils.dart';
import 'package:wanandroidflutter/data/model/home_article_model.dart';
import 'package:wanandroidflutter/utils/common_utils.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  var mFuture;
  @override
  void initState() {
    super.initState();
    mFuture = dataUtils.getHomeArticleList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonUtils.getCommonAppBar(context, "WanAndroid", false),
        body: FutureBuilder(
          future: mFuture,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
                return Center(
                  child: Text('没有数据...'),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(child: Text('错误：${snapshot.error}'));
                }
                List<Datas> datas = snapshot.data;
                return RefreshIndicator(
                  displacement: 10,
                  onRefresh: ()async{
                    setState(() {
                      datas.clear();
                      datas.addAll(snapshot.data);
                    });
                  },
                  child: ListView.builder(
                    itemCount: datas.length,
                    itemBuilder: (context, index) {
                      Datas entity = datas[index];
                      return _buildArticleListItem(
                          entity.title,
                          entity.fresh,
                          entity.author,
                          entity.shareUser,
                          entity.superChapterName,
                          entity.chapterName,
                          entity.niceDate,
                          entity.type,
                          entity.tags);
                    }),
                );
            }
            return null;
          },
        ));
  }

  Widget _buildArticleListItem(
      String title,
      bool fresh,
      String author,
      String shareUser,
      String superChapterName,
      String chapterName,
      String niceDate,
      int type,
      List<Tag> tags) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      elevation: 8,
      child: InkWell(
        child: Container(
          //color: Colors.red,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.grey,
                iconSize: 20,
                onPressed: () {},
              ),
              Expanded(
                //这个Expanded必须，否则标题文字超出部分无法显示为省略号
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildHeightSizeBox(),
                    Container(
                      child: Text(
                        title,
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    _buildHeightSizeBox(),
                    Row(
                      children: _buildTaps(fresh, type, tags),
                    ),
                    _buildHeightSizeBox(),
                    Row(
                      children: <Widget>[
                        _buildWidthSizeBox(),
                        author == null
                            ? _buildTextSpan('', shareUser)
                            : _buildTextSpan('', author),
                        _buildWidthSizeBox(),
                        _buildTextSpan('', '$superChapterName/$chapterName'),
                        _buildWidthSizeBox(),
                        _buildTextSpan(
                            '时间:', CommonUtils.cutTimeString(niceDate)),
                      ],
                    ),
                    _buildHeightSizeBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          CommonUtils.showToast(msg: "click");
        },
      ),
    );
  }

  List<Widget> _buildTaps(bool fresh, int type, List<Tag> tags) {
    List<Widget> widgets = [];
    if (type == 1) {
      widgets.add(CommonUtils.borderText('置顶'));
    }
    if (fresh) {
      widgets.add(CommonUtils.borderText('新'));
    }
    if (tags != null && tags.length > 0) {
      for (int i = 0; i < tags.length; i++) {
        widgets.add(CommonUtils.borderText(tags[i].name,
            textColor: Colors.green, borderColor: Colors.green));
      }
    }

    return widgets;
  }

  _buildTextSpan(String str1, String str2) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: str1,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
      TextSpan(
        text: str2,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black45,
        ),
      ),
    ]));
  }

  _buildWidthSizeBox({double width = 8}) {
    return SizedBox(
      width: width,
    );
  }

  _buildHeightSizeBox({double height = 8}) {
    return SizedBox(
      height: height,
    );
  }

  }
