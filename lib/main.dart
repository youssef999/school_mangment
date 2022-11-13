import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_project/data/binding.dart';
import 'package:school_project/presentation/screens/home/splashscreen.dart';
import 'package:school_project/view_model/auth_view_model.dart';
import 'package:school_project/view_model/material_view_model.dart';
import 'package:school_project/view_model/users_category_viewmodel.dart';



  void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  //  await GetStorage.init();
    Get.put(() => AuthViewModel());
    Get.put(() => MaterialViewModel());
    Get.lazyPut(() => MaterialViewModel(), fenix: true);
    Get.put(() => UsersCategoryViewModel());
    await Firebase.initializeApp();


  runApp( MyApp());

}

class MyApp extends StatelessWidget {


  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    // final box = GetStorage();
    // String type=box.read('type')??"x";
    // String studentId=box.read('student_id')??"x";
    // String classx=box.read('class')??"x";
    // String teacher_email=box.read('teacher_email')??"x";
    // String sub=box.read('sub')??"x";
    // String grade=box.read('grade')??"x";
    // String teacher_name=box.read('teacher_name')??"x";
    Get.put(() => MaterialViewModel());

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: Binding(),
        home:SplashScreen());

    // if(type=='x'){
    //   return GetMaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       initialBinding: Binding(),
    //       home:LoginScreen());
    // }
    //
    //
    // if(type=='student'){
    //   return GetMaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       initialBinding: Binding(),
    //       home:BottomBar(
    //         classx: classx,
    //         student_id: studentId,
    //
    //       ));
    // }
    //
    // if(type=='parent'){
    //   print("id="+studentId);
    //   return GetMaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       initialBinding: Binding(),
    //       home:ParentBottomBar(
    //         student_id: studentId,
    //       ));
    // }
    // if(type=='teacher'){
    //   return GetMaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       initialBinding: Binding(),
    //       home: TeacherBottomBar(
    //         name: teacher_name,
    //         sub: sub,
    //         grade: grade,
    //         email: teacher_email,
    //       ));
    // }
    // else{
    //   return GetMaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       initialBinding: Binding(),
    //       home:LoginScreen());
    // }



      //UsersCategory()
      //SignUpScreen(),

  }
}


