import '../core/loop_manager.dart';
import 'package:stagexl/stagexl.dart';
import 'package:anime_engine/core/script_animation.dart';
import 'package:anime_engine/core/animation_property.dart';

class AnimatableObject extends DisplayObjectContainer {
  Bitmap _b;
  final num distMax;

  final num squareWidth;

  AnimatableObject({int color: Color.Red, this.distMax: 0, this.squareWidth : 5.0}) {
    _b = new Bitmap(new BitmapData(squareWidth, squareWidth, color));
    addChild(_b);
  }

  PlayableMixin get a2 {
    AnimationProperty animationProperty = new AnimationProperty(()=> x, (num v)=> x = v);
    return new ScriptAnimation(animationProperty, (num deltaTime) {
      if (animationProperty.getter() > distMax) return double.NAN;
      animationProperty.setter(animationProperty.getter() + 1);
      return animationProperty.getter();
    });
  }

  void play(PlayableMixin playable) {
    playable.play();
  }
}


