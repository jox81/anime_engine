import 'package:anime_engine/core/loop_manager.dart';
import 'package:anime_engine/core/keyframe.dart';
import 'package:anime_engine/core/animator.dart';
import 'package:anime_engine/core/animation_property.dart';

abstract class Timeline extends PlayableMixin implements ITrackable {
  List<Keyframe> keys = new List();

  Timeline(this.animationProperty);

  num get duration {
    keys.sort((a, b) => a.time.compareTo(b.time));
    print('duration : ${keys.first.time}');
    return keys.first.time;
  }

  void addKeyframe(Keyframe keyframe) {
    keys.add(keyframe);
  }

  @override
  bool update(num deltaTime) {
    // TODO: implement update
    return false;
  }

  @override
  num getValueAtTime(num time) {
    // TODO: implement getValueAtTime
    return 0;
  }

  @override
  AnimationProperty animationProperty;
}