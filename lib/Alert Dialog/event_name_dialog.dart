import 'package:flutter/material.dart';
import 'package:satiated_life/Theme/color.dart';

///////////////////////////////////////////        ////////////////////////////////////////////

class EventName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          width: 390,
          height: 250,
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: kwhite,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              Text(
                "Event Name",
                style: TextStyle(
                  color: kwhite,
                  fontFamily: "Rene Bieder",
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





  // _filesDialog(BuildContext context) {
  //     showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return StatefulBuilder(builder: (thisLowerContext, innerSetState) {
  //             return Dialog(
  //               backgroundColor: Colors.white,
  //               insetPadding: EdgeInsets.zero,
  //               elevation: 1,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //               child: Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Container(
  //                   width: 390,
  //                   height: 260,
  //                   padding: EdgeInsets.symmetric(vertical: 15),
  //                   decoration: BoxDecoration(
  //                     //color: Color(0xFF0360a3),
  //                     color: kblue_1,
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: Colors.grey.withOpacity(0.1),
  //                         spreadRadius: 1,
  //                         blurRadius: 5,
  //                         offset: Offset(
  //                           0,
  //                           0,
  //                         ),
  //                       ),
  //                     ],
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       SizedBox(height: 30),
  //                       Text(
  //                         "It offers you to spin first",
  //                         style: TextStyle(
  //                           fontFamily: "Rene Bieder",
  //                           color: kwhite,
  //                           fontSize: 21,
  //                         ),
  //                       ),
  //                       Text(
  //                         " and then do meditation ",
  //                         style: TextStyle(
  //                           fontFamily: "Rene Bieder",
  //                           color: kwhite,
  //                           fontSize: 21,
  //                         ),
  //                       ),
  //                       Text(
  //                         "or just to meditate.",
  //                         style: TextStyle(
  //                           fontFamily: "Rene Bieder",
  //                           color: kwhite,
  //                           fontSize: 21,
  //                         ),
  //                       ),
  //                       SizedBox(height: 10),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Container(
  //                             width: 145,
  //                             height: 50,
  //                             decoration: BoxDecoration(
  //                               color: Color(0xFFFFFFFFF),
  //                               borderRadius: BorderRadius.circular(10),
  //                             ),
  //                             child: FlatButton(
  //                               onPressed: () {
  //                                 Get.to(MaleMeditation(widget.uid, "N"));
  //                               },
  //                               child: Text(
  //                                 'START MALE',
  //                                 textAlign: TextAlign.center,
  //                                 style: TextStyle(
  //                                   fontFamily: "Rene Bieder",
  //                                   color: kblue_1,
  //                                   fontSize: 19,
  //                                   fontWeight: FontWeight.w600,
  //                                   letterSpacing: 0.9,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           SizedBox(width: 20),
  //                           Container(
  //                             width: 145,
  //                             height: 50,
  //                             decoration: BoxDecoration(
  //                               color: Color(0xFFFFFFFFF),
  //                               borderRadius: BorderRadius.circular(10),
  //                             ),
  //                             child: FlatButton(
  //                               onPressed: () {
  //                                 Get.to(FemaleMeditation(widget.uid, "N"));
  //                               },
  //                               child: Text(
  //                                 'START FEMALE',
  //                                 textAlign: TextAlign.center,
  //                                 style: TextStyle(
  //                                   fontFamily: "Rene Bieder",
  //                                   color: kblue_1,
  //                                   fontSize: 19,
  //                                   fontWeight: FontWeight.w600,
  //                                   letterSpacing: 0.9,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           // SizedBox(width: 20),
  //                           // Container(
  //                           //   width: 145,
  //                           //   height: 50,
  //                           //   decoration: BoxDecoration(
  //                           //       color: Color(0xFFFFFFFFF),
  //                           //       borderRadius: BorderRadius.circular(10),
  //                           //       border: Border.all(
  //                           //         width: 1,
  //                           //         color: Color(0xFF0360a3),
  //                           //       )),
  //                           //   child: FlatButton(
  //                           //     onPressed: () async {
  //                           //       Get.to(AddYourIntention(widget.uid));
  //                           //     },
  //                           //     child: Text(
  //                           //       'SKIP',
  //                           //       textAlign: TextAlign.center,
  //                           //       style: TextStyle(
  //                           //         fontFamily: "Rene Bieder",
  //                           //         color: kblue_1,
  //                           //         fontSize: 19,
  //                           //         fontWeight: FontWeight.w600,
  //                           //         letterSpacing: 0.9,
  //                           //       ),
  //                           //     ),
  //                           //   ),
  //                           // ),
  //                         ],
  //                       ),
  //                       SizedBox(height: 10),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           SizedBox(width: 20),
  //                           Container(
  //                             width: 145,
  //                             height: 50,
  //                             decoration: BoxDecoration(
  //                                 color: Color(0xFFFFFFFFF),
  //                                 borderRadius: BorderRadius.circular(10),
  //                                 border: Border.all(
  //                                   width: 1,
  //                                   color: Color(0xFF0360a3),
  //                                 )),
  //                             child: FlatButton(
  //                               onPressed: () async {
  //                                 Get.to(AddYourIntention(widget.uid));
  //                               },
  //                               child: Text(
  //                                 'SKIP',
  //                                 textAlign: TextAlign.center,
  //                                 style: TextStyle(
  //                                   fontFamily: "Rene Bieder",
  //                                   color: kblue_1,
  //                                   fontSize: 19,
  //                                   fontWeight: FontWeight.w600,
  //                                   letterSpacing: 0.9,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           SizedBox(width: 20),
  //                           Container(
  //                             width: 145,
  //                             height: 50,
  //                             decoration: BoxDecoration(
  //                               color: Color(0xFFFFFFFFF),
  //                               borderRadius: BorderRadius.circular(10),
  //                             ),
  //                             child: FlatButton(
  //                               onPressed: () {
  //                                 Navigator.pop(context);
  //                               },
  //                               child: Text(
  //                                 'CLOSE',
  //                                 textAlign: TextAlign.center,
  //                                 style: TextStyle(
  //                                   fontFamily: "Rene Bieder",
  //                                   color: kblue_1,
  //                                   fontSize: 19,
  //                                   fontWeight: FontWeight.w600,
  //                                   letterSpacing: 0.9,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             );
  //           });
  //         });
  //   }
