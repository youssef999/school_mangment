

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_project/presentation/screens/home/student/grades_screen.dart';
import 'package:school_project/presentation/resources/assets_manager.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/screens/auth/login.dart';
import 'package:school_project/presentation/screens/home/parent/contact.dart';
import 'package:school_project/presentation/screens/home/parent/money_screen.dart';
import 'package:school_project/presentation/widgets/Custom_Text.dart';
import 'package:school_project/presentation/widgets/Custom_button.dart';


class ParentSceen extends StatelessWidget {

  String student_id;
  ParentSceen({required this.student_id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        toolbarHeight: 1,
      ),

      body:  Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: GridView(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 2,
      mainAxisSpacing: 3,
        ),
        children: [
      InkWell(
        child:Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: 160,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    ColorManager.primary,
                    ColorManager.primary,
                  ],
                  begin: FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                )),


            child:Card(
              color:ColorManager.white,
              child:Column(
                children: [
                  Container(
                    height: 120,
                    width: 320,
                    child: Image.asset
                      (AssetsManager.services,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 4,),
                  Custom_Text(
                    text:' الاقساط ',
                    alignment:Alignment.center,
                    fontSize:24,
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap:() async {

          Get.to(MoneyScreen(
            student_id: student_id,
          ));
        },
      ),
      InkWell(
        child:Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: 160,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    ColorManager.primary,
                    ColorManager.primary,
                  ],
                  begin: FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                )),


            child:Card(
              color:ColorManager.white,
              child:Column(
                children: [

                  Container(
                    height: 120,
                    width:320,
                    child: Image.asset
                      (AssetsManager.grades,fit: BoxFit.fill),
                  ),
                  SizedBox(height: 4,),
                  Custom_Text(
                    text:' درجات الابناء ',
                    alignment:Alignment.center,
                    fontSize:24,
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap:(){
          Get.to(GradesScreen(
            student_id:student_id,
          ));
        },
      ),
      InkWell(
        child:Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: 160,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    ColorManager.primary,
                    ColorManager.primary,
                  ],
                  begin: FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                )),


            child:Card(
              color:ColorManager.white,
              child:Column(
                children: [
                  Container(
                    padding:EdgeInsets.only(top:7),
                    height:90,
                    width: 200,

                    child: Image.asset
                      (AssetsManager.chat,
                      fit:BoxFit.scaleDown,
                    ),
                  ),
                  SizedBox(height:4,),
                  Custom_Text(
                    text:' مراسلة الادارة ',
                    alignment:Alignment.center,
                    fontSize:24,
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap:(){

          Get.to(Contact());

        },
      )
        ],

      ),
    )


    );
  }
}
