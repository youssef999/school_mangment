import 'package:cloud_firestore/cloud_firestore.dart';

//
// UserModel userModel = UserModel
//   (student_name:studentNameController.text,
//     student_email:emailController.text,
//     student_grade: gradeController.text,
//     student_id: studentId,
//     userId: user.user!.uid,userType:'student'
// );


class StudentModel{

  late String userId, userType, student_name,student_email, student_grade,student_id;




  StudentModel ({
      required this.userId,
    required this.userType,
    required this.student_email,
    required  this.student_name,
    required  this.student_grade,
    required  this.student_id,
  });

  StudentModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map["userId"]??"";
    student_email = map["student_email"]??"";
    student_name = map["student_name"]??"";
    student_grade=map['student_grade']??"";
    student_id = map["student_id"]??"";
    userType = map["user_type"] ?? '';


  }
  toJson() {
    return {
      "userId": userId??"",
      "student_email":student_email??"",
      'student_name':student_name??"",
      "student_grade":student_grade??"",
      "student_id": student_id??"",
      "user_type": userType??"",
    };
  }
  static const NUMBER = 'number';
  static const ID = 'id';



}
