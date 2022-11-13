

 class GradesModel {
  late String email, month,  pdf;




  GradesModel({
    required this.email,
    required this.month,
    required this.pdf,

  });

  GradesModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    email = map["email"]??"";
    month = map["month"]??"";
    pdf = map["pdf"]??"";





  }
  toJson() {
    return {
      "email": email??"",
      "month":month??"",
      'pdf':pdf??"",
    };
  }
  static const NUMBER = 'number';
  static const ID = 'id';



}
