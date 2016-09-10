@TestOn('vm')
import "package:test/test.dart";
import 'package:anime_engine/core/keyframe.dart';
import 'package:anime_engine/core/timeline.dart';
import 'package:anime_engine/core/animation_controller.dart';

void main() {
  group("Keyframes", () {
    test("create Keyframe", () async {
      Keyframe key = new Keyframe();
      expect(key, isNotNull);
    });

    //value
    test("add value to Keyframe", () async {
      Keyframe key = new Keyframe();
      key.value = 10.0;
      expect(key.value, equals(10.0));
    });

    test("add value to Keyframe at construct time", () async {
      Keyframe key = new Keyframe(value: 10.0);
      expect(key.value, equals(10.0));
    });

    test("can change value", () async {
      Keyframe key = new Keyframe(value: 5.0);
      key.value = 10.0;
      expect(key.value, equals(10.0));
    });

    //time
    test("add time to Keyframe", () async {
      Keyframe key = new Keyframe(value: 10.0);
      key.time = 10.0;
      expect(key.time, equals(10.0));
    });

    test("add time to Keyframe at construct time", () async {
      Keyframe key = new Keyframe(time: 5.0);
      expect(key.time, equals(5.0));
    });

    test("acane move key in time", () async {
      Keyframe key = new Keyframe(time: 5.0);
      key.time = 10.0;
      expect(key.time, equals(10.0));
    });
  });

  group("AnimationProperty", () {
    test("create AnimationProperty", () async {
      NumController controller = new NumController();
      expect(controller, isNotNull);
    });

    test("add key to NumController - way 1", () async {
      NumController controller = new NumController();
      controller.keys.add(new Keyframe());
      expect(controller.keys.length > 0, isTrue);
    });

    test("add key to Timeline - way 2", () async {
      Timeline timeline = new Timeline();
      timeline.addKeyframe(new Keyframe());
      expect(timeline.keys.length > 0, isTrue);
    });
  });

  group("AnimationController", () {
    test("create Controller", () async {
      NumController controller = new NumController();
      expect(controller, isNotNull);
    });

    test("add key to NumController - way 1", () async {
      NumController controller = new NumController();
      controller.keys.add(new Keyframe());
      expect(controller.keys.length > 0, isTrue);
    });

    test("add key to Timeline - way 2", () async {
      Timeline timeline = new Timeline();
      timeline.addKeyframe(new Keyframe());
      expect(timeline.keys.length > 0, isTrue);
    });
  });
}
