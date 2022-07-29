import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generate your color',
      home: const MyHomePage(title: 'Color Generator app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _a = 255;
  int _r = 255;
  int _g = 255;
  int _b = 255;
  String _hex = 0xFFFFFF.toString();
  final double _fontSize = 18;



  @override
  void initState() {
    _generateRGBColor();
    _generateHEXColor();
    super.initState();
  }

  void _generateRGBColor() async {
    setState(() {
      _r = Random().nextInt(256);
      _g = Random().nextInt(256);
      _b = Random().nextInt(256);
    });
  }
  
  void _generateHEXColor() {
    setState(() {
          _hex = Random().nextInt(16777217).toRadixString(16);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  onTap: () => _generateRGBColor(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    color: Color.fromARGB(_a, _r, _g, _b),
                    child: Center(
                      child: Text('RGB($_r, $_g, $_b)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(_a, 255-_r, 255-_g, 255-_b),
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
                  onTap: () => _generateHEXColor(),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    color: Color(int.parse("0xFF$_hex")),
                    child: Center(
                      child: Text('HEX(#${_hex.toUpperCase()})',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(int.parse("0xFF$_hex")+0xFFababab),
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
                      color: Color.fromARGB(_a, 255-_r, 255-_g, 255-_b),
                    ),
                  ),
                  Text(' there', 
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: _fontSize,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color(int.parse("0xFF$_hex")+0xFFababab),
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
