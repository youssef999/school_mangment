import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_project/presentation/screens/home/teacher/teacher_bottombar.dart';
import 'package:school_project/presentation/screens/home/teacher/teacher_screen.dart';

  class MaterialViewModel extends GetxController{

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController videoNameController = TextEditingController();
  TextEditingController videoLinkController = TextEditingController();
  TextEditingController teacherNameController = TextEditingController();
  TextEditingController pdfNameController = TextEditingController();
  PlatformFile? pickedFile;
  UploadTask? uploadTask;



  void uploadVideo (String ownerEmail, String sub,String grade,String teacherName) async {

    try {
        await FirebaseFirestore.instance
            .collection('videos')
            .add({
          "name": videoNameController.text,
          "owner_email": ownerEmail,
          "teacher_name":teacherName,
           "sub":sub,
          'grade':grade,
          "video":videoLinkController.text,
           'image':
           'https://firebasestorage.googleapis.com/v0/b/schoolmangment-8ea0d.appspot.com/o/video2.png?alt=media&token=bcace649-edb9-4712-949b-a33a4eb2899a'

        }).then((value) {
          Get.snackbar("Done", " تم رفع الفيديو بنجاح  ".tr,
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
      Get.snackbar("حدث خطا اثناء رفع الفيديو ", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }


   Future selectFile() async{

     final result=await FilePicker.platform.pickFiles();
     if(result ==null)return;

     else{
       pickedFile=result.files.first;
       update();
     }

   }

   Future uploadFile()async
   {
    final path='files/${pickedFile!.name}';
  final file= File(pickedFile!.path!);

  final ref=FirebaseStorage.instance.ref().child(path);

  uploadTask = ref.putFile(file);
  update();
  final snapShot=await uploadTask!.whenComplete(() => {

  });

  final urlDownloaded=await snapShot.ref.getDownloadURL();
  print("Download Link:$urlDownloaded");
    // uploadTask = null;
    // update();
   }


}