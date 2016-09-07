import 'dart:html';
import 'package:anime_engine/core/animation_manager.dart';

class RenderLoop{

  //RenderLoop
  num _globalFrameTime = double.MAX_FINITE;

  RenderLoop() {
    _frameLoopInitializer();
  }

  bool _frameLoopInitializer() {
    window.requestAnimationFrame(_animationFrame);
    return true;
  }

  void _animationFrame(num frameTime) {
    var currentFrameTime = frameTime / 1000.0;
    var deltaTime = currentFrameTime - _globalFrameTime;

    AnimeManager.manager.update(deltaTime);

    _globalFrameTime = currentFrameTime;
    window.requestAnimationFrame(_animationFrame);
  }

}