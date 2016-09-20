import 'package:anime_engine/stagexl/animatable_object.dart';
import "package:test/test.dart";
import 'package:anime_engine/core/timeline.dart';
import 'package:anime_engine/core/keyframe.dart';
import 'package:anime_engine/core/animation_controller.dart';
import 'package:anime_engine/core/animation_property.dart';

void main() {
  group("experiment", () {
    test("a", () async {
      AnimatableObject obj = new AnimatableObject();
      obj.x = 10.0;
      expect(obj.x, equals(10.0));
    });

    test("b", () async {
      AnimatableObject obj = new AnimatableObject();
      obj.x = 1.0;
      AnimationProperty animationPropertyX = new AnimationProperty(()=> obj.x, (num v)=> obj.x = v);
      new NumController(animationPropertyX)
        ..keys.add(new Keyframe(value: 10.0));
      expect(obj.x, equals(10.0));
    });
  });
}
