
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_project/view_model/material_view_model.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/screens/home/teacher/teacher_screen.dart';
import 'package:school_project/presentation/screens/profile/profile_screen.dart';
import 'package:school_project/presentation/widgets/custom_text.dart';
import 'package:school_project/presentation/widgets/drawer.dart';


class TeacherBottomBar extends StatefulWidget {

  String email,sub,grade,name;
  TeacherBottomBar({required this.email,required this.name,required this.sub,required this.grade});

  @override
  State<TeacherBottomBar> createState() => _BottomBarState();


}

class _BottomBarState extends State<TeacherBottomBar> {
  int myIndex = 0;


  @override
  Widget build(BuildContext context) {

    List<Widget> widgetList = [

      TeacherScreen(
        email: widget.email,
        name: widget.name,
        grade: widget.grade,
        sub: widget.sub,
      ),

      ProfileScreen(),


    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        toolbarHeight: 60,
        iconTheme: IconThemeData(color: ColorManager.black),
        title: Custom_Text(text: "مدرستي المطورة",color:ColorManager.black,
            alignment:Alignment.center,fontSize:20),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          selectedItemColor: ColorManager.black,
          unselectedItemColor: Colors.black12,
          backgroundColor: Colors.cyanAccent,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {

            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "اعدادات"),
          ]),
    );
  }
}
