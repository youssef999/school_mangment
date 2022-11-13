

 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_project/view_model/material_view_model.dart';
import 'package:school_project/data/binding.dart';
import 'package:school_project/presentation/screens/auth/login.dart';
import 'package:school_project/presentation/screens/home/parent/parent_bottom_bar.dart';
import 'package:school_project/presentation/screens/home/student/bottom_nav_bar.dart';
import 'package:school_project/presentation/screens/home/teacher/teacher_bottombar.dart';

class ControllerLayout extends StatelessWidget {
  const ControllerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final box = GetStorage();
    String type=box.read('type')??"x";
    String studentId=box.read('student_id')??"x";
    String classx=box.read('class')??"x";
    String teacher_email=box.read('teacher_email')??"x";
    String sub=box.read('sub')??"x";
    String grade=box.read('grade')??"x";
    String teacher_name=box.read('teacher_name')??"x";
    Get.put(() => MaterialViewModel());


    if(type=='x'){
      return LoginScreen();
    }


    if(type=='student'){
      return BottomBar(
            classx: classx,
            student_id: studentId,

          );
    }

    if(type=='parent'){
      print("id="+studentId);
      return ParentBottomBar(
            student_id: studentId,
          );
    }
    if(type=='teacher'){
      return  TeacherBottomBar(
            name: teacher_name,
            sub: sub,
            grade: grade,
            email: teacher_email,
          );
    }
    else{
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: Binding(),
          home:LoginScreen());
    }
  }
}
