import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/screens/home/controller_layout.dart';
import 'package:school_project/presentation/screens/school_code/school-code.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      AnimatedSplashScreen(
          duration: 3000,
          splash: SizedBox(
            height: 1200,
            child: Image.asset('assets/images/sc6.png',
              fit:BoxFit.fill,
            ),
          ),
          nextScreen: SchoolCode(),//ControllerLayout(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.leftToRight,
          backgroundColor: ColorManager.primary);
  }
}

