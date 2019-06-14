import 'package:flutter_harold/constant/size.dart';
import 'package:flutter_harold/constant/block.dart';
import 'package:flutter_harold/constant/type.dart';

class Occupy {
  List<bool> state = new List(20);
  Occupy() {
    for(int i = 0; i < 20; i++) {
      state[i] = false;
    }
  }
  int count = 0;

  /* direction:
        1: 向上移动时查看上方空闲位置
        2：向下移动时查看下方空闲位置
        3：向左移动时查看左方空闲位置
        4：向右移动时查看右方空闲位置
  */

  bool getState(Block block, int direction) {
    if (block.type == Type.type1)
      switch (direction) {
        case 1:
          return state[((block.point.y/Size.cellsize - 1) * 4 + block.point.x/Size.cellsize).round()];
        case 2:
          return state[((block.point.y/Size.cellsize + 1 )* 4 + block.point.x/Size.cellsize).round()];
        case 3:
          return state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize - 1).round()];
        case 4:
          return state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize + 1).round()];
      }
    if (block.type == Type.type2) {
      switch (direction) {
        case 1:
          return state[((block.point.y/Size.cellsize - 1)* 4 + block.point.x/Size.cellsize).round()];
        case 2:
          return state[((block.point.y/Size.cellsize + 2) * 4 + block.point.x/Size.cellsize).round()];
        case 3:
          return state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize - 1).round()] ||
                 state[((block.point.y/Size.cellsize + 1) * 4 + block.point.x/Size.cellsize - 1).round()];
        case 4:
          return state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize + 1).round()] ||
              state[((block.point.y/Size.cellsize + 1) * 4 + block.point.x/Size.cellsize + 1).round()];
      }
    }
    if (block.type == Type.type3) {
      switch (direction) {
        case 1:
          return state[((block.point.y/Size.cellsize - 1) * 4 + block.point.x/Size.cellsize).round()] ||
              state[((block.point.y/Size.cellsize - 1) * 4 + block.point.x/Size.cellsize + 1).round()];
        case 2:
          return state[((block.point.y/Size.cellsize + 1) * 4 + block.point.x/Size.cellsize).round()] ||
              state[((block.point.y/Size.cellsize + 1) * 4 + block.point.x/Size.cellsize + 1).round()];
        case 3:
          return state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize - 1).round()];
        case 4:
          return state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize + 2).round()];

      }
    }
    if (block.type == Type.type4) {
      switch (direction) {
        case 1:
          return state[((block.point.y/Size.cellsize - 1) * 4 + block.point.x/Size.cellsize).round()] ||
              state[((block.point.y/Size.cellsize - 1) * 4 + block.point.x/Size.cellsize + 1).round()];
        case 2:
          return state[((block.point.y/Size.cellsize + 2) * 4 + block.point.x/Size.cellsize).round()] ||
              state[((block.point.y/Size.cellsize + 2) * 4 + block.point.x/Size.cellsize + 1).round()];
        case 3:
          return state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize - 1).round()] ||
              state[((block.point.y/Size.cellsize + 1) * 4 + block.point.x/Size.cellsize - 1).round()];
        case 4:
          return state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize + 2).round()] ||
              state[((block.point.y/Size.cellsize + 1) * 4 + block.point.x/Size.cellsize + 2).round()];
      }
    }
  }

  setState(Block block) {
    if ((block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize).round() > 19 &&
        (block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize).round() < 0) {
      print("set error!");
      return;
    }
    state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize).round()] = true;
    if (block.type == Type.type2) {
      state[((block.point.y/Size.cellsize + 1) * 4 + block.point.x/Size.cellsize).round()] = true;
    }
    if (block.type == Type.type3) {
      state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize + 1).round()] = true;
    }
    if (block.type == Type.type4) {
      state[((block.point.y/Size.cellsize + 1) * 4 + block.point.x/Size.cellsize).round()] = true;
      state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize + 1).round()] = true;
      state[((block.point.y/Size.cellsize + 1) * 4 + block.point.x/Size.cellsize + 1).round()] = true;
    }
  }

  cancelState(Block block) {
    if ((block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize).round() > 19 &&
        (block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize).round() < 0) {
      print("cancel error!");
      return;
    }
    if (block.type == Type.type1)
      state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize).round()] = false;
    if (block.type == Type.type2) {
      state[((block.point.y/Size.cellsize + 1) * 4 + block.point.x/Size.cellsize).round()] = false;
      state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize).round()] = false;
    }
    if (block.type == Type.type3) {
      state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize).round()] = false;
      state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize + 1).round()] = false;
    }
    if (block.type == Type.type4) {
      state[((block.point.y/Size.cellsize + 1) * 4 + block.point.x/Size.cellsize).round()] = false;
      state[((block.point.y/Size.cellsize + 1) * 4 + block.point.x/Size.cellsize + 1).round()] = false;
      state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize).round()] = false;
      state[(block.point.y/Size.cellsize * 4 + block.point.x/Size.cellsize + 1).round()] = false;
    }
  }
}