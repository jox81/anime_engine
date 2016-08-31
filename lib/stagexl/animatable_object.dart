import '../core/animation_framework.dart';
import '../core/loop_manager.dart';
import 'package:stagexl/stagexl.dart';

class AnimatableObject extends DisplayObjectContainer {
  Bitmap _b;
  final num distMax;

  final num squareWidth;

  AnimatableObject({int color: Color.Red, this.distMax: 0, this.squareWidth : 5.0}) {
    _b = new Bitmap(new BitmapData(squareWidth, squareWidth, color));
    addChild(_b);
  }

  //
  PlayableMixin get a1 {
    Timeline t1 = new Timeline();
    //... add keys
    return t1;
  }

//
  PlayableMixin get a2 {
    return new ScriptAnimation((num deltaTime) {
      if (_b.x > distMax) return false;
      _b.x++;
      return true;
    });
  }

//
  PlayableMixin a3() {
    return null;
  }
}
