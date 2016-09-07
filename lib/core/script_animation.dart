import 'package:anime_engine/core/loop_manager.dart';
import 'package:anime_engine/core/animator.dart';
import 'package:anime_engine/core/animation_property.dart';

typedef num ScriptAnimationUpdate(deltaTime);

class ScriptAnimation extends PlayableMixin implements ITrackable{

  final ScriptAnimationUpdate updateFunction;

  ScriptAnimation(AnimationProperty animationProperty, this.updateFunction);

  num _value;

  @override
  bool update(num deltaTime) {
    _value = updateFunction(deltaTime);
    return _value != double.NAN;
  }

  @override
  num getValueAtTime(num time) {
    return updateFunction(time);
  }
}