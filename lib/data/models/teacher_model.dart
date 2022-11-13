import 'package:cloud_firestore/cloud_firestore.dart';

//
// UserModel userModel = UserModel
//   (student_name:studentNameController.text,
//     student_email:emailController.text,
//     student_grade: gradeController.text,
//     student_id: studentId,
//     userId: user.user!.uid,userType:'student'
// );


class TeacherModel{

  late String userId, userType, teacher_name,teacher_email, grade,subject;




 TeacherModel({
    required this.userId,
    required this.userType,
    required this.teacher_name,
    required  this.teacher_email,
    required  this.grade,
    required  this.subject,
  });

  TeacherModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map["userId"]??"";
    teacher_email = map["teacher_email"]??"";
    teacher_name = map["teacher_name"]??"";
    grade=map['grade']??"";
    subject=map['sub']??"";
    userType = map["user_type"] ?? '';


  }
  toJson() {
    return {
      "userId": userId??"",
      "teacher_email":teacher_email??"",
      'teacher_name':teacher_name??"",
      "grade":grade??"",
      "sub": subject??"",
      "user_type": userType??"",
    };
  }
  static const NUMBER = 'number';
  static const ID = 'id';



}
