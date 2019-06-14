import 'package:flutter/material.dart';
import 'package:flutter_harold/level/level1.dart';
import 'package:flutter_harold/level/level2.dart';
import 'package:flutter_harold/level/level3.dart';
import 'package:flutter_harold/level/level4.dart';

class Choose extends StatelessWidget {
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
                new Container(
                    width: width,
                    height: height / 1.1,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                      new Center(
                        child: new Column(
                          children: <Widget>[
                            new Align(
                              alignment: new FractionalOffset(0.1, 0.0),
                              child: new RaisedButton(child: new Text("返回"), onPressed: () {
                    //回到上一个页面 该pop将Route从导航器管理的路由栈中移除当前路径
                                Navigator.pop(context);
                              }),
                            ),
                          ])
                      ),
                        new RaisedButton(
                            child: Text("第一关"),
                            onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                              Navigator.push(context,
                                new MaterialPageRoute(builder: (context) => new Level1()));
                            }
                        ),
                        new RaisedButton(
                          child: Text("第二关"),
                          onPressed: () {
                          Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (context) => new Level2()));
                          },
                        ),
                        new RaisedButton(
                          child: Text("第三关"),
                          onPressed: (){
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (context) => new Level3()));
                          },
                        ),
                        new RaisedButton(
                          child: Text("第四关"),
                          onPressed: (){
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (context) => new Level4()));
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
