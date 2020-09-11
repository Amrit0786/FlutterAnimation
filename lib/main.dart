import 'package:flutter/material.dart';
import 'package:flutter_animation/explicit_animation.dart';
import 'package:flutter_animation/staggered_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StaggeredAnimation(),
    );
  }
}
