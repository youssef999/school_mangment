
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_project/presentation/screens/home/teacher/add%20pdf2.dart';
import 'package:school_project/view_model/material_view_model.dart';
import 'package:school_project/presentation/resources/assets_manager.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/screens/home/teacher/teacher_pdf_screen.dart';
import 'package:school_project/presentation/screens/home/teacher/teacher_videos_screen.dart';
import 'package:school_project/presentation/screens/home/teacher/timetable.dart';
import 'package:school_project/presentation/widgets/Custom_Text.dart';

import 'add_video_screen.dart';


class TeacherScreen extends StatelessWidget {

  String  email,sub,grade,name;


  TeacherScreen({required this.email,required this.grade,required this.sub,required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        toolbarHeight: 1,
      ),

      body:

        Padding(
          padding: const EdgeInsets.only(top:18.0),
          child: GridView(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 3,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 90,
                  child: Image.asset(AssetsManager.teacher),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    height: 110,
                    child:Padding(
                      padding: const EdgeInsets.only(top:60.0),
                      child: Custom_Text(
                        text: 'نظام المعلم',
                        fontSize: 22,

                      ),
                    )
                ),
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
                            width: 400,
                            child: Image.asset
                              (AssetsManager.video,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: 4,),
                          Custom_Text(
                            text:'الفيديوهات',
                            alignment:Alignment.center,
                            fontSize:24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                onTap:(){
                  Get.to(
                      TeacherVideosScreen(
                        email:email,
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
                            width:400,
                            child: Image.asset
                              (AssetsManager.video,fit: BoxFit.fill),
                          ),
                          SizedBox(height: 4,),
                          Custom_Text(
                            text:'اضافة فيديو ',
                            alignment:Alignment.center,
                            fontSize:24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                onTap:(){
                  Get.put(() => MaterialViewModel());
                  Get.to(AddVideoScreen(
                      email: email,
                      grade: grade,
                      sub: sub,
                      name:name,

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
                            width: 400,
                            child: Image.asset
                              (AssetsManager.pdf,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(height: 4,),
                          Custom_Text(
                            text:'منهج pdf',
                            alignment:Alignment.center,
                            fontSize:24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                onTap:(){
                  print("email=="+email.toString());
                  Get.to(
                      TeacherPdfScreen(
                        email:email,
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
                            width:400,
                            child: Image.asset
                              (AssetsManager.pdf2,fit: BoxFit.fill),
                          ),
                          SizedBox(height: 4,),
                          Custom_Text(
                            text:'اضافة pdf ',
                            alignment:Alignment.center,
                            fontSize:24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                onTap:(){
                  Get.to( AddPdf2(
                      email: email,
                      grade: grade,
                      sub: sub,
                      name:name

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
                            height:120,
                            width: 320,
                            child: Image.asset
                              (AssetsManager.timetable,fit:BoxFit.fill,),
                          ),
                          SizedBox(height:4,),
                          Custom_Text(
                            text:'جدول الحصص',
                            alignment:Alignment.center,
                            fontSize:24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                onTap:(){

                  Get.to (TimeTableScreen());

                },
              )
            ],

          ),
        ),
      );

  }
}
