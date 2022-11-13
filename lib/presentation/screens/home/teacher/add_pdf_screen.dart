import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_project/view_model/material_view_model.dart';
import 'package:school_project/presentation/resources/assets_manager.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/widgets/Custom_Text.dart';
import 'package:school_project/presentation/widgets/Custom_button.dart';
import 'package:school_project/presentation/widgets/custom_textformfield.dart';


class  AddPdfScreen extends GetWidget<MaterialViewModel> {
  String email,sub,grade,name;
  AddPdfScreen
      ({required this.sub,
    required this.grade,required this.email,required this.name}) ;


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        toolbarHeight: 1,
      ),

      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: controller.formKey,
                child:  GetBuilder
                <MaterialViewModel>(
                  init: MaterialViewModel(),
                  builder: (value) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          child:Custom_Text(
                            text: 'PDF',
                            color:ColorManager.black,
                            fontSize:25,
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      if(controller.pickedFile !=null)
                        Expanded(child: Container(
                          color:ColorManager.primary,
                          child:Custom_Text(text: controller.pickedFile!.name),

                        )),
                      if(controller.pickedFile ==null)
                      Container(
                        width: 240,
                        height: 100,
                        child: Image.asset(
                          AssetsManager.pdf2,
                          fit: BoxFit.fill,
                        ),
                      ),

                      const SizedBox(
                        height: 34,
                      ),
                      Container(
                        height: 80,
                       // width:100,
                        child:
                        CustomTextFormField(
                          controller:controller.pdfNameController,
                          color: ColorManager.black,
                          obs:false,
                          hint: 'ادخل اسم الكتيب ',
                          obx: false,
                        ),

                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      CustomButton(
                        text: 'اختار ال pdf',
                        color2: ColorManager.white,
                        color1: ColorManager.primary,
                        onPressed:() {

                          controller.selectFile();
                          controller.uploadFile();

                          },
                      ),
                      // Container(
                      //   height: 80,
                      //   padding: const EdgeInsets.symmetric(horizontal: 10),
                      //   child:
                      //   CustomTextFormField(
                      //     controller:controller.videoLinkController,
                      //     color: ColorManager.black,
                      //     obs:false,
                      //     hint: 'ادخل رابط الفيديو ',
                      //     obx: false,
                      //   ),
                      // ),

                      CustomButton(
                        text: 'رفع الpdf ',
                        color1:ColorManager.primary,
                        color2: ColorManager.white,
                        onPressed:(){
                          //String ownerEmail, String sub,String grade,String teacherName
                          controller.formKey.currentState!.save();
                          if (controller.formKey.currentState!.validate()) {


                            controller.uploadVideo (email,sub,grade,name);


                          }
                        },
                      ),

                      const SizedBox(height:12,),

                      buildProgress(),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }

  Widget buildProgress ()=>
            StreamBuilder<TaskSnapshot>(
                stream:  controller.uploadTask?.snapshotEvents,
                builder:(context,snapshot){
          if(snapshot.hasData) {


            final data = snapshot!.data!;
            double progress = data.bytesTransferred / data.totalBytes;

            return SizedBox(
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
            );
          }

          return Container(
            height: 20,
          );

        });
      //);
}

