// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:satiated_life/Animation/FadeAnimation.dart';
// import 'package:satiated_life/Theme/color.dart';
// import 'package:get/get.dart';
// import 'count_down.dart';
// import 'package:audioplayers/audio_cache.dart';
// import 'package:audioplayers/audioplayers.dart';

// class SelectMediation extends StatefulWidget {
//   SelectMediation({Key key}) : super(key: key);

//   @override
//   _SelectMediationState createState() => _SelectMediationState();
// }

// class _SelectMediationState extends State<SelectMediation> {
//   // List male_image = [
//   //   'assets/male/p1.png',
//   //   'assets/male/2.png',
//   //   'assets/male/3.png',
//   //   'assets/male/4.png',
//   //   'assets/male/5.png',
//   //   'assets/male/6.png',
//   //   'assets/male/7.png',
//   //   'assets/male/8.png',
//   //   'assets/male/9.png',
//   //   'assets/male/10.png',
//   //   'assets/male/11.png',
//   //   'assets/male/12.png',
//   // ];

//   List male_image = [
//     'assets/female/1.png',
//     'assets/female/2.png',
//     'assets/female/3.png',
//     'assets/female/4.png',
//     'assets/female/5.png',
//     'assets/female/6.png',
//     'assets/female/7.png',
//     'assets/female/8.png',
//     //'assets/female/9.png',
//     'assets/female/10.png',
//     'assets/female/11.png',
//     //'assets/female/12.png',
//   ];
//   List meditation_list = [
//     "Relaxing",
//     "Body Scan",
//     "Emotion Labeling",
//     "Less Guidance",
//     "Visualization",
//     "Less Guidance",
//     "Loving Kindness",
//     "Healing Meditation",
//     "Basic Meditation",
//     "Basic Meditation",
//   ];
//   List female_sound = [
//     "Relaxing meditation.mp3",
//     "BodyScan Med.mp3",
//     "guidedmed.mp3",
//     "BMFN.mp3",
//     "VISUAL.mp3",
//     "BMNB20.mp3",
//     "LOVING.mp3",
//     "HEALING.mp3",

//     //'assets/female/9.png',
//     "BMLG10.mp3",
//     "BMLG20.mp3",
//     //'assets/female/12.png',
//   ];

//   String imageloc = "";
//   String soundloc = "";
//   int minutes = 0;

//   int meditation_selected;
//   //String dur = "";

//   getduration(String url) async {
//     var audioPlayer = AudioPlayer();
//     await audioPlayer.play(url, isLocal: true);
//     int duration = await audioPlayer.getDuration();
//     return duration.toString();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var height1 = MediaQuery.of(context).size.height;
//     var width1 = MediaQuery.of(context).size.width;

