import 'dart:math';

///Class for generating color in HEX number.
class HexGenerator{
  ///Generates HEX color full number in one step.
  static String hexGeneratorA() {
    const int limit = 0xffffff;
    const radix = 16;

    return Random().nextInt(limit).toRadixString(radix);
  }
  ///Generates HEX color number step by step.
  static String hexGeneratorB(){
    const int limit = 0xf;
    const int radix = 16;
    const int lenght = 6;
    String hex = '';
    for (var i = 0; i < lenght; i++) {
      hex += Random().nextInt(limit).toRadixString(radix);
    }

    return hex;
  }
}

