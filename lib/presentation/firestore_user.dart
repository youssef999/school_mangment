import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school_project/data/models/parent_model.dart';
import 'package:school_project/data/models/teacher_model.dart';
import 'package:school_project/data/models/user_model.dart';


class FireStoreUser {
  final CollectionReference _userCollectionRef =
  FirebaseFirestore.instance.collection("users");

  Future<void> addStudentToFireStore(StudentModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
  Future<void> addParentToFireStore(ParentModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
  Future<void> addTeacherToFireStore(TeacherModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot?> getCurrentUser(String uid) async {
    return await _userCollectionRef.doc(uid).get();
  }
}
