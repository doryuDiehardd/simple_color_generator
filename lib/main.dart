import 'dart:math';

import 'package:flutter/material.dart';

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

  void _generateRGBColor() {
    setState(() {
      _r = Random().nextInt(256);
      _g = Random().nextInt(256);
      _b = Random().nextInt(256);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: 
        InkWell(
          onTap: () => _generateRGBColor(),
          child: Container(
            color: Color.fromARGB(_a, _r, _g, _b),
            child: Center(
              child: Text('Hey there\nRGB($_r, $_g, $_b)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ),
    );
  }
}
