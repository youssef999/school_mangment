import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:school_project/view_model/auth_view_model.dart';
import 'package:school_project/presentation/resources/assets_manager.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/widgets/Custom_Text.dart';
import 'package:school_project/presentation/widgets/Custom_button.dart';
import 'package:school_project/presentation/widgets/custom_textformfield.dart';


class SignUpScreen extends GetWidget<AuthViewModel> {


 String ? user_category;

 SignUpScreen({this.user_category});

  @override
 Widget build(BuildContext context) {
   //Get.put(() => AuthViewModel());

  if(user_category == 'User.student') {
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
               text: 'Sign up',
               color:ColorManager.black,
               fontSize:25,
              )),
          const SizedBox(
           height: 15,
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
           height: 55,
          ),
          Container(
           height: 80,
           padding: const EdgeInsets.symmetric(horizontal: 4),
           child:
           CustomTextFormField(
            controller:controller.nameController,
           color: ColorManager.black,
           obs:false,
           hint: 'ادخل اسمك ',
           obx: false,
           ),
          ),
          SizedBox(height: 30,),
          StatefulBuilder(

           builder: (BuildContext context, void Function(void Function()) setState) {
            return   DropdownButton(
             icon:  Icon(Icons.arrow_downward,color:ColorManager.black),

             style:  TextStyle(color: ColorManager.black,fontSize:19),
             underline: Container(
                 height: 2,
                 width: 200,
                 color: ColorManager.black
             ),
             value: controller.dropdownvalue3,
             items: controller.items3.map((String items) {
              return DropdownMenuItem(
               value: items,
               child: Text(items),
              );
             }).toList(),
             onChanged: (String? newValue) {

              setState(() => controller.dropdownvalue3 = newValue.toString());

             },
            );
           },


          ),
          const SizedBox(
           height: 15,
          ),
          Container(
           height: 80,
           child:
           CustomTextFormField(
            controller:controller.emailController,
            color: ColorManager.black,
            obs:false,
            hint: 'ادخل البريد الالكتروني الخاص بك ',
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
           text: 'انشاء الحساب ',
           color1:ColorManager.primary,
           color2: ColorManager.black,
           onPressed:(){
            controller.formKey.currentState!.save();
            if (controller.formKey.currentState!.validate()) {
             controller.signupWithEmailAndPasswordAsStudent();
            }
           },
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

  if(user_category == 'User.parent') {
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
          Center(
            child: Container(
                child:Custom_Text(
                 text: 'Sign up',
                 color:ColorManager.black,
                 fontSize:25,
                )),
          ),
          const SizedBox(
           height: 50,
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
           height: 70,
           padding: const EdgeInsets.symmetric(horizontal: 4),
           child:
           CustomTextFormField(
            controller:controller.nameController,
           color: ColorManager.black,
           obs:false,
           hint: 'ادخل اسمك ',
           obx: false,
           ),
          ),
          const SizedBox(
           height: 10,
          ),
          const SizedBox(
           height: 10,
          ),
          Container(
           height: 70,
           padding: const EdgeInsets.symmetric(horizontal: 4),
           child:
           CustomTextFormField(
            controller:controller.studentIdController,
            color: ColorManager.black,
            obs:false,
            hint: 'ادخل رمز الطالب ',
            obx: false,
           ),
          ),
          const SizedBox(
           height: 10,
          ),

          Container(
           height: 70,
           child:
           CustomTextFormField(
            controller:controller.emailController,
            color: ColorManager.black,
            obs:false,
            hint: 'ادخل البريد الالكتروني ',
            obx: false,
           ),
          ),
          const SizedBox(
           height: 10,
          ),
          Container(
           height: 70,
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
           text: 'انشاء الحساب ',
           color1:ColorManager.primary,
           color2: ColorManager.black,
           onPressed:(){
            controller.formKey.currentState!.save();
            if (controller.formKey.currentState!.validate()) {
             controller.signupWithEmailAndPasswordAsParent();
            }
           },
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

  if(user_category == 'User.teacher') {
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
       padding:EdgeInsets.all(15.0),
       child: Form(
        key: controller.formKey,
        child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
          Container(
              alignment: Alignment.center,
              child:Custom_Text(
               text: 'Sign up',
               color:ColorManager.black,
               fontSize:25,
              )),



          Container(
           width: 220,
           height: 120,
           child: Image.asset(
           AssetsManager.school1,
            fit: BoxFit.scaleDown,
           ),
          ),
          Custom_Text(text: 'مدرستي المطورة',fontSize:21,
              color:ColorManager.black,alignment:Alignment.center),

          const SizedBox(
           height: 55,
          ),
          Container(
           height: 80,
           padding: const EdgeInsets.symmetric(horizontal: 4),
           child:
           CustomTextFormField(
            controller:controller.nameController,
           color: ColorManager.black,
           obs:false,
           hint: 'ادخل اسمك ',
           obx: false,
           ),
          ),
          SizedBox(
           height: 15,
          ),
          StatefulBuilder(

            builder: (BuildContext context, void Function(void Function()) setState) {
             return   DropdownButton(
              icon:  Icon(Icons.arrow_downward,color:ColorManager.black),

              style:  TextStyle(color: ColorManager.black,fontSize:19),
              underline: Container(
                  height: 2,
                  width: 200,
                  color: ColorManager.black
              ),
              value: controller.dropdownvalue2,
              items: controller.items2.map((String items) {
               return DropdownMenuItem(
                value: items,
                child: Text(items),
               );
              }).toList(),
              onChanged: (String? newValue) {

               setState(() => controller.dropdownvalue2 = newValue.toString());

              },
             );
            },


          ),
          SizedBox(
           height: 15,
          ),
          StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState)
            {
             return
              DropdownButton(
               icon:  Icon(Icons.arrow_downward,color:ColorManager.black),

               style:  TextStyle(color: ColorManager.black,fontSize:19),
               underline: Container(
                   height: 2,
                   width: 200,
                   color: ColorManager.black
               ),
              value: controller.dropdownvalue,

              items: controller.items.map((String items) {
               return DropdownMenuItem(
                value: items,
                child: Text(items),
               );
              }).toList(),
              onChanged: (String? newValue) {

               setState(() => controller.dropdownvalue = newValue.toString());

               },
             );
            },


          ),


          const SizedBox(
           height: 15,
          ),
          Container(
           height: 80,
           child:
           CustomTextFormField(
            controller:controller.emailController,
            color: ColorManager.black,
            obs:false,
            hint: 'ادخل البريد الالكتروني ',
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
           text: 'انشاء الحساب ',
           color1:ColorManager.primary,
           color2: ColorManager.black,
           onPressed:(){
            controller.formKey.currentState!.save();
            if (controller.formKey.currentState!.validate()) {
             controller.signupWithEmailAndPasswordAsTeacher();
            }
           },
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

  else{
   return Container();
  }
 }
}

class Notification extends StatefulWidget {
 const Notification({Key? key}) : super(key: key);

 @override
 State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
 @override
 void initState() {
  super.initState();
  OneSignal.shared.setLogLevel(OSLogLevel.debug, OSLogLevel.none);
  OneSignal.shared.setAppId("baabdcff-6401-4531-9fde-768eb422047a");
 }

 @override
 Widget build(BuildContext context) {
  return const Scaffold(
   backgroundColor: Colors.white,
  );
 }
}
