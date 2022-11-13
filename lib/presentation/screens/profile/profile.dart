
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_project/presentation/screens/auth/login.dart';
import 'package:school_project/presentation/widgets/Custom_Text.dart';

import 'edit_profile.dart';


class ProfileHome extends StatelessWidget {
  const ProfileHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final box = GetStorage();
String name=box.read('name')??"";



    return
       Column(
        children: [
          SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Custom_Text(
                text: name,
                alignment: Alignment.center,
              )),
              SizedBox(
                height: 5,
              ),

            ],
          ),
          SizedBox(height: 20),
          ProfileMenu(
            icon: "assets/images/student.png",
            text: "بروفايل",
            press: () {
              Get.to(EditProfile());
            },
          ),

          // ProfileMenu(
          //   icon: "assets/icons/Notifications.svg",
          //   text: "Notifications",
          //   press: () {},
          // ),
          ProfileMenu(
            icon: "assets/images/share.png",
            text: "مشاركة التطبيق",
            press: () async {

                await FlutterShare.share(
                    title: 'App',
                    text: 'Download App',
                    linkUrl:
                    'https://play.google.com/store/apps/details?id=com.team.tourism2022',
                    chooserTitle: ' Travira App');

            },
          ),
          ProfileMenu(
            icon: "assets/images/logout.png",
            text: "تسجيل خروج",
            press: () {
              box.remove('email');
              box.remove('name');
              box.remove('type');
              print("removed");
              FirebaseAuth.instance.signOut();
              Get.offAll(LoginScreen());
            },
          ),
        ],
      );

  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
    Null Function()? onpress,
  }) : super(key: key);
  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.white,
          onPressed: press,
          child: Row(
            children: [
              Image.asset(icon, width: 50,),
              SizedBox(width: 20),
              Expanded(
                  child: Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              )),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              )
            ],
          )),
    );
  }
}

// Future<void> share() async {
//   await FlutterShare.share(
//       title: 'Travira',
//       text: 'Download Travira App',
//       linkUrl:
//           'https://play.google.com/store/apps/details?id=com.team.tourism2022',
//       chooserTitle: ' Travira App');
// }
