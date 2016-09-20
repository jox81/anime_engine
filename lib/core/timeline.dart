import 'package:anime_engine/core/loop_manager.dart';
import 'package:anime_engine/core/keyframe.dart';
import 'package:anime_engine/core/animator.dart';
import 'package:anime_engine/core/animation_property.dart';
import 'package:vector_math/vector_math.dart';

abstract class Timeline extends PlayableMixin implements ITrackable {
  List<Keyframe> keys = new List();

  Timeline(this.animationProperty);

  num get duration {
    keys.sort((a, b) => a.time.compareTo(b.time));
    print('duration : ${keys.first.time}');
    return keys.first.time;
  }

  void addKeyframe(Keyframe keyframe) {
    Keyframe key =
        keys.firstWhere((k) => k.time == keyframe.time, orElse: () => null);
    if (key == null) {
      keys.add(keyframe);
    } else {
      key.value = keyframe.value;
    }
  }

  @override
  bool update(num deltaTime) {
    // TODO: implement update
    return false;
  }

  @override
  num getValueAtTime(num time) {

    //Only in linear interpolation for the moment

    keys.sort((a, b) => a.time.compareTo(b.time));
    Keyframe keyDown = keys.lastWhere((k) => k.time < time, orElse: () => null);
    Keyframe key = keys.lastWhere((k) => k.time == time, orElse: () => null);
    Keyframe keyUp = keys.firstWhere((k) => k.time > time, orElse: () => null);
    if (key != null) {
      return key.value;
    } else if (keyDown != null && keyUp != null) {
      num timeDiff = keyUp.time - keyDown.time;
      num timeAdvance = time - keyDown.time;

      num factor = timeAdvance / timeDiff;

      Vector2 vkDown = new Vector2(keyDown.time, keyDown.value);
      Vector2 vkUp = new Vector2(keyUp.time, keyUp.value);
      Vector2 v = (vkUp - vkDown);
      Vector2 vProp = v * factor;

      return vProp.y;
    } else if (keyUp != null) {
      return keyUp.value;
    } else if (keyDown != null) {
      return keyDown.value;
    }

    return null;
  }

  @override
  AnimationProperty animationProperty;
}
