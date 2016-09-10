typedef num AnimationSetter(num value);
typedef num AnimationGetter();

class AnimationProperty{

  AnimationGetter _getter;
  AnimationSetter _setter;

  AnimationGetter get getter => _getter;
  AnimationSetter get setter => _setter;

  AnimationProperty(this._getter, this._setter);
}