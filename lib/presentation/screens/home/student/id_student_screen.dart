
 import 'package:flutter/material.dart';
import 'package:school_project/presentation/resources/assets_manager.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/widgets/Custom_Text.dart';

 class IdStudentScreen extends StatelessWidget {

   String student_id;


   IdStudentScreen({required this.student_id});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        toolbarHeight: 1,
      ),
      body:Center(
        child: Column(
          children: [
            SizedBox(height:30,),
            Container(
              child:
              Image.asset(AssetsManager.id,
              fit:BoxFit.cover,
              ),

            ),
            SizedBox(height:30,),
            Center(
              child: Row(
                children: [
                  SizedBox(width:20,),
                  Custom_Text(text:student_id,
                    fontSize:22,
                    color:ColorManager.grey,
                  ),
                  SizedBox(width: 10,),
                  Custom_Text(text: 'الرمز الخاص بك ',
                     color:ColorManager.black,
                    fontSize: 19,

                  ),
                  SizedBox(width: 10,),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
