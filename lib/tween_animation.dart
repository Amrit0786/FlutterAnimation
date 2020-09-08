import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  bool isAnimated = false;

  bool toggleAnimation() => isAnimated = !isAnimated;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Center(
            child: RaisedButton(
              onPressed: () => setState(() {
                toggleAnimation();
              }),
              child: Text(isAnimated ? 'Reset' : 'Animate'),
            ),
          ),
          isAnimated
              ? TweenAnimationBuilder(
                  child: Text(
                    'Tween Animation',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  duration: Duration(seconds: 1),
                  tween: Tween<double>(begin: 0, end: 1),
                  builder: (context, val, child) {
                    return Opacity(
                      child: Padding(
                          padding: EdgeInsets.all(val * 100), child: child),
                      opacity: val,
                    );
                  },
                )
              : Text(''),
        ],
      ),
    );
  }
}
