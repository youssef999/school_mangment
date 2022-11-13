


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/screens/home/parent/contact.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/profile/profile_screen.dart';



class MainDrawer extends StatefulWidget {
  const MainDrawer({Key ? key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {



  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[

                      Container(
                        height: 20,
                        color: ColorManager.primary,
                      ),
                      // ListTile(
                      //     leading:
                      //     Icon(Icons.account_balance_sharp,color:ColorManager.primary,size:40),
                      //     title: Text("عن المدرسة ",
                      //       style: const TextStyle(
                      //         color: Colors.black, fontSize: 17,),),
                      //     onTap: () {
                      //
                      //     }
                      // ),

                      SizedBox(height:20,),

                      ListTile(
                          leading:
                        Icon(Icons.rate_review,color:ColorManager.primary,size:40),
                          title: Text('قيم التطبيق ',
                            style: const TextStyle(
                              color: Colors.black, fontSize: 17,),),
                          onTap: () {
                            _launchApp();
                          }
                      ),

                      SizedBox(height:20,),

                      ListTile(
                          leading:
                          Icon(Icons.message,color:ColorManager.primary,size:40),
                          title: Text(' تواصل مع المدرسة ',
                            style: const TextStyle(
                              color: Colors.black, fontSize: 17,),),
                          onTap: () {
                           Get.to(Contact());
                          }
                      ),



                    ]))));
  }
  Future _launchApp() async {
    final url = 'https://play.google.com/store/apps/details?id=com.prmgaclub.services';
        // 'mailto:$email?subject=${Uri.encodeFull('My Subject')}'
        // '&body=${Uri.encodeFull('استفسار ')}';

    if (await canLaunch(url)) {
      await launch(url);
    }
    else{
      await launch(url);
    }
  }


}






