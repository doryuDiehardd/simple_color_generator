import 'package:flutter/material.dart';
import 'package:simple_color_generator/utils/hex_generator.dart';
import 'package:simple_color_generator/utils/rgb_generator.dart';
///Home page of 'simple color generator' app
class HomePage extends StatefulWidget {
  
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _a = 255;
  int _r = 255;
  int _g = 255;
  int _b = 255;
  String _hex = 0xFFFFFF.toString();
  final double _fontSize = 18;

  @override
  Widget build(BuildContext context) {
    const int _rgbT = 255;
    const int _hexT = 0xFFbfbfbf;

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
                    onTap: () {
                      final List<int> list = RgbGenerator.rgbGenerator();
                      setState((){
                        _r = list[0];
                        _g = list[1];
                        _b = list[2];
                      });
                    },
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
                    onTap: () {
                      final int hex = int.parse("0x$_hex");
                      if(hex.isEven){
                        setState((){
                          _hex = HexGenerator.hexGeneratorA();
                        });
                      }else{
                        setState((){
                          _hex = HexGenerator.hexGeneratorB();
                        });
                      }
                    },
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
