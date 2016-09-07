@TestOn('vm')
import "package:test/test.dart";
import 'package:anime_engine/core/keyframe.dart';
import 'package:anime_engine/core/timeline.dart';

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

  group("Timeline", () {
    test("create Timeline", () async {
      Timeline timeline = new Timeline();
      expect(timeline, isNotNull);
    });

    test("add key to Timeline - way 1", () async {
      Timeline timeline = new Timeline();
      timeline.keys.add(new Keyframe());
      expect(timeline.keys.length > 0, isTrue);
    });

    test("add key to Timeline - way 2", () async {
      Timeline timeline = new Timeline();
      timeline.addKeyframe(new Keyframe());
      expect(timeline.keys.length > 0, isTrue);
    });
  });
}
