
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_project/presentation/pdfs/pdf_api.dart';
import 'package:school_project/presentation/pdfs/pdfs_widget.dart';
import 'package:school_project/presentation/resources/assets_manager.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/screens/home/controller_layout.dart';
import 'package:school_project/presentation/widgets/Custom_button.dart';
import 'package:school_project/presentation/widgets/custom_text.dart';
import 'package:school_project/presentation/widgets/custom_textformfield.dart';

class SchoolCode extends StatefulWidget {




  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<SchoolCode> {
  TextEditingController nameController=TextEditingController();
  TextEditingController codeController=TextEditingController();
  var code=GetStorage();

  @override
  initState(){
    String codeVal=code.read('code')??'x';
    print("coddeeee:::$codeVal");
    if(codeVal=='code'){
      Get.to(ControllerLayout());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorManager.primary,
          toolbarHeight: 1,
        ),
        body:

        Container(
            color: Colors.white38,
            child: Column(children: [
              SizedBox(height: 30),
              Flexible(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('school').where('x',isEqualTo:'x')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData)
                          return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');
                          default:
                            return
                              ListView.builder(
                                  itemCount: 1,
                                  itemBuilder: (BuildContext context, int index) {
                                    DocumentSnapshot posts =
                                    snapshot.data!.docs[index];

                                    return
                                      Column(
                                        children: [
                                          SizedBox(height: 50,),
                                       Container(child:Image.asset('assets/images/sc6.png'),),
                                          SizedBox(height: 50,),
                                          CustomTextFormField(
                                            controller:codeController,
                                            color: ColorManager.black,
                                            obs:false,
                                            hint: 'ادخل الكود الخاص بالمدرسة ',
                                            obx: false,
                                          ),
                                          SizedBox(height: 40,),
                                          CustomButton(
                                            text:"تم",
                                            color2:ColorManager.black,
                                            color1:ColorManager.primary,
                                            onPressed:(){
                                              if(posts['code']==codeController.text){
                                                print("Done");
                                                Get.offAll(ControllerLayout());
                                                code.write('code', 'code');
                                              }
                                              else{
                                                print("WRONGGGG");
                                                Get.snackbar('خطا', "ادخلت كود خاطئ");
                                              }
                                            },
                                          )
                                        ],
                                      );
                                  });

                        }
                      }))
            ]))

    );
  }
}


