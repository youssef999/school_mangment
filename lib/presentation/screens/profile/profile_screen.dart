
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
import 'package:school_project/presentation/screens/profile/profile.dart';
import 'package:school_project/presentation/screens/profile/profile_pic.dart';


class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        toolbarHeight: 1,
      ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                ProfileHome(),
              ],
            ),
          ),
    );
  }
}
