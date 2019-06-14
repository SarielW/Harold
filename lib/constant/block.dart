import 'package:flutter/material.dart';
import 'point.dart';
import 'type.dart';
import 'size.dart';

// 定义块的位置、大小
class Block {
  double width, height;
  String name;
  Point point = new Point(0, 0);
  Type type;
  String imageSrc;

  Block(Point point, String name) {
    this.point.x = point.x * Size.cellsize;
    this.point.y = point.y * Size.cellsize;
    this.name = name;
    if (name == "caocao") {
      type = Type.type4;
      imageSrc = "images/caocao.png";
//      img = AssetImage("images/wood.png");
    } else if (name == "guanyu") {
      type = Type.type3;
      imageSrc = "images/guanyu.png";
//      img = AssetImage("images/home.png");
    } else
    if (name == "zhangfei" || name == "zhaoyun" || name == "huangzhong" ||
        name == "machao") {
      type = Type.type2;
      if (name == "zhangfei") {
        imageSrc = "images/zhangfei.png";
      } else if (name == "zhaoyun") {
        imageSrc = "images/zhaoyun.png";
      } else if (name == "huangzhong") {
        imageSrc = "images/huangzhong.png";
      } else {
        imageSrc = "images/machao.png";
      }
    } else if (name == "zu") {
      imageSrc = "images/zu.png";
      type = Type.type1;
    } else {
      type = null;
      imageSrc = null;
    }
    if (type == Type.type1) {
      width = Size.cellsize;
      height = Size.cellsize;
    } else if (type == Type.type2) {
      width = Size.cellsize;
      height = 2 * Size.cellsize;
    } else if (type == Type.type3) {
      width = 2 * Size.cellsize;
      height = Size.cellsize;
    } else if (type == Type.type4) {
      width = 2 * Size.cellsize;
      height = 2 * Size.cellsize;
    } else {
      width = 0;
      height = 0;
    }
  }
}