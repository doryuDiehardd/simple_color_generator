import 'package:flutter/material.dart';

import 'home_page.dart';

class ColorGenerator extends StatelessWidget {
  const ColorGenerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(title: 'Color Generator app'),
    );
  }
}