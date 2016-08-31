import 'dart:async';
import 'dart:html';
import 'dart:math';
import 'package:anime_engine/stagexl/animatable_object.dart';
import 'package:stagexl/stagexl.dart';

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
  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);

  Random random = new Random();

  for (int i = 0; i < 200; i++) {
    AnimatableObject ao = new AnimatableObject(
        color: Color.YellowGreen, distMax: random.nextDouble() * 200);
    ao
      ..x = 0
      ..y = ao.squareWidth * random.nextDouble() * 200;
    stage.addChild(ao);

    ao.a2.play();

  }
}
