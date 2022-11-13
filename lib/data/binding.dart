

 import 'package:get/get.dart';
import 'package:school_project/view_model/auth_view_model.dart';
import 'package:school_project/view_model/material_view_model.dart';
import 'package:school_project/view_model/users_category_viewmodel.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => UsersCategoryViewModel());
    Get.lazyPut(() => MaterialViewModel());
    // Get.lazyPut(() => HomeViewModel());
    // Get.lazyPut(() => LocalStorgeData());
  }
}