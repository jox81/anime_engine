@TestOn('vm')
import 'package:anime_engine/core/animation_framework.dart';
import 'package:anime_engine/stagexl/animatable_object.dart';
import "package:test/test.dart";

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
      Timeline t = new Timeline()..keys.add(new Keyframe(value: 10.0));
//      obj.timelineForProperty[] = t;
      expect(obj.x, equals(10.0));
    });
  });
}
