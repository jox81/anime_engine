abstract class IPlugIn{
  bool checkOut(IPlugOut iPlugOut);
}

abstract class IPlugOut{
  bool checkIn(IPlugIn iPlugIn);
}

class PlugAnime implements IPlugIn, IPlugOut{

  @override
  bool checkIn(IPlugIn iPlugIn) {
    if(iPlugIn is PlugAnime) return false;

    return true;
  }

  @override
  bool checkOut(IPlugOut iPlugOut) {
    if(iPlugOut is PlugAnime) return false;

    return true;
  }
}