
 import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:school_project/view_model/auth_view_model.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/widgets/Custom_button.dart';

class TestScreen extends GetWidget<AuthViewModel>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Center(
        child: Column(
          children: [
            SizedBox(height: 60,),
            Container(
              height: 90,
              child:Image.asset('assets/images/sc6.png',fit:BoxFit.scaleDown,),
            ),
            SizedBox(height: 20,),
            CustomButton(
              text: 'تسجيل دخول كطالب',
              color1:ColorManager.primary,
              color2: ColorManager.black,
              onPressed:(){

                  controller.signInTesting();

              },
            ),
            SizedBox(height: 20,),
            CustomButton(
              text: 'تسجيل دخول كولي امر',
              color1:ColorManager.primary,
              color2: ColorManager.black,
              onPressed:(){

                controller.signInTesting2();

              },
            ),
            SizedBox(height: 20,),
            CustomButton(
              text: 'تسجيل دخول كمعلم',
              color1:ColorManager.primary,
              color2: ColorManager.black,
              onPressed:(){

                controller.signInTesting3();

              },
            ),
          ],
        ),
      ),
    );
  }


 }