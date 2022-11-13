import 'package:cloud_firestore/cloud_firestore.dart';

//
// UserModel userModel = UserModel
//   (student_name:studentNameController.text,
//     student_email:emailController.text,
//     student_grade: gradeController.text,
//     student_id: studentId,
//     userId: user.user!.uid,userType:'student'
// );


class ParentModel{

  late String userId, userType, parent_name,parent_email,student_id;




  ParentModel({
    required this.userId,
    required this.userType,
    required this.parent_name,
    required  this.parent_email,
    required  this.student_id,

  });

  ParentModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map["userId"]??"";
    parent_email = map["parent_email"]??"";
    parent_name = map["parent_name"]??"";
    student_id=map['student_id']??"";
    userType = map["user_type"] ?? '';


  }
  toJson() {
    return {
      "userId": userId??"",
      "parent_email":parent_email??"",
      'parent_name':parent_name??"",
      "student_id":student_id??"",
      "user_type": userType??"",
    };
  }
  static const NUMBER = 'number';
  static const ID = 'id';



}
