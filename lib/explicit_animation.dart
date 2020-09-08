import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget {
  @override
  _ExplicitAnimationState createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation colorAnimation;
  Animation sizeAnimation;
  Animation curve;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    curve =
        CurvedAnimation(parent: animationController, curve: Curves.slowMiddle);
    colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(curve);

    sizeAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(begin: 200, end: 300),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 300, end: 200),
        weight: 50,
      ),
    ]).animate(curve);

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return IconButton(
              padding: EdgeInsets.zero,
              iconSize: sizeAnimation.value,
              icon: Icon(
                Icons.favorite,
                color: colorAnimation.value,
              ),
              onPressed: () {
                isFav
                    ? animationController.reverse()
                    : animationController.forward();
              },
            );
          },
        ),
      ),
    );
  }
}
