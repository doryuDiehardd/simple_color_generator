import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _a = 255;
  int _r = 255;
  int _g = 255;
  int _b = 255;
  String _hex = 0xFFFFFF.toString();
  final double _fontSize = 18;

  void _generateRGBColor() {
    const int limit = 256;
    setState(() {
      _r = Random().nextInt(limit);
      _g = Random().nextInt(limit);
      _b = Random().nextInt(limit);
    });
  }
  
  void _generateHEXColor() {
    setState(() {
      const int limit = 0xffffff;
      const radix = 16;
      _hex = Random().nextInt(limit).toRadixString(radix);
    });
  }

  @override
  Widget build(BuildContext context) {
    const int _rgbT = 255;
    const int _hexT = 0xFFababab;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
        Stack(
          children: [
            Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: InkWell(
                  key: const Key('rgbInkWell'),
                  onTap: () => _generateRGBColor(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    color: Color.fromARGB(_a, _r, _g, _b),
                    child: Center(
                      child: Text('\n\nRGB($_r, $_g, $_b)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(_a, _rgbT-_r, _rgbT-_g, _rgbT-_b),
                        fontSize: _fontSize,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  key: const Key('hexInkWell'),
                  onTap: () => _generateHEXColor(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    color: Color(int.parse("0xFF$_hex")),
                    child: Center(
                      child: Text('\n\nHEX(#${_hex})',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(int.parse("0xFF$_hex")+_hexT),
                        fontSize: _fontSize,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ],
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Hey  ', 
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: _fontSize,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(_a, _rgbT-_r, _rgbT-_g, _rgbT-_b),
                    ),
                  ),
                  Text(' there', 
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: _fontSize,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color(int.parse("0xFF$_hex")+_hexT),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
