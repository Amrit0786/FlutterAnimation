import 'package:flutter/material.dart';

class StaggeredAnimation extends StatefulWidget {
  @override
  _StaggeredAnimationState createState() => _StaggeredAnimationState();
}

class _StaggeredAnimationState extends State<StaggeredAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation sizeAnimation;
  Animation colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    sizeAnimation = Tween<double>(begin: 100, end: 300)
        .animate(CurvedAnimation(curve: Interval(0, 0.5), parent: _controller));
    colorAnimation = TweenSequence([
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.red, end: Colors.yellow), weight: 1),
      TweenSequenceItem(
          tween: ColorTween(begin: Colors.yellow, end: Colors.green), weight: 1)
    ]).animate(
      CurvedAnimation(curve: Interval(0.5, 1.0), parent: _controller),
    );
    ;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Container(
                  width: sizeAnimation.value,
                  height: sizeAnimation.value,
                  decoration: BoxDecoration(
                    color: colorAnimation.value,
                    border: Border(
                      bottom: BorderSide(color: Colors.black54),
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.ac_unit),
              iconSize: 50,
              onPressed: () {
                if (_controller.isCompleted) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
