import 'package:anime_engine/core/loop_manager.dart';
import 'package:stagexl/src/animation.dart';

//The renderLoop of stagexl must update the manager... other solution ?
class AnimeManagerXL implements Animatable{

  @override
  bool advanceTime(num time) {
    return AnimeManager.manager.update(time);
  }
}

class AnimeManager {
  static AnimeManager _manager;

  List<AnimaUpdatable> _playables = new List();

  AnimeManager._init() {
  }

  static AnimeManager get manager {
    if (_manager == null) {
      _manager = new AnimeManager._init();
    }
    return _manager;
  }

  void add(AnimaUpdatable animatable) {
    _playables.add(animatable);
  }

  void remove(AnimaUpdatable animatable) {
    _playables.remove(animatable);
  }

  bool update(num deltaTime) {
    List<AnimaUpdatable> invalidPlayables = new List();
    print(_playables.length);
    for (AnimaUpdatable animatable in _playables) {
      if (!animatable.update(deltaTime)) {
        invalidPlayables.add(animatable);
      }
    }

    for (AnimaUpdatable animatable in invalidPlayables) {
      _playables.remove(animatable);
    }

    return true;
  }

  void play(PlayableMixin playable) {
    add(playable);
  }
}