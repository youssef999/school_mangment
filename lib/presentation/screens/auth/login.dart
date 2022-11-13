import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:school_project/presentation/resources/assets_manager.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/screens/auth/users_category.dart';
import 'package:school_project/presentation/testing/test_screen.dart';
import 'package:school_project/presentation/widgets/Custom_Text.dart';
import 'package:school_project/presentation/widgets/Custom_button.dart';
import 'package:school_project/presentation/widgets/custom_textformfield.dart';
import 'package:school_project/view_model/auth_view_model.dart';


 class LoginScreen extends GetWidget<AuthViewModel> {
  const LoginScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

  return  Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorManager.primary,
          toolbarHeight: 1,
        ),

        backgroundColor: Colors.white,
        body:
        SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          child:Custom_Text(
                            text: 'Login',
                            color:ColorManager.black,
                            fontSize:25,
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 220,
                        height: 90,
                        child: Image.asset(
                       AssetsManager.school1,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Custom_Text(text: 'مدرستي المطورة',fontSize:21,
                          color:ColorManager.black,alignment:Alignment.center),

                      const SizedBox(
                        height: 60,
                      ),

                      Container(
                        height: 80,
                        child:
                        CustomTextFormField(
                          controller:controller.emailController,
                          color: ColorManager.black,
                          obs:false,
                          hint: 'ادخل البريد الالكتروني  ',
                          obx: false,
                        ),

                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 80,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child:
                        CustomTextFormField(
                          controller:controller.passwordController,
                          color: ColorManager.black,
                          obs:true,
                          hint: 'ادخل كلمة المرور ',
                          obx: true,
                        ),
                      ),

                       SizedBox(height: 20,),

                      CustomButton(
                        text: 'تسجيل دخول',
                        color1:ColorManager.primary,
                        color2: ColorManager.black,
                        onPressed:(){
                          controller.formKey.currentState!.save();
                          if (controller.formKey.currentState!.validate()) {
                            controller.signInWithEmailAndPassword();
                          }
                        },
                      ),

                      CustomButton(
                        text: 'تجربة ',
                        color1:ColorManager.primary,
                        color2: ColorManager.black,
                        onPressed:(){
                        Get.to(TestScreen());
                        },
                      ),

                      const SizedBox(height:12,),
                      Row(
                        children: [
                          const SizedBox(width: 60,),
                          InkWell(
                            child:Custom_Text(
                              text: 'انشئ حساب الان',
                              color:ColorManager.grey,
                              fontSize:14,
                            ),
                            onTap:(){
                              Get.to(UsersCategory());
                            },
                          ),

                          const SizedBox(width:6,),
                          Custom_Text(text: 'لا تمتلك حساب ؟  ',
                            color:ColorManager.black,
                            fontSize:16,
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  }
}

