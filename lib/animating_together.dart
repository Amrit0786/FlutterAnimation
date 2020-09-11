import 'package:flutter/material.dart';

class AnimatingTogether extends StatefulWidget {
  @override
  _AnimatingTogetherState createState() => _AnimatingTogetherState();
}

class _AnimatingTogetherState extends State<AnimatingTogether> {
  Color _color = Colors.blue;
  double _width = 200;
  double _height = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: _width,
          height: _height,
          color: _color,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  _width = 300;
                  _height = 300;
                  _color = Colors.orange;
                  setState(() {});
                },
                icon: Icon(
                  Icons.add_box,
                  color: Colors.white,
                ),
                iconSize: 20,
              ),
              IconButton(
                onPressed: () {
                  _width = 200;
                  _height = 200;
                  _color = Colors.blue;
                  setState(() {});
                },
                icon: Icon(
                  Icons.indeterminate_check_box,
                  color: Colors.white,
                ),
                iconSize: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
