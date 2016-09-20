@TestOn('vm')
import "package:test/test.dart";
import 'package:anime_engine/core/keyframe.dart';
import 'package:anime_engine/core/timeline.dart';
import 'package:anime_engine/core/animation_controller.dart';
import 'package:anime_engine/core/animation_property.dart';

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
      MockObject mockObject = new MockObject();
      mockObject.animationPropertyX.setter(5);
      expect(mockObject.animationPropertyX.getter(), 5);
    });
  });

  group("AnimationController", () {
    test("create Timeline", () async {
      MockObject mockObject = new MockObject();
      Timeline timeline = new NumController(mockObject.animationPropertyX);
      expect(timeline, isNotNull);
    });

    test("add key to Timeline - way 1", () async {
      MockObject mockObject = new MockObject();
      Timeline timeline = new NumController(mockObject.animationPropertyX);
      timeline.keys.add(new Keyframe());
      expect(timeline.keys.length > 0, isTrue);
    });

    test("add key to Timeline - way 2", () async {
      MockObject mockObject = new MockObject();
      Timeline timeline = new NumController(mockObject.animationPropertyX);
      timeline.addKeyframe(new Keyframe());
      expect(timeline.keys.length > 0, isTrue);
    });

    test("add key at same time", () async {
      MockObject mockObject = new MockObject();
      Timeline timeline = new NumController(mockObject.animationPropertyX);
      timeline.addKeyframe(new Keyframe(time: 1.0, value: 1.0));
      timeline.addKeyframe(new Keyframe(time: 1.0, value: 3.0));
      expect(timeline.keys.length == 1, isTrue);
    });

    test("getValueAtTime", () async {
      MockObject mockObject = new MockObject();
      Timeline timeline = new NumController(mockObject.animationPropertyX);
      timeline.addKeyframe(new Keyframe());
      expect(timeline.keys.length == 1, isTrue);

      expect(timeline.getValueAtTime(0.0),0.0);
    });

    test("getValueAtTime - 2", () async {
      MockObject mockObject = new MockObject();
      Timeline timeline = new NumController(mockObject.animationPropertyX);
      timeline.addKeyframe(new Keyframe(time: 0.0, value: 1.0));
      timeline.addKeyframe(new Keyframe(time: 1.0, value: 2.0));
      expect(timeline.keys.length == 2, isTrue);

      expect(timeline.getValueAtTime(0.0),1.0);
      expect(timeline.getValueAtTime(1.0),2.0);
    });

    test("getValueAtTime - 3", () async {
      MockObject mockObject = new MockObject();
      Timeline timeline = new NumController(mockObject.animationPropertyX);
      timeline.addKeyframe(new Keyframe());
      timeline.addKeyframe(new Keyframe(time: 1.0, value: 0.5));
      timeline.addKeyframe(new Keyframe(time: 1.0, value: 1.0));//Should remove older
      timeline.addKeyframe(new Keyframe(time: 2.0, value: 2.0));
      expect(timeline.keys.length == 3, isTrue);

      expect(timeline.getValueAtTime(0.0),0.0);
      expect(timeline.getValueAtTime(1.0),1.0);
      expect(timeline.getValueAtTime(2.0),2.0);
    });

    test("getValueAtTime - 4", () async {
      MockObject mockObject = new MockObject();
      Timeline timeline = new NumController(mockObject.animationPropertyX);
      timeline.addKeyframe(new Keyframe(time: 0.0, value: 0.0));
      timeline.addKeyframe(new Keyframe(time: 4.0, value: 8.0));
      expect(timeline.keys.length == 2, isTrue);

      expect(timeline.getValueAtTime(1.0),2.0);
    });

    test("getValueAtTime - 5 - get value before a key", () async {
      MockObject mockObject = new MockObject();
      Timeline timeline = new NumController(mockObject.animationPropertyX);
      timeline.addKeyframe(new Keyframe(time: 2.0, value: 4.0));
      timeline.addKeyframe(new Keyframe(time: 4.0, value: 8.0));
      expect(timeline.keys.length == 2, isTrue);

      expect(timeline.getValueAtTime(1.0),4.0);
    });

    test("getValueAtTime - 6 - get value before after key", () async {
      MockObject mockObject = new MockObject();
      Timeline timeline = new NumController(mockObject.animationPropertyX);
      timeline.addKeyframe(new Keyframe(time: 2.0, value: 4.0));
      timeline.addKeyframe(new Keyframe(time: 4.0, value: 8.0));
      expect(timeline.keys.length == 2, isTrue);

      expect(timeline.getValueAtTime(6.0),8.0);
    });
  });
}

class MockObject{
  num x = 0;
  AnimationProperty get animationPropertyX => new AnimationProperty(()=> x, (num v)=> x = v);
}