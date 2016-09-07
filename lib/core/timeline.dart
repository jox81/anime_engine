import 'package:anime_engine/core/loop_manager.dart';
import 'package:anime_engine/core/keyframe.dart';
import 'package:anime_engine/core/animator.dart';

class Timeline extends PlayableMixin implements ITrackable {
  List<Keyframe> keys = new List();

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
}