typedef num AnimationSetter(num value);
typedef num AnimationGetter();

class AnimationProperty{
  AnimationGetter getter;
  AnimationSetter setter;

  AnimationProperty(this.getter, this.setter);
}