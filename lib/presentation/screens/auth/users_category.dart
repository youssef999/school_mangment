

 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_project/view_model/auth_view_model.dart';
import 'package:school_project/view_model/users_category_viewmodel.dart';
import 'package:school_project/presentation/resources/assets_manager.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/screens/auth/signup.dart';
import 'package:school_project/presentation/widgets/Custom_button.dart';
import 'package:school_project/presentation/widgets/custom_text.dart';



class UsersCategory extends GetWidget<UsersCategoryViewModel> {
   const UsersCategory({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         elevation: 0,
         backgroundColor: ColorManager.primary,
         toolbarHeight: 1,
       ),
       body:GetBuilder(
           init:UsersCategoryViewModel(),
           builder: (value) =>
        Column(
             children: [

               const SizedBox(height:30),
               Container(
                 height:90,
                 width: 200,
                 child:
                 Image.asset(AssetsManager.school1),
               ),
               Custom_Text(text: 'مدرستي المطورة',fontSize:21,
                   color:ColorManager.black,alignment:Alignment.center),
               const SizedBox(height:70),
               Padding(
                 padding: const EdgeInsets.only(left:120.0),
                 child: Directionality(
                   textDirection: TextDirection.rtl,
                   child: Custom_Text(text: 'هل انت ؟  ',
                   fontSize:22,
                     color:ColorManager.grey,
                   ),
                 ),
               ),
               const SizedBox(height:20,),
               Padding(
                 padding: const EdgeInsets.only(left:210.0),
                 child: Directionality(
                   textDirection: TextDirection.rtl,
                   child: ListTile(
                     title: Custom_Text(text: 'ولي امر ',
                     color:ColorManager.black
                     ),
                     leading: Radio<User>(
                       value: User.parent,
                       groupValue: controller.user_category,
                       onChanged: (User? value) {
                         controller.changeUserCategory(value);
                       },
                     ),
                   ),
                 ),
               ),
               const SizedBox(height:10,),
               Padding(
                 padding: const EdgeInsets.only(left:210.0),
                 child: Directionality(
                   textDirection: TextDirection.rtl,
                   child: ListTile(
                     title:  Custom_Text(text: 'طالب',
                         color:ColorManager.black
                     ),
                     leading: Radio<User>(
                       value: User.student,
                       groupValue: controller.user_category,
                       onChanged: (User? value) {
                         controller.changeUserCategory(value);
                       },
                     ),
                   ),
                 ),
               ),
               const SizedBox(height:10,),
               Padding(
                 padding: const EdgeInsets.only(left:210.0),
                 child: Directionality(
                   textDirection: TextDirection.rtl,
                   child: ListTile(
                     title:  Custom_Text(text: 'معلم',
                         color:ColorManager.black
                     ),
                     leading: Radio<User>(
                       value: User.teacher,
                       groupValue: controller.user_category,
                       onChanged: (User? value) {
                         controller.changeUserCategory(value);
                       },
                     ),
                   ),
                 ),
               ),
               const SizedBox(height:10,),
               CustomButton(
                 text: 'التالي',
                 color1:ColorManager.primary,
                 color2: ColorManager.black,
                 onPressed:(){
                   Get.put(() => AuthViewModel());
                   print("xx"+controller.user_category.toString());
                Get.to(SignUpScreen(
                  user_category:controller.user_category.toString()));

                 },
               )

             ],
         ),

       ),
     );
   }
 }
