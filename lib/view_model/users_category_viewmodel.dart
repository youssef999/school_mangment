
import 'package:get/get.dart';

enum User { parent, student,teacher }


class UsersCategoryViewModel extends GetxController{

  User ? user_category = User.parent;


  changeUserCategory(value){
    print("value=="+value.toString());
    user_category=value;
    update();
  }



}