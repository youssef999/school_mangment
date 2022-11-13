import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServes {
  final CollectionReference _categoryCollectionRef =
  FirebaseFirestore.instance.collection("Categories");

  final CollectionReference _gradesCollectionRef =
  FirebaseFirestore.instance.collection("grades");


  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getGrades() async {
    var value = await _gradesCollectionRef.get();

    return value.docs;
  }
}