//     return Scaffold(
//         body: WillPopScope(
//       onWillPop: () async {
//         if (widget.isDashbaord == "Y") {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Dashboard(widget.uid, "0")),
//           );
//         } else {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => TaskWheel(widget.uid)),
//           );
//         }
//         return true;
//       },
//       child: Container(
//         height: height1,
//         width: width1,
//         color: kblue_1,
//         child: Align(
//           alignment: Alignment.center,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Padding(
//                 padding:
//                     EdgeInsets.only(top: width1 * 0.07, bottom: width1 * 0.0),
//                 child: Column(
//                   children: [
//                     FadeAnimation(
//                       1,
//                       Text(
//                         "Select  Meditation",
//                         style: TextStyle(
//                           fontFamily: "Rene Bieder",
//                           color: kwhite,
//                           fontSize: 25,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     FadeAnimation(
//                       1.1,
//                       Text(
//                         "With Female Voice",
//                         style: TextStyle(
//                           fontFamily: "Rene Bieder",
//                           color: kwhite,
//                           fontSize: 25,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     ///////////////////////////////////////////////    Female Yoga    List  ///////////////////////////////
//                     Padding(
//                       padding: EdgeInsets.only(top: width1 * 0.05),
//                       child: Container(
//                         height: height1 * 0.74,
//                         width: width1 * 0.97,
//                         //color: Colors.yellow,
//                         child: ListView.builder(
//                           physics: BouncingScrollPhysics(),
//                           padding: EdgeInsets.zero,
//                           itemCount: male_image.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return Padding(
//                               padding: EdgeInsets.only(bottom: 5.0),
//                               child: Container(
//                                 width: width1,
//                                 //color: Colors.green,
//                                 child: Padding(
//                                   padding: EdgeInsets.only(
//                                       bottom: 2.0, left: 8, right: 8, top: 4),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       GestureDetector(
//                                         onTap: () {
//                                           setState(() {
//                                             meditation_selected = index;
//                                           });
//                                         },
//                                         child: Container(
//                                           height: 85,
//                                           width: 85,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(9),
//                                             color: meditation_selected == index
//                                                 ? kpink
//                                                 : Colors.white,
//                                             border: Border.all(
//                                               color:
//                                                   meditation_selected == index
//                                                       ? kwhite
//                                                       : kblue_1,
//                                               width: 1.7,
//                                             ),
//                                           ),
//                                           child: Center(
//                                             child: Image.asset(
//                                               male_image[index],
//                                               color:
//                                                   meditation_selected == index
//                                                       ? kwhite
//                                                       : kblue_1,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: width1 * 0.04,
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(top: 5),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceAround,
//                                           children: [
//                                             FadeAnimation(
//                                               1.3,
//                                               Row(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     "Name: ",
//                                                     style: TextStyle(
//                                                       fontFamily: "Rene Bieder",
//                                                       color: Colors.white,
//                                                       fontSize: 18,
//                                                     ),
//                                                   ),
//                                                   Container(
//                                                     width: width1 * 0.43,
//                                                     //color: Colors.yellow,
//                                                     child: Text(
//                                                       meditation_list[index],
//                                                       style: TextStyle(
//                                                         fontFamily:
//                                                             "Rene Bieder",
//                                                         color: Colors.white,
//                                                         fontSize: 17,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: width1 * 0.02,
//                                             ),
//                                             Container(
//                                               height: 2,
//                                               width: width1 * 0.6,
//                                               color: kwhite,
//                                             ),
//                                             SizedBox(
//                                               height: width1 * 0.02,
//                                             ),
//                                             FadeAnimation(
//                                               1.4,
//                                               Row(
//                                                 children: [
//                                                   Text(
//                                                     "Duration: ",
//                                                     style: TextStyle(
//                                                       fontFamily: "Rene Bieder",
//                                                       color: Colors.white,
//                                                       fontSize: 18,
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     getduration(
//                                                         female_sound[index]),
//                                                     style: TextStyle(
//                                                       fontFamily: "Rene Bieder",
//                                                       color: Colors.white,
//                                                       fontSize: 17,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: width1 * 0.02,
//                                             ),
//                                             Container(
//                                               height: 2,
//                                               width: width1 * 0.6,
//                                               color: kwhite,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),

//                     //////////////////////////////////////////////////////   Yoga List End    ////////////////////////////////////
//                   ],
//                 ),
//               ),

//               /////////////////////////////////////////////////////////////////  Start Button            /////////////////////////////////////////////
//               GestureDetector(
//                 onTap: () {
//                   if (minutes != 0 && meditation_selected != null) {
//                     Get.to(CountDown(soundloc, minutes, imageloc, widget.uid,
//                         widget.iswheel, widget.wheelhead));
//                   }
//                 },
//                 child: Container(
//                   height: 47,
//                   width: 190,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.white.withOpacity(0.3),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: Offset(0, 0),
//                       ),
//                     ],
//                     color: Color(0xFFFFFFFFF),
//                     borderRadius: BorderRadius.circular(7),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       FadeAnimation(
//                         1.6,
//                         Text(
//                           "Start",
//                           style: TextStyle(
//                             color: kblue_1,
//                             fontFamily: "Rene Bieder",
//                             fontWeight: FontWeight.w700,
//                             fontSize: 21,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 /////////////////////////////////////////////////////////////////  Start Button  End      /////////////////////////////////////////////
//               )
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
