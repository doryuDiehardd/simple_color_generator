import 'dart:math';
///Class for generating RGB using simple integers.
class RgbGenerator{
  ///Generates RGB color and gives list with data
  ///R at 0, G at 1, B at 2
  static List<int> rgbGenerator(){
    final List<int> list = [];
    const int limit = 256;
    list.add(Random().nextInt(limit));
    list.add(Random().nextInt(limit));
    list.add(Random().nextInt(limit));

    return list;
  }
}

