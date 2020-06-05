import 'package:flutter/material.dart';
import 'package:wanandroidflutter/constant/routes.dart';
import 'package:wanandroidflutter/page/login_page.dart';
import 'package:wanandroidflutter/page/mine_page.dart';

class WanAndroidAppPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (context){
          String routeName = settings.name;
          return LoginPage();
        });
      },
      home: HomePage(),
    );
  }

}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePage();

}

class _HomePage extends State<HomePage>{

  var result;

  @override
  void initState() {
    super.initState();
    Routes.init();
  }
  @override
  Widget build(BuildContext context) {
    print('页面1 build调用');
    return Scaffold(
      appBar: AppBar(title: Text('wanAndroid'),),
      body: Center(
        child: Container(
          height: 350,
          width: 350,
          child: Navigator(
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settings){
              WidgetBuilder builder;
              switch(settings.name){
                case '/':
                  builder = (context) => PageC();
                  break;
              }
              return MaterialPageRoute(builder: builder);
            },
          ),
        ),
      ),
    );
  }

}

class PageC extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: <Widget>[
            _buildItem(Icons.clear, '不感兴趣', '减少这类内容'),
            Divider(),
            _buildItem(Icons.access_alarm, '举报', '标题夸张，内容质量差 等',
                showArrow: true, onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return PageD();
                  }));
                }),
            Divider(),
            _buildItem(Icons.perm_identity, '拉黑作者：新华网客户端', '',
                showArrow: true,onPress: (){
              
            }),
            Divider(),
            _buildItem(Icons.account_circle, '屏蔽', '军事视频、驾驶员等'),
          ],
        ),
      ),
    );
  }

  _buildItem(IconData iconData, String title, String content,
      {bool showArrow = false, Function onPress}) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 5,
        ),
        Icon(iconData),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 18),
              ),
              content==''
                ? Container()
                : Text(
                content,
                style: TextStyle(
                    color: Colors.black.withOpacity(.5), fontSize: 14),
              )
            ],
          ),
        ),
        !showArrow
            ? Container()
            : IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          iconSize: 16,
          onPressed: onPress,
        ),
      ],
    );
  }

}

class PageD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      color: Colors.grey.withOpacity(.5),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Text('返回'),
              SizedBox(
                width: 30,
              ),
              Text('举报'),
            ],
          ),
        ],
      ),
    );
  }
}