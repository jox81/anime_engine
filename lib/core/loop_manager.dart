import 'dart:async';
import 'dart:html';

abstract class AnimaUpdatable {
  bool update(num deltaTime);
}

abstract class PlayableMixin implements AnimaUpdatable {
  Completer _completer;
  Future play({num fromTime, bool reverse}) {
    _completer = new Completer();
    AnimeManager.manager.add(this);
    return _completer.future;
  }

  stop() {
    AnimeManager.manager.remove(this);
    if (_completer != null && !_completer.isCompleted) {
      _completer.complete();
    }
  }

//  pause();
}

class AnimeManager {
  static AnimeManager _manager;

  List<AnimaUpdatable> _playables = new List();

  AnimeManager._init() {
    _frameLoopInitializer();
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

  //RenderLoop
  num _globalFrameTime = double.MAX_FINITE;

  bool _frameLoopInitializer() {
    window.requestAnimationFrame(_animationFrame);
    return true;
  }

  void _animationFrame(num frameTime) {
    var currentFrameTime = frameTime / 1000.0;
    var deltaTime = currentFrameTime - _globalFrameTime;

    update(deltaTime);

    _globalFrameTime = currentFrameTime;
    window.requestAnimationFrame(_animationFrame);
  }
}
