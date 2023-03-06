import 'package:bookly/features/Splash/presentation/view/widget/SplashView_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Placeholder(
      child: Scaffold(
        body: SplashView_body(),
      )
    );
  }
}
