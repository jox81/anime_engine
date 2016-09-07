import 'package:anime_engine/core/loop_manager.dart';
import 'package:anime_engine/core/animation_property.dart';

class Animator implements AnimaUpdatable{

  ITrackable trackable;
  AnimationSetter animationSetter;

  Map<AnimationSetter, ITrackable> _map = new Map();

  num _time = 0;
  num _value = 0;

  Animator(AnimationProperty animationProperty, this.trackable):this.animationSetter = animationProperty.setter;

  //Todo : ajouter une possibilité de garder plusieur éléments
//  addAnimation(AnimationProperty animationProperty, ITrackable trackable){
//    _map[animationProperty.setter] = trackable;
//  }

  @override
  bool update(num deltaTime) {
    _time += deltaTime;
    _value = animationSetter(trackable.getValueAtTime(_time));
    return _value != double.NAN;
  }
}

abstract class ITrackable{
  num getValueAtTime(num time);
}