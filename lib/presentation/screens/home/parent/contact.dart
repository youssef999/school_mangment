

import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:school_project/presentation/resources/assets_manager.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/widgets/Custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: ColorManager.primary,
        elevation: 0,
      ),
      body:Center(
        child: Column(
          children: [
            SizedBox(
                height:70
            ),
            Container(
              width:MediaQuery.of(context).size.width,
              height:200,
              child: Image.asset(AssetsManager.chat,fit: BoxFit.scaleDown,),
            ),
            SizedBox(
                height:20
            ),

            SizedBox(
              height: 20,
            ),

            // Text("youssef13579r@gmail.com",
            //     style:TextStyle(
            //         fontSize:20,
            //         fontWeight:FontWeight.bold,
            //         color:Colors.black
            //     )),
            SizedBox(
                height:20
            ),
            CustomButton(
              text: "تواصل",
              color1:ColorManager.primary,
              color2:ColorManager.black,
              onPressed:(){
                _launchEmail();
              },
            ),


          ],
        ),
      ),
    );
  }
  Future _launchEmail() async {
    String email = "youssef13579r@gmail.com";
    final url = 'mailto:$email?subject=${Uri.encodeFull('My Subject')}'
        '&body=${Uri.encodeFull('استفسار ')}';

    if (await canLaunch(url)) {
      await launch(url);
    }
    else{
      await launch(url);
    }
  }
}
