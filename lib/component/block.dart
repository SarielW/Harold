import 'package:flutter/material.dart';
import 'package:flutter_harold/constant/block.dart';
import 'package:flutter_harold/constant/size.dart';
import 'package:flutter_harold/constant/occupy.dart';
import 'package:flutter_harold/constant/point.dart';
import 'package:flutter_harold/choose.dart';

class Blocks extends StatefulWidget {
  @override
  final Block block;
  final Occupy occupy;
  Blocks(this.block, this.occupy);
  BlockState createState() => new BlockState(block, occupy);
}

class BlockState extends State<Blocks> {
  Block block;
  Occupy occupy;
  double offsetx = 0;
  double offsety = 0;
  double originx;
  double originy;
  BlockState(this.block, this.occupy) {
    occupy.setState(block);
  }
  // 如果曹操的左上坐标为3,1，则完成
  bool complete(Block block) {
    if (block.name == 'caocao') {
      if (block.point.x == Size.cellsize && block.point.y == 3 * Size.cellsize) {
        showDialog<Null>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text('恭喜完成关卡'),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    new Text('你共用了'+occupy.count.toString()+'步'),
                  ],
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('确定'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ).then((val) {
          print(val);
        });
      }
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: new Container(
            margin: EdgeInsets.only(top: block.point.y, left: block.point.x),
            decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage(block.imageSrc),
                  fit: BoxFit.fill,
                ),
                border: new Border.all(width: 3.0, color: Colors.brown[700]),
                borderRadius: const BorderRadius.all(const Radius.circular(10.0))
            ),
            width: block.width,
            height: block.height,
            child: GestureDetector(
              onVerticalDragStart: (DragStartDetails details) {
                originx = block.point.x / Size.cellsize;
                originy = block.point.y / Size.cellsize;
              },
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  if ((details.delta.dy + block.point.y + block.height - Size.cellsize) / Size.cellsize <= 4 &&
                      (details.delta.dy + block.point.y) / Size.cellsize >= 0 && offsety <= Size.cellsize - 5 && offsety >= -Size.cellsize + 5) {
                    offsety += details.delta.dy;
                    if ((offsety > 0 && !occupy.getState(new Block(new Point(originx, originy), block.name), 2)) ||
                        (offsety < 0 && !occupy.getState(new Block(new Point(originx, originy), block.name), 1))) {
                      block.point.y += details.delta.dy;
                    }
                  }
                });
              },
              onVerticalDragEnd: (DragEndDetails details) {
                setState(() {
                  if (offsety > 0) {
                    if (originy < 4 && !occupy.getState(new Block(new Point(originx, originy), block.name), 2)) {
                      block.point.y = (originy + 1) * Size.cellsize;
                      occupy.cancelState(new Block(new Point(
                        originx, originy), block.name));
                      occupy.setState(block);
                      occupy.count++;
                    }
                  } else if (offsety < 0) {
                    if (originy > 0 && !occupy.getState(new Block(new Point(originx, originy), block.name), 1)) {
                      block.point.y = (originy - 1)* Size.cellsize;
                      occupy.cancelState(new Block(new Point(
                        originx, originy), block.name));
                      occupy.setState(block);
                      occupy.count++;
                    }
                  } else {
                    block.point.x = originx * Size.cellsize;
                    block.point.y = originy * Size.cellsize;
                  }
                  offsety = 0;
                  complete(block);
                });
              },
              onHorizontalDragStart: (DragStartDetails details) {
                originx = block.point.x / Size.cellsize;
                originy = block.point.y / Size.cellsize;
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  if ((details.delta.dx + block.point.x + block.width - Size.cellsize) / Size.cellsize <= 3 &&
                      (details.delta.dx + block.point.x) / Size.cellsize >= 0 && offsetx <= Size.cellsize - 5 && offsetx >= -Size.cellsize + 5) {
                    offsetx += details.delta.dx;
                    if ((offsetx > 0 && !occupy.getState(new Block(new Point(originx, originy), block.name), 4)) ||
                        (offsetx < 0 && !occupy.getState(new Block(new Point(originx, originy), block.name), 3))) {
                      block.point.x += details.delta.dx;
                    }
                  }
                });
              },
              onHorizontalDragEnd: (DragEndDetails details) {
                setState(() {
                  if (offsetx > 0) {
                    if (originx < 3 && !occupy.getState(new Block(new Point(originx, originy), block.name), 4)) {
                      block.point.x = (originx + 1) * Size.cellsize;
                      occupy.cancelState(new Block(new Point(
                      originx, originy), block.name));
                      occupy.setState(block);
                      occupy.count++;
                    }
                  } else if (offsetx < 0) {
                      if (originx > 0 && !occupy.getState(new Block(new Point(originx, originy), block.name), 3)) {
                        block.point.x = (originx - 1)* Size.cellsize;
                        occupy.cancelState(new Block(new Point(
                        originx, originy), block.name));
                        occupy.setState(block);
                        occupy.count++;
                      }
                  } else {
                      block.point.x = originx * Size.cellsize;
                      block.point.y = originy * Size.cellsize;
                  }
                  offsetx = 0;
                  complete(block);
                });
              }
            ),
          ),
        ),
      ]
    );
  }
}
