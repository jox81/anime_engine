import 'dart:async';
import 'dart:html';
import 'dart:math';
import 'package:anime_engine/stagexl/animatable_object.dart';
import 'package:stagexl/stagexl.dart';
import 'package:anime_engine/core/animator.dart';
import 'package:anime_engine/core/animation_manager.dart';

main() {
  runZoned(_main, onError: (e, stackTrace) {
    String stack = '$stackTrace';
    stack = stack.split('\n').take(10).join('\n');

    String error = '$e $stack';

    print(error);
    window.alert(error);
  });
}

_main() async {
  CanvasElement canvas = new Element.tag('canvas');
  canvas.height = 300;
  canvas.width = 300;
  document.body.children.add(canvas);

  var stage = new Stage(canvas);
  var renderLoopXL = new RenderLoop();
  renderLoopXL.addStage(stage);
  renderLoopXL.juggler.add(new AnimeManagerXL());

  Random random = new Random();

  for (int i = 0; i < 200; i++) {
    AnimatableObject ao = new AnimatableObject(
        color: Color.YellowGreen, distMax: random.nextDouble() * 200);
    ao
      ..x = 0
      ..y = ao.squareWidth * random.nextDouble() * 200;
    stage.addChild(ao);

    int way = 5;
    switch(way){
      case 1:
        ao.a2.play();
        break;
      case 2:
        ao.a2P(ao.animationPropertyX).play();
        break;
      case 3:
        Animator animator = new Animator(ao.animationPropertyX, ao.a2);
        AnimeManager.manager.add(animator);
        break;
      case 4:
        ao.play(ao.a2);
        break;
      case 5:
        AnimeManager.manager.play(ao.a2);
        break;
      default:
        break;
    }

  }
}


