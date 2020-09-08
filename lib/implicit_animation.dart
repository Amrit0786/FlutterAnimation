import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  @override
  _ImplicitAnimationState createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  double _startWidth = 100;
  Color _startColor = Colors.green;
  double _startMargin = 1;
  double _startOpacity = 1;
  double _finalWidth = 200;
  Color _finalColor = Colors.teal;
  double _finalMargin = 20;
  double _finalOpacity = 0;
  bool _widthAnimated = false;
  bool _colorAnimated = false;
  bool _marginAnimated = false;
  bool _opacityAnimated = false;

  void toggle(Buttons button) {
    setState(() {
      switch (button) {
        case Buttons.Width:
          {
            _widthAnimated = !_widthAnimated;
            break;
          }
        case Buttons.Color:
          {
            _colorAnimated = !_colorAnimated;
            break;
          }
        case Buttons.Margin:
          {
            _marginAnimated = !_marginAnimated;
            break;
          }
        case Buttons.Opacity:
          {
            _opacityAnimated = !_opacityAnimated;
            break;
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        width: _widthAnimated ? _finalWidth : _startWidth,
        color: _colorAnimated ? _finalColor : _startColor,
        margin: EdgeInsets.all(_marginAnimated ? _finalMargin : _startMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                toggle(Buttons.Width);
              },
              child: Text('Animate Width'),
            ),
            RaisedButton(
              onPressed: () {
                toggle(Buttons.Color);
              },
              child: Text('Animate Color'),
            ),
            RaisedButton(
              onPressed: () {
                toggle(Buttons.Margin);
              },
              child: Text('Animate Margin'),
            ),
            RaisedButton(
              onPressed: () {
                toggle(Buttons.Opacity);
              },
              child: Text('Animate Opacity'),
            ),
            AnimatedOpacity(
              opacity: _opacityAnimated ? _finalOpacity : _startOpacity,
              duration: Duration(seconds: 1),
              child: Text(
                'Opacity',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum Buttons { Width, Color, Margin, Opacity }
