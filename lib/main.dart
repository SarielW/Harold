import 'package:flutter/material.dart';
import 'package:flutter_harold/level/level1.dart';
import 'package:flutter/services.dart';
import 'package:flutter_harold/help.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Harold',
      theme: ThemeData(
        /*这个地方就类似于Android中的style文件配置，主要就是主题的配置*/
          primaryColor: Colors.brown[700],
          primaryColorDark: Colors.brown[700],
          accentColor: Colors.brown,
          buttonTheme: ButtonThemeData(buttonColor: Colors.brown[700],textTheme: ButtonTextTheme.primary)
      ),
      home: new HomeScreen());
  }
}
class HomeScreen extends StatelessWidget {
  static Future<void> pop() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return new Scaffold(
        body: new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/wood.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: new Center(
            child: new Column(
                children: <Widget>[
                  new Image.asset('images/home.png'),
                  new Container(

                      padding: const EdgeInsets.only(top: 30, bottom: 120),
                      width: width,
                      height: height / 1.513,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new RaisedButton(
                              color: Colors.brown,
                              child: Text("开始游戏"),
                              elevation: 30,
                              onPressed: () {
                                Navigator.push(context,
                                    new MaterialPageRoute(builder: (context) => new Level1()));
                              }
                          ),
                          new RaisedButton(
                            color: Colors.brown[700],
                            child: Text("帮助"),
                            elevation: 30,
                            onPressed: () => {
                              Navigator.push(context,
                                new MaterialPageRoute(builder: (context) => new Help()))
                            },
                          ),
                          new RaisedButton(
                            color: Colors.brown[900],
                            child: Text("退出游戏"),
                            elevation: 30,
                            onPressed:() async {
                              await pop();
                            },
                          ),
                        ],
                      )
                  )
                ])
          ),
        )
    );
  }
}
