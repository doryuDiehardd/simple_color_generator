import 'package:flutter/material.dart';
import 'package:simple_color_generator/widgets/home_page.dart';

///Root class of 'simple color generator' app
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