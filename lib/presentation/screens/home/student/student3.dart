//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:school_project/presentation/screens/home/student/grades_screen.dart';
// import 'package:school_project/presentation/resources/assets_manager.dart';
// import 'package:school_project/presentation/resources/color_manager.dart';
// import 'package:school_project/presentation/screens/home/student/id_student_screen.dart';
// import 'package:school_project/presentation/screens/home/teacher/timetable.dart';
// import 'package:school_project/presentation/pdfs/pdfscreen.dart';
// import 'package:school_project/presentation/screens/videos/videos_show_screen.dart';
// import 'package:school_project/presentation/widgets/Custom_Text.dart';
//
//
// class StudentHomeSceen3 extends StatelessWidget {
//   String  student_id,classx;
//
//
//   StudentHomeSceen3({required this.student_id,required this.classx});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: ColorManager.primary,
//         toolbarHeight: 1,
//       ),
//
//       body:
//
//       Padding(
//         padding: const EdgeInsets.only(top:18.0),
//         child: GridView(
//           gridDelegate:
//           SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 2,
//             mainAxisSpacing: 3,
//           ),
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: Container(
//                 height: 90,
//                 child: Image.asset(AssetsManager.std),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Container(
//                   height: 110,
//                   child:Padding(
//                     padding: const EdgeInsets.only(top:60.0),
//                     child: Custom_Text(
//                       text: 'School App',
//                       fontSize: 22,
//
//                     ),
//                   )
//               ),
//             ),
//             InkWell(
//               child:Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Container(
//                   height: 180,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.4),
//                           spreadRadius: 5,
//                           blurRadius: 7,
//                           offset: Offset(0, 3), // changes position of shadow
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(15),
//                       gradient: LinearGradient(
//                         colors: [
//                           ColorManager.primary,
//                           ColorManager.primary,
//                         ],
//                         begin: FractionalOffset(0.0, 0.4),
//                         end: Alignment.topRight,
//                       )),
//
//
//                   child:Card(
//                     color:ColorManager.white,
//                     child:Column(
//                       children: [
//                         Container(
//                           height: 120,
//                           width: 400,
//                           child: Image.asset
//                             (AssetsManager.id,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         SizedBox(height: 4,),
//                         Custom_Text(
//                           text:'?????????? ?????????? ???? ',
//                           alignment:Alignment.center,
//                           fontSize:24,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               onTap:(){
//                 Get.to(IdStudentScreen(
//                   student_id: student_id,
//
//                 ));
//               },
//             ),
//
//
//
//
//
//
//             InkWell(
//               child:Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Container(
//                   height: 180,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.4),
//                           spreadRadius: 5,
//                           blurRadius: 7,
//                           offset: Offset(0, 3), // changes position of shadow
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(15),
//                       gradient: LinearGradient(
//                         colors: [
//                           ColorManager.primary,
//                           ColorManager.primary,
//                         ],
//                         begin: FractionalOffset(0.0, 0.4),
//                         end: Alignment.topRight,
//                       )),
//
//
//                   child:Card(
//                     color:ColorManager.white,
//                     child:Column(
//                       children: [
//                         Container(
//                           height: 120,
//                           width: 400,
//                           child: Image.asset
//                             (AssetsManager.pdf,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         SizedBox(height: 4,),
//                         Custom_Text(
//                           text:'???????? pdf',
//                           alignment:Alignment.center,
//                           fontSize:24,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               onTap:(){
//                 print("class"+classx.toString());
//                 Get.to(
//                     PdfShowScreen(
//                       classs:classx,
//                     ));
//               },
//             ),
//             InkWell(
//               child:Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Container(
//                   height: 160,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.4),
//                           spreadRadius: 5,
//                           blurRadius: 7,
//                           offset: Offset(0, 3), // changes position of shadow
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(15),
//                       gradient: LinearGradient(
//                         colors: [
//                           ColorManager.primary,
//                           ColorManager.primary,
//                         ],
//                         begin: FractionalOffset(0.0, 0.4),
//                         end: Alignment.topRight,
//                       )),
//
//
//                   child:Card(
//                     color:ColorManager.white,
//                     child:Column(
//                       children: [
//
//                         Container(
//                           height: 120,
//                           width:400,
//                           child: Image.asset
//                             (AssetsManager.video,fit: BoxFit.fill),
//                         ),
//                         SizedBox(height: 4,),
//                         Custom_Text(
//                           text:'???????????????? ??????????????',
//                           alignment:Alignment.center,
//                           fontSize:22,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               onTap:(){
//                 Get.to(  VideosShowScreen(
//                   classs: classx,
//                 ));
//               },
//             ),
//             InkWell(
//               child:Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Container(
//                   height: 160,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.4),
//                           spreadRadius: 5,
//                           blurRadius: 7,
//                           offset: Offset(0, 3), // changes position of shadow
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(15),
//                       gradient: LinearGradient(
//                         colors: [
//                           ColorManager.primary,
//                           ColorManager.primary,
//                         ],
//                         begin: FractionalOffset(0.0, 0.4),
//                         end: Alignment.topRight,
//                       )),
//
//
//                   child:Card(
//                     color:ColorManager.white,
//                     child:Column(
//                       children: [
//                         Container(
//                           height:120,
//
//                           child: Image.asset
//                             (AssetsManager.grades),
//                         ),
//                         SizedBox(height:4,),
//                         Custom_Text(
//                           text:'??????????????',
//                           alignment:Alignment.center,
//                           fontSize:24,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               onTap:(){
//                 Get.to(GradesScreen(
//                     student_id:student_id
//                 ));
//               },
//             ),
//             InkWell(
//               child:Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Container(
//                   height: 160,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.4),
//                           spreadRadius: 5,
//                           blurRadius: 7,
//                           offset: Offset(0, 3), // changes position of shadow
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(15),
//                       gradient: LinearGradient(
//                         colors: [
//                           ColorManager.primary,
//                           ColorManager.primary,
//                         ],
//                         begin: FractionalOffset(0.0, 0.4),
//                         end: Alignment.topRight,
//                       )),
//
//                   child:Card(
//                     color:ColorManager.white,
//                     child:Column(
//                       children: [
//                         Container(
//                           height:120,
//                           width: 320,
//                           child: Image.asset
//                             (AssetsManager.timetable,fit:BoxFit.fill,),
//                         ),
//                         SizedBox(height:4,),
//                         Custom_Text(
//                           text:'???????? ??????????',
//                           alignment:Alignment.center,
//                           fontSize:24,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               onTap:(){
//
//                 Get.to (TimeTableScreen());
//
//               },
//             )
//           ],
//
//         ),
//       ),
//
//
//     );
//   }
// }
