

 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_project/data/models/grades_model.dart';
import 'package:school_project/data/services/home_services.dart';

  class HomeViewModel extends GetxController {


    ValueNotifier<bool> get loading => _loading;
    ValueNotifier<bool> _loading = ValueNotifier(false);
     List<GradesModel> get categoriesModel => _gradesModel;
     List<GradesModel> _gradesModel = [];


  HomeViewModel() {
    getGrades();
  }

  getGrades() async {
    _loading.value = true;
    HomeServes().getGrades().then((value) {
      for (int i = 0; i < value.length; i++) {
        _gradesModel.add(
            GradesModel.fromJson(value[i].data() as Map<String, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }


}