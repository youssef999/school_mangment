import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_project/view_model/material_view_model.dart';
import 'package:school_project/presentation/resources/assets_manager.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/widgets/Custom_Text.dart';
import 'package:school_project/presentation/widgets/Custom_button.dart';
import 'package:school_project/presentation/widgets/custom_textformfield.dart';


class AddVideoScreen extends GetWidget<MaterialViewModel> {

  String email,sub,grade,name;
   AddVideoScreen
       ({Key? key,required this.sub,required this.grade,required this.email,required this.name}) : super(key: key);



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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child:Custom_Text(
                          text: 'Videos',
                          color:ColorManager.black,
                          fontSize:25,
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 280,
                      height: 120,
                      child: Image.asset(
                        AssetsManager.video3,
                        fit: BoxFit.fill,
                      ),
                    ),

                    const SizedBox(
                      height: 34,
                    ),
                    Container(
                      height: 80,
                      child:
                      CustomTextFormField(
                        controller:controller.videoNameController,
                        color: ColorManager.black,
                        obs:false,
                        hint: 'ادخل اسم الفيديو ',
                        obx: false,
                      ),

                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 80,
                      width: 700,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child:
                      CustomTextFormField(
                        controller:controller.videoLinkController,
                        color: ColorManager.black,
                        obs:false,
                        hint: 'ادخل رابط الفيديو ',
                        obx: false,
                      ),
                    ),
                    SizedBox(height: 20,),

                    CustomButton(
                      text: 'رفع الفيديو ',
                      color1:ColorManager.primary,
                      color2: ColorManager.black,
                      onPressed:(){
                        //String ownerEmail, String sub,String grade,String teacherName
                        controller.formKey.currentState!.save();
                        if (controller.formKey.currentState!.validate()) {

                          controller.uploadVideo(email,sub,grade,name);

                        }
                      },
                    ),

                    const SizedBox(height:12,),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}

