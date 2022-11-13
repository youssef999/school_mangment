
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_project/presentation/resources/assets_manager.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/screens/home/teacher/teacher_bottombar.dart';
import 'package:school_project/presentation/widgets/custom_textformfield.dart';

import 'teacher_screen.dart';
import '../../../widgets/Custom_Text.dart';
import '../../../widgets/Custom_button.dart';

class AddPdf2 extends StatefulWidget {


  String email,sub,grade,name;

  AddPdf2 ({required this.sub, required this.grade,required this.email,required this.name}) ;

  @override
  State<AddPdf2> createState() => _AddPdf2State();
}

class _AddPdf2State extends State<AddPdf2> {

  PlatformFile? pickedFile;
  UploadTask? uploadTask;
   String ? res;
   TextEditingController pdfNameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        toolbarHeight: 1,
      ),
      body:Center(
        child: Container(
           child: Column(
             children: [
               SizedBox(height: 30,),
               Container(
                 width: 240,
                 height: 100,
                 child: Image.asset(
                   AssetsManager.pdf2,
                   fit: BoxFit.scaleDown,
                 ),
               ),
               SizedBox(height: 30,),
               CustomTextFormField(
                 controller:pdfNameController,
                 color: ColorManager.black,
                 obs:false,
                 hint: '    ادخل اسم الكتيب   ',
                 obx: false,
               ),
               SizedBox(height: 30,),

               SizedBox(height: 20,),
               CustomButton(
                 text: 'اختار الملف',
                 color1: ColorManager.primary,
                 color2: ColorManager.black,
                 onPressed:(){
                   selectFile();
                 },
               ),
               if(res=='res')
               Row(
                 children: [
                   SizedBox(width: 60,),
                   Center(
                     child: Custom_Text(text: 'تم الاختيار اضغط علي رفع الملف',
                       color:Colors.green,
                       fontSize:13,
                     ),
                   ),
                 ],
               ),

               SizedBox(height: 20,),

               CustomButton(
                 text: 'رفع الملف',
                 color1: ColorManager.primary,
                 color2: ColorManager.black,
                 onPressed:(){
                   uploadFile();
                 },
               ),
               SizedBox(height: 50,),
               buildProgress ()


             ],
           ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null)
      return;

    else {
      setState(() {
        pickedFile = result.files.first;
        res='res';
      });

      print("reeee");
    }
  }

    Future uploadFile()async{

      final path='files/${pickedFile!.name}';
      final file= File(pickedFile!.path!);

      final ref=FirebaseStorage.instance.ref().child(path);

      setState(() {
        uploadTask = ref.putFile(file);
        res='res2222';
      });

      final snapShot=await uploadTask!.whenComplete(() => {

         print("done")
      });

      final urlDownloaded=await snapShot.ref.getDownloadURL();
      print("Download Link:$urlDownloaded");
      setState(() {
        uploadTask = null;
      });

      uploadPdf
        (widget.email, widget.sub, widget.grade, widget.name,urlDownloaded.toString());

    }



  void uploadPdf (String ownerEmail, String sub,String grade,String teacherName,String pdfLink) async {

    try {
      await FirebaseFirestore.instance
          .collection('pdfs')
          .add({
        "name": pdfNameController.text,
        "owner_email": ownerEmail,
        "teacher_name":teacherName,
        "sub":sub,
        'grade':grade,
        "pdf":pdfLink,
        'image': 'https://firebasestorage.googleapis.com/v0/b/schoolmangment-8ea0d.appspot.com/o/pdf1.png?alt=media&token=91be48e3-360d-49d4-8a6a-0294c63b05a0'

      }).then((value) {
        Get.snackbar("Done", " تم رفع الملف بنجاح  ",
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.black,
            duration: const Duration(seconds: 3),
            borderRadius: 10,
            margin: const EdgeInsets.all(10),
            borderColor: Colors.black,
            borderWidth: 2,
            icon: const Icon(Icons.add_task, color: Colors.white));
        Get.offAll(TeacherBottomBar(email: ownerEmail, grade: grade, sub: sub, name: teacherName));

      });
    }

    catch (e) {
      print(e.toString());
      Get.snackbar("حدث خطا اثناء رفع الملف ", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

   Widget buildProgress ()=>
      StreamBuilder<TaskSnapshot>(
          stream:  uploadTask?.snapshotEvents,
          builder:(context,snapshot){
            if(snapshot.hasData) {

              final data = snapshot!.data!;
              double progress = data.bytesTransferred / data.totalBytes;

              if(uploadTask!=null){
                return Center(
                  child: SizedBox(
                    height: 50,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [

                        LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.grey,
                          color: Colors.green,
                        ),



                        Center(
                          child: Custom_Text(
                            color: ColorManager.white,
                            text: '${(100 * progress).roundToDouble()}%',
                          ),
                        )


                      ],
                    ),
                  ),
                );
              }
              else{
                return SizedBox(
                  height: 10,
                );
              }

            }

            return Container(
              height: 20,
            );

          });
}
