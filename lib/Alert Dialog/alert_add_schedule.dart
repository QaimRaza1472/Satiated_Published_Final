import 'package:flutter/material.dart';
import 'package:satiated_life/Animation/FadeAnimation.dart';
import 'package:satiated_life/Theme/color.dart';

///////////////////////////////////////////        ////////////////////////////////////////////

class AlertAddSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/4),
        child: Stack(
          children: [
           Positioned(
             top: 40,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   width: MediaQuery.of(context).size.width,
                 //width: 350,
                 height: 250,
                 padding: EdgeInsets.symmetric(vertical: 15),
                 decoration: BoxDecoration(
                   color: kwhite,
                   //color: Colors.green,
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.1),
                       spreadRadius: 1,
                       blurRadius: 5,
                       offset: Offset(
                         0,
                         0,
                       ),
                     ),
                   ],
                   borderRadius: BorderRadius.circular(10),
                 ),
            /* child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     SizedBox(height: 15),
                     Text(
                       "Oops",
                       style: TextStyle(
                         //color: kwhite,
                         color: Colors.yellow,
                         fontFamily: "Rene Bieder",
                         fontSize: 32,
                       ),
                     ),
                     Text(
                       "First Add your schedule",
                       style: TextStyle(
                         //color: kwhite,
                         color: Colors.yellow,
                         fontFamily: "Rene Bieder",
                         fontSize:25,
                       ),
                     ),

                   ],
                 ),*/
          ),
               ],
             ),
           ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/attention.png",
                    scale:10,
                    ),
                  ],
                ),
             SizedBox(height: 15),
             Padding(
               padding:  EdgeInsets.all(8.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text(
                     "Oops",
                     style: TextStyle(
                       //color: kwhite,
                       //color: Colors.yellow,
                       color: kblack,
                       fontFamily: "Rene Bieder",
                       fontSize: 32,
                         fontWeight: FontWeight.w600
                     ),
                   ),
                   SizedBox(height: 15,),
                   Text(
                     "First Add your schedule",
                     style: TextStyle(
                       color: kblack,
                       //color: kwhite,
                       //color: Colors.yellow,
                       fontFamily: "Rene Bieder",
                         fontSize:17,
                       fontWeight: FontWeight.w500
                     ),
                   ),

                   SizedBox(height: 30,),
                   Container(
                     height: 40,
                     width: 110,
                     decoration: BoxDecoration(
                       boxShadow: [
                         BoxShadow(
                           color: Colors.white.withOpacity(0.3),
                           spreadRadius: 2,
                           blurRadius: 5,
                           offset: Offset(0, 0),
                         ),
                       ],
                       color: kblue_1,
                       borderRadius: BorderRadius.circular(5),
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                           Text(
                             "Add Now",
                             style: TextStyle(
                               color: kwhite,
                               fontFamily: "Rene Bieder",
                               fontWeight: FontWeight.w700,
                               fontSize: 16,
                             ),
                           ),

                       ],
                     ),
                   ),


                 ],
               ),
             ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
