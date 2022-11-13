
import 'package:firebase_auth/firebase_auth.dart'as Userx;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/screens/auth/login.dart';
import 'package:school_project/presentation/screens/profile/profile_screen.dart';
import 'package:school_project/presentation/widgets/custom_textformfield.dart';

class EditProfile extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        elevation: 0,

      ),
      body: Container(
        child: Center(
          child: ListView(
            children: [
              Center(
                child: Text("تعديل البروفايل",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child:
                    CustomTextFormField(
                      controller: passwordController,
                      hint: "كلمة مرور جديدة",
                      obs: true,
                      input: false,
                      obx: true,
                      color:Colors.black,
                    ),



                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: CustomTextFormField(
                      controller: conpasswordController,
                      hint: 'تاكيد كلمة المرور',
                      obs: true,
                      input: false,
                      obx: true,
                       color:Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Get.off(ProfileScreen());
                      },
                      child: Text(
                        "الغاء",
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 2,
                          color: Colors.black,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (conpasswordController.text != passwordController.text) {
                          Get.snackbar('خطا ', '  كلمة مرور غير متطابقة ',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        } else {
                          changePawword();
                          Get.offAll(LoginScreen());
                        }
                      },
                      child: Text(
                        "حفظ",
                        style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
  changePawword() async {
    Userx.User ? user = Userx.FirebaseAuth.instance.currentUser;
    print("user" + user.toString());
    await user!.updatePassword(passwordController.text);
    Get.snackbar('تم ', ' تم تغير الباسورد بنجاح ',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white);
  }
}
