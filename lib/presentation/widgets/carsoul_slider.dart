
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:school_project/presentation/resources/color_manager.dart';

Widget listViewCarsoul() {
  return
    CarouselSlider(

      options: CarouselOptions(height: 130.0,
      autoPlay:true,

      ),
      items: ['assets/images/std.png','assets/images/school2.jpg','assets/images/school3.png','assets/images/school5.png','assets/images/school1.png'].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(

                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  boxShadow: [
                    // BoxShadow(
                    //   color: Colors.lightBlueAccent.withOpacity(0.1),
                    //   spreadRadius: 5,
                    //   blurRadius: 1,
                    //   offset: Offset(0, 3), // changes position of shadow
                    // ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      ColorManager.white,
                      ColorManager.primary,
                    ],
                    begin: FractionalOffset(0.0, 0.4),
                    end: Alignment.topRight,
                  )),
                child: Container(
                  child:Image.asset('$i'),
                ),

                // Text('text $i', style: TextStyle(fontSize: 16.0),)
            );
          },
        );
      }).toList(),
    );
}
