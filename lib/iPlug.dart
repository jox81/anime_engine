import 'package:core_engine/plugin_manager.dart';

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