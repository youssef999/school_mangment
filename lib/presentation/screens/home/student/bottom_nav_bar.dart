
 import 'package:flutter/material.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/screens/home/student/student2.dart';
import 'package:school_project/presentation/screens/profile/profile_screen.dart';
import 'package:school_project/presentation/widgets/custom_text.dart';
import 'package:school_project/presentation/widgets/drawer.dart';

import 'studenthomescreen.dart';

class BottomBar extends StatefulWidget {

  String student_id,classx;
  BottomBar({required this.student_id, required this.classx});

  @override
  State<BottomBar> createState() => _BottomBarState();


}

class _BottomBarState extends State<BottomBar> {
  int myIndex = 0;


  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [

      StudentHomeSceen(
        student_id: widget.student_id,
        classx: widget.classx,
      ),

      ProfileScreen(),


    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorManager.black),
        elevation: 0,
        backgroundColor: ColorManager.primary,
        toolbarHeight: 60,
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
            BottomNavigationBarItem(icon: Icon(Icons.home,), label: "الرئيسية",),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "اعدادات"),
          ]),
    );
  }
}
