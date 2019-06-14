import 'package:flutter/material.dart';
import '../constant/size.dart';
import '../component/block.dart';
import '../constant/block.dart';
import '../constant/point.dart';
import '../constant/occupy.dart';
import '../constant/Adapt.dart';
import 'package:flutter_harold/choose.dart';

class Level1 extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("关卡1"),
      ),
      body: new Center(
        child: new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/wood.png"),
                fit: BoxFit.fill,
              ),
            ),
          child:
          new Column(
            children: <Widget>[
              new Align(
                alignment: new FractionalOffset(0.0, 0.0),
                child: new RaisedButton(child: new Text("返回"), onPressed: () {
              //回到上一个页面 该pop将Route从导航器管理的路由栈中移除当前路径
              Navigator.pop(context);
                }),
              ),
              new GameBlock(),
            ])
        )
      )
    );
  }
}
class GameBlock extends StatefulWidget {
  @override
  GameBlockState createState() => new GameBlockState();
}

class GameBlockState extends State {
  Occupy occupy = new Occupy();
  static int goodcount = 0;
  static int badcount = 0;

  static List<double> position = [0, 0, 3, 0, 0, 2, 3, 2, 0, 4, 3, 4, 2, 3, 1, 0, 1, 2, 1, 3];
  List<Block> blocks = [new Block(new Point(position[0], position[1]),'zhangfei'),
    new Block(new Point(position[2], position[3]),'machao'),
    new Block(new Point(position[4], position[5]),'zhaoyun'),
    new Block(new Point(position[6], position[7]),'huangzhong'),
    new Block(new Point(position[8], position[9]),'zu'),
    new Block(new Point(position[10], position[11]),'zu'),
    new Block(new Point(position[12], position[13]),'zu'),
    new Block(new Point(position[14], position[15]),'caocao'),
    new Block(new Point(position[16], position[17]),'guanyu'),
    new Block(new Point(position[18], position[19]),'zu')
  ];

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return new Container(
//      width:size.width,
      width: Size.boardWidth,
      color: Colors.white12,
      child: new Stack(
          children: <Widget>[
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Text("赞：",),
                  new Text(goodcount.toString()),
                  new Text("踩："),
                  new Text(badcount.toString())
                ]
              )
            ),
            new Container(
              margin: const EdgeInsets.only(top:30.0),
              width: Size.boardWidth,
              height: Size.boardHeight,
              color: Colors.brown[700],
              child: new Stack(
                children: <Widget> [
                  new Blocks(blocks[0], occupy),
                  new Blocks(blocks[1], occupy),
                  new Blocks(blocks[2], occupy),
                  new Blocks(blocks[3], occupy),
                  new Blocks(blocks[4], occupy),
                  new Blocks(blocks[5], occupy),
                  new Blocks(blocks[6], occupy),
                  new Blocks(blocks[7], occupy),
                  new Blocks(blocks[8], occupy),
                  new Blocks(blocks[9], occupy),
                ]
              ),
            ),
            new Container(
              margin: EdgeInsets.only(top: Size.boardHeight + Adapt.px(60)),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    child: Text("赞"),
                    onPressed: () => {
                      setState(() {
                        goodcount++;
                      })
                    },
                  ),
                  new RaisedButton(
                    child: Text("选关"),
                    onPressed: (){
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => new Choose()));
                    }
                  ),
                  new RaisedButton(
                    child: Text("踩"),
                    onPressed: () => {
                      setState(() {
                        badcount++;
                      })
                    },
                  ),
                ]
              ),
            )
          ]
        )
    );
  }
}

