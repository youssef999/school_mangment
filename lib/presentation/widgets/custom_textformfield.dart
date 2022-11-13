

import 'package:flutter/material.dart';
import 'package:school_project/presentation/resources/color_manager.dart';
//import 'package:intl/intl.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatefulWidget {

  final String hint;
  bool obs ;
  bool obx;
  bool? input;
  final Color color;
   TextEditingController controller;

  CustomTextFormField({Key? key,
    required this.hint,
    required this.obx,
    this.input,
    required this.obs,
    required this.color,
    required this.controller,
  }
      ) : super(key: key) ;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  @override
  Widget build(BuildContext context) {




          if(widget.obx==true) {
         return
           Container(
             decoration: BoxDecoration(
                 boxShadow: [
                   // BoxShadow(
                   //   color: Colors.grey.withOpacity(0.4),
                   //   spreadRadius: 5,
                   //   blurRadius: 7,
                   //   offset: Offset(0, 3), // changes position of shadow
                   // ),
                 ],
               borderRadius: BorderRadius.circular(15),
                 gradient: LinearGradient(
                   colors: [
                     ColorManager.primary,
                     ColorManager.primary,
                   ],
                   begin: FractionalOffset(0.0, 0.4),
                   end: Alignment.topRight,
                 )),
             child: Directionality(
               textDirection: TextDirection.rtl,
               child: TextFormField(
                  obscureText:widget.obs,
                  controller: widget.controller
                 ,style:TextStyle(
                 color:Colors.black,fontSize:18
               ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(

                    label:
                    Text(widget.hint,style:TextStyle
                      (color:Colors.black,fontSize:17,fontStyle:FontStyle.italic)) ,
                //    hintText:"   "+widget.hint,
                    hintStyle: TextStyle(color:Colors.white),
                    fillColor:Colors.white54,
                    suffixIcon: IconButton(
                      icon: Icon(
                        widget.obs ? Icons.visibility : Icons.visibility_off,
                        color:Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.obs= !widget.obs;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),

                    ),
                    filled: true,
                  ),

                ),
             ),
           );
          }

          if(widget.obx==false) {
          return  Container(
            width: 300,
            decoration: BoxDecoration(
                boxShadow: [
                  // BoxShadow(
                  //   color: Colors.grey.withOpacity(0.4),
                  //   spreadRadius: 5,
                  //   blurRadius: 7,
                  //   offset: Offset(0, 3), // changes position of shadow
                  // ),
                ],
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    ColorManager.primary,
                    ColorManager.primary,
                  ],

                  begin: FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                )
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                cursorColor: Colors.black,
                  minLines:1 ,
                  obscureText:widget.obs,
                  controller: widget.controller
                  ,style:TextStyle(
              color:Colors.black,fontSize:18
              ),

                  decoration: InputDecoration(

                    label:
                    Text(widget.hint,style:TextStyle
                      (color:Colors.black,fontSize:17,fontStyle:FontStyle.italic)) ,
                 //   hintText:"   "+widget.hint,
                    hintStyle: TextStyle(color:Colors.white),
                    fillColor:Colors.white54,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(1.5),

                    ),
                    filled: true,
                  ),

                ),
            ),
          );
          }

          if(widget.input ==true){
            return  Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      ColorManager.white,
                      ColorManager.grey,
                    ],
                    begin: FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight,
                  )),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  cursorColor: Colors.black,
                  obscureText:widget.obs,
                  keyboardType: TextInputType.number,
                  controller: widget.controller,style:TextStyle(
                    color:Colors.black,fontSize:18
                ),
                  decoration: InputDecoration(
                    hintText:widget.hint,
                    hintStyle: TextStyle(color:Colors.grey),
                    fillColor:Colors.white54,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5.5),

                    ),
                    filled: true,
                  ),
                ),
              ),
            );
          }

          return Container();

  }
}
