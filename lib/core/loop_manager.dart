import 'dart:async';
import 'package:anime_engine/core/animation_manager.dart';
import 'package:anime_engine/core/animator.dart';

abstract class AnimaUpdatable {
  bool update(num deltaTime);
}

abstract class PlayableMixin implements AnimaUpdatable, ITrackable {
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

//  Todo : pause();
}

