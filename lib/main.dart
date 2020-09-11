import 'package:flutter/material.dart';
import 'package:flutter_animation/animating_together.dart';
import 'package:flutter_animation/implicit_animation.dart';
import 'package:flutter_animation/tween_animation.dart';

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
      home:
          AnimatingTogether(), // Change the class Name to see different types of animation
    );
  }
}
