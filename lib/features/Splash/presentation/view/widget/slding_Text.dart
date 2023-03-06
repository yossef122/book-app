import 'package:flutter/material.dart';

class sldingText extends StatelessWidget {
  // const sldingText({Key? key}) : super(key: key);
  late Animation<Offset> slidingAnimation;

  sldingText({required this.slidingAnimation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (BuildContext context, Widget? child) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            'read free books',
            textAlign: TextAlign.center,
          ),
        );
      },
      animation: slidingAnimation,
    );
  }
}
