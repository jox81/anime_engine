import 'package:anime_engine/core/timeline.dart';
import 'package:anime_engine/core/animation_property.dart';

abstract class IAnimationController{

}

class NumController extends Timeline{
  NumController(AnimationProperty animationProperty) : super(animationProperty);
}