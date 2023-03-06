import 'package:bookly/Constants.dart';
import 'package:bookly/core/utils/Routing.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/Home/presentation/view/Home.dart';
import 'package:bookly/features/Splash/presentation/view/widget/slding_Text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:get/get.dart';

class SplashView_body extends StatefulWidget {
  const SplashView_body({Key? key}) : super(key: key);

  @override
  State<SplashView_body> createState() => _SplashView_bodyState();
}

class _SplashView_bodyState extends State<SplashView_body>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initslidinganimations();
    navigateToHome();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Assetsdata.logo),
        const SizedBox(
          height: 10,
        ),
        sldingText(
          slidingAnimation: slidingAnimation,
        )
      ],
    );
  }

  void initslidinganimations() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 20),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
    /* slidingAnimation.addListener(() {
      setState(() {});
    });*/
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
/*
      Get.to((){
        return const Home();
      },
        transition: Transition.downToUp,
        duration: mainTransitionDuration
      );
*/

      GoRouter.of(context).go(Routerbuild.kHomeScreen);
    });
  }
}
