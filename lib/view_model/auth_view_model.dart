
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_project/data/models/parent_model.dart';
import 'package:school_project/data/models/teacher_model.dart';
import 'package:school_project/presentation/screens/home/student/bottom_nav_bar.dart';
import 'package:school_project/presentation/firestore_user.dart';
import 'package:school_project/presentation/screens/home/parent/parent_bottom_bar.dart';
import 'package:school_project/presentation/screens/home/parent/parent_screen.dart';
import 'package:school_project/presentation/screens/home/student/studenthomescreen.dart';
import 'package:school_project/data/models/user_model.dart';
import 'package:school_project/presentation/screens/home/teacher/teacher_bottombar.dart';
import 'package:school_project/presentation/screens/home/teacher/teacher_screen.dart';



 class AuthViewModel extends GetxController{

   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   TextEditingController emailController =TextEditingController();
   TextEditingController nameController =TextEditingController();
   TextEditingController gradeController =TextEditingController();
   TextEditingController studentNameController =TextEditingController();
   TextEditingController studentIdController =TextEditingController();
   TextEditingController passwordController =TextEditingController();

   String dropdownvalue = 'الصف الاول الابتدائي';
   String dropdownvalue2 = 'لغة عربية';
   String dropdownvalue3 = 'الصف الاول الابتدائي';
   // List of items in our dropdown menu
   var items = [
     'الصف الاول الابتدائي',
     'الصف الثاني الابتدائي',
     'الصف الثالث الابتدائي',
     'الصف الرابع الابتدائي',
     'الصف الخامس الابتدائي',
     'الصف السادس الابتدائي',
      'الصف الاول المتوسط',
     'الصف الثاني المتوسط',
     'الصف الثالث المتوسط',
     'الصف الرابع العلمي',
     'الصف الرابع الادبي',
   'الخامس العلمي الأحيائي',
  'الخامس العلمي التطبيقي',
     'الصف الخامس الادبي',
   'الصف السادس العلمي تطبيقي',
     'الصف السادس العلمي احيائي',
      'الدراسه المهنيه',
      'الأول صناعه',
      'الثاني صناعه',
      'الثالث صناعه',
      'الأول تجارة',
      'الثاني تجارة',
       'الثالث تجارة'
   ];

   var items3 = [
     'الصف الاول الابتدائي',
     'الصف الثاني الابتدائي',
     'الصف الثالث الابتدائي',
     'الصف الرابع الابتدائي',
     'الصف الخامس الابتدائي',
     'الصف السادس الابتدائي',
     'الصف الاول المتوسط',
     'الصف الثاني المتوسط',
     'الصف الثالث المتوسط',
     'الصف الرابع العلمي',
     'الصف الرابع الادبي',
     'الخامس العلمي الأحيائي',
     'الخامس العلمي التطبيقي',
     'الصف الخامس الادبي',
     'الصف السادس العلمي تطبيقي',
     'الصف السادس العلمي احيائي',
     'الدراسه المهنيه',
     'الأول صناعه',
     'الثاني صناعه',
     'الثالث صناعه',
     'الأول تجارة',
     'الثاني تجارة',
     'الثالث تجارة'
   ];

   var items2 = [
     'اسلامية',
     'لغة عربية',
     'العلوم',
     'الاجتماعيات',
     'رياضيات',
     //'دراسات',
     'لغة انجليزية',
     // 'فيزياء',
     // 'كيمياء',
     // 'احياء',
     // 'جيولوجيا',
     // 'علم نفس',
     // 'فلسفة',
   ];

   void changeDropDown(String val){
     dropdownvalue=val;
     print("vvv="+val);
     update();
   }

   void changeDropDown2(String val){
     dropdownvalue2=val;
     print("vvv="+val);
     update();
   }


   FirebaseAuth _auth = FirebaseAuth.instance;


   void signupWithEmailAndPasswordAsStudent() async {


     var random = new Random();
     var x = random.nextInt(91);
     var x2= random.nextInt(999);
     var x3 =random.nextInt(130);
     print("gen="+x.toString());
     print("gen="+x2.toString());
     print("gen="+x3.toString());

     try {
       await _auth.createUserWithEmailAndPassword(email: emailController.text,
           password: passwordController.text )

           .then((user) async {
         saveUserAsStudent(user,
             nameController.text+x.toString()+x3.toString()+x2.toString(),
             dropdownvalue3);

         await FirebaseFirestore.instance
             .collection('students')
             .add({
           "name": nameController.text,
           "email": emailController.text,
           "grade": dropdownvalue3,
           "student_id" : nameController.text+x.toString()+x3.toString()+x2.toString()
         })
             .then((value) {
               print("id=="+nameController.text+x.toString()+x3.toString()+x2.toString());
           Get.snackbar("Done", " ",
               colorText: Colors.white,
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Colors.black,
               duration: const Duration(seconds: 3),
               borderRadius: 10,
               margin: const EdgeInsets.all(10),
               borderColor: Colors.black,
               borderWidth: 2,
               icon: const Icon(Icons.add_task, color: Colors.white));

         });
         Get.offAll(BottomBar(
           student_id: nameController.text+x.toString()+x3.toString()+x2.toString(),
           classx: dropdownvalue3
         ));
         final box = GetStorage();
         box.write('student_id',nameController.text+x.toString()+x3.toString()+x2.toString(),);
         box.write('class',dropdownvalue3);
         box.write('type','student');
       });
     }

     catch (e) {
       print(e.toString());
       Get.snackbar("Error Login Account", e.toString(),
           colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
     }
   }

   void signupWithEmailAndPasswordAsParent() async {
     try {
       await _auth.createUserWithEmailAndPassword(email: emailController.text,
           password: passwordController.text )

           .then((user) async {

         saveUserAsParent(user,'parent', studentIdController.text);

         await FirebaseFirestore.instance
             .collection('parents')
             .add({
           "student_name": nameController.text,
           "student_email": emailController.text,
           "name": nameController.text,
           "student_id":studentIdController.text,

         }).then((value) {
           Get.snackbar("Done", "user saved ".tr,
               colorText: Colors.white,
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Colors.black,
               duration: const Duration(seconds: 3),
               borderRadius: 10,
               margin: const EdgeInsets.all(10),
               borderColor: Colors.black,
               borderWidth: 2,
               icon: const Icon(Icons.add_task, color: Colors.white));
         });
         Get.offAll(ParentBottomBar(
           student_id: studentIdController.text,
         ));

         final box = GetStorage();
         box.write('student_id',studentIdController.text);
         box.write('type','parent');

       });
     }

     catch (e) {
       print(e.toString());
       Get.snackbar("Error Login Account", e.toString(),
           colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
     }
   }

   void signupWithEmailAndPasswordAsTeacher() async {

     try {
       await _auth.createUserWithEmailAndPassword(email: emailController.text,
           password: passwordController.text )

           .then((user) async {

         saveUserAsTeacher(user, 'teacher', dropdownvalue2, dropdownvalue);

         await FirebaseFirestore.instance
             .collection('teachers')
             .add({
           "name": nameController.text,
           "email": emailController.text,
            "subject":dropdownvalue2,
            "grade":dropdownvalue,


         }).then((value) {
           Get.snackbar("Done", "user saved ".tr,
               colorText: Colors.white,
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Colors.black,
               duration: const Duration(seconds: 3),
               borderRadius: 10,
               margin: const EdgeInsets.all(10),
               borderColor: Colors.black,
               borderWidth: 2,
               icon: const Icon(Icons.add_task, color: Colors.white));

         });
       });

         Get.off(TeacherBottomBar(
             email: emailController.text,
             sub:dropdownvalue2,
             grade:dropdownvalue,
             name:nameController.text,
         ));
         final box=GetStorage();

       box.write('teacher_email',emailController.text);
       box.write('sub',dropdownvalue2);
       box.write('grade',dropdownvalue);
       box.write('teacher_name',nameController.text);
       box.write('type','teacher');
     }

     catch (e) {
       print(e.toString());
       Get.snackbar("Error Login Account", e.toString(),
           colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
     }
   }



   void signInWithEmailAndPassword() async {
     final box = GetStorage();



     try {
       await _auth
           .signInWithEmailAndPassword(email: emailController.text,
           password: passwordController.text)
           .then((value22) async {
             print("valllllllllllllllllluuuu");
         var collection = FirebaseFirestore.instance.collection('users');

         print("ccc======="+collection.toString());
         var docSnapshot = await collection.doc(value22.user!.uid).get();
         print("uid======="+value22.user!.uid.toString());

             await FireStoreUser().getCurrentUser(value22.user!.uid).then((value)async{
               Map<String, dynamic>? data = docSnapshot.data();
               var valuex = data?['user_type'];

               print("vvv=========="+valuex.toString());

               if(emailController.text.length>4){

                 box.write('email',emailController.text);
               }

               if(valuex !=null){
                 box.write('type',valuex);
               }

               if(data?['student_id']!=null){
                 box.write('student_id',data?['student_id']??"");
               }
               if(data?['student_grade']!=null){
                 box.write('class',data?['student_grade']??'');
               }

               if(data?["teacher_email"]!=null){
                 box.write('teacher_email',data?['teacher_email']??"");
               }

               if(data?["sub"]!=null){
                 box.write('sub',data?['sub']??"");
               }

               if(data?["grade"]!=null){
                 box.write('grade',data?['grade']??"");
               }

               if(data?["teacher_name"]!=null){
                 box.write('teacher_name',data?['teacher_name']??"");
               }

               if(valuex =='student') {

                 Get.offAll(BottomBar(
                   student_id: data?['student_id'],
                   classx: data?['student_grade'],
                 ));
               }

               if(valuex == 'parent'){
                 print("std=="+data?['student_id']);


                 Get.offAll(ParentBottomBar(
                   student_id : data?['student_id']
                 ));
                 print("parent");
               }

               if(valuex == 'teacher'){
                 Get.offAll(TeacherBottomBar(
                   email: emailController.text,
                   sub:data?['sub'],
                   grade:data?['grade'],
                   name:data?['teacher_name']
                 ));

               }
             });

       });


     } catch (e) {
       print(e.toString());

       Get.snackbar("Error Login Account", e.toString(),
           colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
     }

   }


   void saveUserAsParent
       (UserCredential user,String userType,String student_id) async {

      ParentModel userModel = ParentModel

   (
         parent_email:emailController.text
         ,parent_name:nameController.text,
         student_id: student_id,
         userId: user.user!.uid
          ,userType:userType

     );

     await FireStoreUser().addParentToFireStore(userModel);
   }





   void saveUserAsStudent
       (UserCredential user,String studentId ,String grade) async {

     StudentModel userModel = StudentModel
       (student_name:nameController.text,
         student_email:emailController.text,
         student_grade: dropdownvalue3,
         student_id: studentId,
         userId: user.user!.uid,userType:'student'
     );

     await FireStoreUser().addStudentToFireStore(userModel);
     // setUser(userModel);
   }
   
   void saveUserAsTeacher
       (UserCredential user,String userType,String teacher_sub,String teacher_grade) async {

     TeacherModel userModel =

     TeacherModel

       (
         grade: teacher_grade,
         subject: teacher_sub,
         teacher_email:emailController.text,
         teacher_name: nameController.text,
         userId: user.user!.uid,
         userType:userType

     );

     await FireStoreUser().addTeacherToFireStore(userModel);
     // setUser(userModel);
   }

   void signInTesting() async {
     final box = GetStorage();

     try {
       await _auth
           .signInWithEmailAndPassword(email: 'test70@gmail.com',
           password: '1234567')
           .then((value22) async {
         print("valllllllllllllllllluuuu");
         var collection = FirebaseFirestore.instance.collection('users');

         print("ccc======="+collection.toString());
         var docSnapshot = await collection.doc(value22.user!.uid).get();
         print("uid======="+value22.user!.uid.toString());

         await FireStoreUser().getCurrentUser(value22.user!.uid).then((value)async{
           Map<String, dynamic>? data = docSnapshot.data();
           var valuex = data?['user_type'];

           print("vvv=========="+valuex.toString());

           if(emailController.text.length>4){

             box.write('email',emailController.text);
           }

           if(valuex !=null){
             box.write('type',valuex);
           }

           if(data?['student_id']!=null){
             box.write('student_id',data?['student_id']??"");
           }
           if(data?['student_grade']!=null){
             box.write('class',data?['student_grade']??'');
           }

           if(data?["teacher_email"]!=null){
             box.write('teacher_email',data?['teacher_email']??"");
           }

           if(data?["sub"]!=null){
             box.write('sub',data?['sub']??"");
           }

           if(data?["grade"]!=null){
             box.write('grade',data?['grade']??"");
           }

           if(data?["teacher_name"]!=null){
             box.write('teacher_name',data?['teacher_name']??"");
           }

           if(valuex =='student') {

             Get.offAll(BottomBar(
               student_id: data?['student_id'],
               classx: data?['student_grade'],
             ));
           }

           if(valuex == 'parent'){
             print("std=="+data?['student_id']);


             Get.offAll(ParentBottomBar(
                 student_id : data?['student_id']
             ));
             print("parent");
           }

           if(valuex == 'teacher'){
             Get.offAll(TeacherBottomBar(
                 email: emailController.text,
                 sub:data?['sub'],
                 grade:data?['grade'],
                 name:data?['teacher_name']
             ));

           }
         });

       });


     } catch (e) {
       print(e.toString());

       Get.snackbar("Error Login Account", e.toString(),
           colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
     }

   }

   void signInTesting2() async {
     final box = GetStorage();

     try {
       await _auth
           .signInWithEmailAndPassword(email: 'test80@gmail.com',
           password: '123456')
           .then((value22) async {
         print("valllllllllllllllllluuuu");
         var collection = FirebaseFirestore.instance.collection('users');

         print("ccc======="+collection.toString());
         var docSnapshot = await collection.doc(value22.user!.uid).get();
         print("uid======="+value22.user!.uid.toString());

         await FireStoreUser().getCurrentUser(value22.user!.uid).then((value)async{
           Map<String, dynamic>? data = docSnapshot.data();
           var valuex = data?['user_type'];

           print("vvv=========="+valuex.toString());

           if(emailController.text.length>4){

             box.write('email',emailController.text);
           }

           if(valuex !=null){
             box.write('type',valuex);
           }

           if(data?['student_id']!=null){
             box.write('student_id',data?['student_id']??"");
           }
           if(data?['student_grade']!=null){
             box.write('class',data?['student_grade']??'');
           }

           if(data?["teacher_email"]!=null){
             box.write('teacher_email',data?['teacher_email']??"");
           }

           if(data?["sub"]!=null){
             box.write('sub',data?['sub']??"");
           }

           if(data?["grade"]!=null){
             box.write('grade',data?['grade']??"");
           }

           if(data?["teacher_name"]!=null){
             box.write('teacher_name',data?['teacher_name']??"");
           }

           if(valuex =='student') {

             Get.offAll(BottomBar(
               student_id: data?['student_id'],
               classx: data?['student_grade'],
             ));
           }

           if(valuex == 'parent'){
             print("std=="+data?['student_id']);


             Get.offAll(ParentBottomBar(
                 student_id : data?['student_id']
             ));
             print("parent");
           }

           // if(valuex == 'teacher'){
           //   Get.offAll(TeacherBottomBar(
           //       email: 'test80@gmail.com',
           //       sub:data?['sub'],
           //       grade:data?['grade'],
           //       name:data?['teacher_name']
           //   ));
           //
           // }
         });

       });


     } catch (e) {
       print(e.toString());

       Get.snackbar("Error Login Account", e.toString(),
           colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
     }

   }

   void signInTesting3() async {
     final box = GetStorage();

     try {
       await _auth
           .signInWithEmailAndPassword(email: 'test90@gmail.com',
           password: '123456')
           .then((value22) async {
         print("valllllllllllllllllluuuu");
         var collection = FirebaseFirestore.instance.collection('users');

         print("ccc======="+collection.toString());
         var docSnapshot = await collection.doc(value22.user!.uid).get();
         print("uid======="+value22.user!.uid.toString());

         await FireStoreUser().getCurrentUser(value22.user!.uid).then((value)async{
           Map<String, dynamic>? data = docSnapshot.data();
           var valuex = data?['user_type'];

           print("vvv=========="+valuex.toString());

           if(emailController.text.length>4){

             box.write('email',emailController.text);
           }

           if(valuex !=null){
             box.write('type',valuex);
           }

           if(data?['student_id']!=null){
             box.write('student_id',data?['student_id']??"");
           }
           if(data?['student_grade']!=null){
             box.write('class',data?['student_grade']??'');
           }

           if(data?["teacher_email"]!=null){
             box.write('teacher_email',data?['teacher_email']??"");
           }

           if(data?["sub"]!=null){
             box.write('sub',data?['sub']??"");
           }

           if(data?["grade"]!=null){
             box.write('grade',data?['grade']??"");
           }

           if(data?["teacher_name"]!=null){
             box.write('teacher_name',data?['teacher_name']??"");
           }

           if(valuex =='student') {

             Get.offAll(BottomBar(
               student_id: data?['student_id'],
               classx: data?['student_grade'],
             ));
           }

           if(valuex == 'parent'){
             print("std=="+data?['student_id']);


             Get.offAll(ParentBottomBar(
                 student_id : data?['student_id']
             ));
             print("parent");
           }

           if(valuex == 'teacher'){
            // print("grade=="+data!['grade'].toString());
             Get.offAll(TeacherBottomBar(
                 email: 'test90@gmail.com',
                 sub:data?['sub'],
                 grade:data?['grade'],
                 name:data?['teacher_name']
             ));

           }
         });

       });


     } catch (e) {
       print(e.toString());

       Get.snackbar("Error Login Account", e.toString(),
           colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
     }

   }
}