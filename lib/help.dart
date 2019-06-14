import 'package:flutter/material.dart';

class Help extends StatelessWidget {
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
            child: new Container(
              constraints: new BoxConstraints.expand(
                height: height / 1.5 + 100,
                width: width / 1.1,
              ),
              decoration: new BoxDecoration(
                border: new Border.all(width: 2.0, color: Colors.white),
                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
              ),
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: new Column(
                  children: <Widget>[
                    new Text('华容道简介',
                      style: new TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )
                    ),
                    new Text('        华容道是古老的中国民间益智游戏，以其变化多端、百玩不厌的特点与魔方、独立钻石棋一起被国外智力专家并称为“智力游戏界的三个不可思议”。它与七巧板、九连环等中国传统益智玩具还有个代名词叫作“中国的难题”。据《资治通鉴》注释中说“从此道可至华容也”。华容道原是中国古代的一个地名，相传当年曹操曾经败走此地。由于当时的华容道是一片沼泽，所以曹操大军要割草填地，不少士兵更惨被活埋，惨烈非常。',
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        )
                    ),
                    new Text('        通过移动各个棋子，帮助曹操从初始位置移到棋盘最下方中部，从出口逃走。',
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        )
                    ),
                    new RaisedButton(child: new Text("返回"), onPressed: () {
                      //回到上一个页面 该pop将Route从导航器管理的路由栈中移除当前路径
                      Navigator.pop(context);
                    }),
                  ]
              )
            )
          )
        )
    );
  }
}
