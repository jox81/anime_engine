import 'loop_manager.dart';

enum playType { single, loop, reverseLoop, pingPong }

class Timeline extends PlayableMixin {
  List<Keyframe> keys = new List();

  void addKeyframe(Keyframe keyframe) {
    keys.add(keyframe);
  }

  @override
  bool update(num deltaTime) {
    // TODO: implement update
    return false;
  }
}

class Keyframe {
  num value;
  num time;

  Keyframe({this.time: 0.0, this.value: 0.0});
}

typedef bool ScriptAnimationUpdate(num deltaTime);

class ScriptAnimation extends PlayableMixin{

  final ScriptAnimationUpdate updateFunction;

  ScriptAnimation(this.updateFunction);

  @override
  bool update(num deltaTime) {
    return updateFunction(deltaTime);
  }
}


