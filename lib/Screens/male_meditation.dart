import 'package:flutter/material.dart';
import 'package:satiated_life/Animation/FadeAnimation.dart';
import 'package:satiated_life/Screens/task_wheel.dart';
import 'package:satiated_life/Theme/color.dart';
import 'package:get/get.dart';
import 'count_down.dart';
import 'dashboard.dart';

class MaleMeditation extends StatefulWidget {
  final String uid;
  final String isDashboard;
  final String wheelhead;
  final String iswheel;

  MaleMeditation(this.uid, this.isDashboard, this.wheelhead, this.iswheel);

  @override
  _MaleMeditationState createState() => _MaleMeditationState();
}

class _MaleMeditationState extends State<MaleMeditation> {
  // List male_image = [
  //   'assets/female/1.png',
  //   'assets/female/2.png',
  //   'assets/female/3.png',
  //   'assets/female/4.png',
  //   'assets/female/5.png',
  //   'assets/female/6.png',
  //   'assets/female/7.png',
  //   'assets/female/8.png',
  //   //'assets/female/9.png',
  //   'assets/female/10.png',
  //   'assets/female/11.png',
  //   //'assets/female/12.png',
  // ];

  List male_image = [
    'assets/male/p1.png',
    'assets/male/2.png',
    'assets/male/3.png',
    //'assets/male/4.png',
    'assets/male/5.png',
    'assets/male/6.png',
    'assets/male/7.png',
    //'assets/male/8.png',
    'assets/male/9.png',
    'assets/male/10.png',
    'assets/male/11.png',
    'assets/male/12.png',
  ];
  List female_sound = [
    "https://interesting-bartik.66-165-248-146.plesk.page/malevoice/1%20Guided%20Visualisation%20EDITED%20VOL%20DWN.mp3",
    "https://interesting-bartik.66-165-248-146.plesk.page/malevoice/2%20Basic%20Meditation%20For%20A%20Newbie%20EDITED.03%20VOL%20DWN.mp3",

    "https://interesting-bartik.66-165-248-146.plesk.page/malevoice/3%20Basic%20Meditation%20with%20Less%20Guidance%20EDITED.03%20VOL%20DWN.mp3",
    "https://interesting-bartik.66-165-248-146.plesk.page/malevoice/4%20Meditation%20With%20Less%20Guidance%20EDITED%2010%20min.04%20VOL%20DWN.mp3",
    "https://interesting-bartik.66-165-248-146.plesk.page/malevoice/5%20Meditation%20With%20Less%20Guidance%20EDITED%2020%20min%20VOL%20DWN.mp3",
    "https://interesting-bartik.66-165-248-146.plesk.page/malevoice/6%20Healing%20Meditation%20EDITED.02%20VOL%20DWN.mp3",
    "https://interesting-bartik.66-165-248-146.plesk.page/malevoice/7%20Relaxing%20Meditation%20EDITED.02%20VOL%20DWN.mp3",
    "https://interesting-bartik.66-165-248-146.plesk.page/malevoice/8%20Loving%20Kindness%20Meditation%20EDITED.03%20VOL%20DWN.mp3",
    "https://interesting-bartik.66-165-248-146.plesk.page/malevoice/9%20Body%20Scan%20Meditation%20EDITED%20VOL%20DWN%20V2.mp3",
    "https://interesting-bartik.66-165-248-146.plesk.page/malevoice/10%20Emotion%20Labelling%20EDIT.02%20VOL%20DWN.mp3",

    //'assets/female/9.png',

    //'assets/female/12.png',
  ];
  List meditation_list = [
    "Visualization",
    "Basic Meditation",
    "Basic Meditation",
    "Less Guidance",
    "Less Guidance",
    "Healing Meditation",
    "Relaxing",
    "Loving Kindness",
    "Body Scan",
    "Emotion Labeling",
  ];

  List duration = [
    17,
    10,
    20,
    10,
    20,
    12,
    10,
    12,
    20,
    14,
  ];
  _filesDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (thisLowerContext, innerSetState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.zero,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4),
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
                            height: 200,
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
                            child: Padding(
                              padding: EdgeInsets.only(right: 7),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Icon(
                                  //   Icons.,
                                  // ),
                                ],
                              ),
                            ),
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
                              "assets/premium.png",
                              scale: 10,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Coming Soon",
                                style: TextStyle(
                                    //color: kwhite,
                                    //color: Colors.yellow,
                                    color: kblack,
                                    fontFamily: "Rene Bieder",
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "In 2022 For Your",
                                style: TextStyle(
                                    color: kblack,
                                    //color: kwhite,
                                    //color: Colors.yellow,
                                    fontFamily: "Rene Bieder",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Satiated Life Elevated Journey!",
                                style: TextStyle(
                                    color: kblack,
                                    //color: kwhite,
                                    //color: Colors.yellow,
                                    fontFamily: "Rene Bieder",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
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
                                        "OK",
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
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  // List female_sound = [
  //   "Relaxing meditation.mp3",
  //   "BodyScan Med.mp3",
  //   "guidedmed.mp3",
  //   "BMFN.mp3",
  //   "VISUAL.mp3",
  //   "BMNB20.mp3",
  //   "LOVING.mp3",
  //   "HEALING.mp3",

  //   //'assets/female/9.png',
  //   "BMLG10.mp3",
  //   "BMLG20.mp3",
  //   //'assets/female/12.png',
  // ];

  String imageloc = "";
  String soundloc = "";
  int minutes = 0;

  int meditation_selected;
  //String dur = "";

  // getduration(String url) async {
  //   var audioPlayer = AudioPlayer();
  //   await audioPlayer.play(url, isLocal: true);
  //   int duration = await audioPlayer.getDuration();
  //   return duration.toString();
  // }

  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;

    return Scaffold(
        body: WillPopScope(
      onWillPop: () async {
        if (widget.isDashboard == "Y") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard(widget.uid, "0")),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskWheel(widget.uid)),
          );
        }
        return true;
      },
      child: Container(
        height: height1,
        width: width1,
        color: kblue_1,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: width1 * 0.07, bottom: width1 * 0.0),
                child: Column(
                  children: [
                    FadeAnimation(
                      1,
                      Text(
                        "Select  Meditation",
                        style: TextStyle(
                          fontFamily: "Rene Bieder",
                          color: kwhite,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.1,
                      Text(
                        "With Male Voice",
                        style: TextStyle(
                          fontFamily: "Rene Bieder",
                          color: kwhite,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ///////////////////////////////////////////////    Female Yoga    List  ///////////////////////////////
                    Padding(
                      padding: EdgeInsets.only(top: width1 * 0.05),
                      child: Container(
                        height: height1 * 0.74,
                        width: width1 * 0.97,
                        //color: Colors.yellow,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: male_image.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 5.0),
                              child: Container(
                                width: width1,
                                //color: Colors.green,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 2.0, left: 8, right: 8, top: 4),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (index == 0) {
                                              _filesDialog(context);
                                            } else {
                                              meditation_selected = index;
                                              imageloc = male_image[index];
                                              soundloc = female_sound[index];
                                              minutes = int.parse(
                                                  duration[index].toString());
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: 85,
                                          width: 85,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            color: meditation_selected == index
                                                ? kpink
                                                : Colors.white,
                                            border: Border.all(
                                              color:
                                                  meditation_selected == index
                                                      ? kwhite
                                                      : kblue_1,
                                              width: 1.7,
                                            ),
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                              male_image[index],
                                              color:
                                                  meditation_selected == index
                                                      ? kwhite
                                                      : kblue_1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width1 * 0.04,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            FadeAnimation(
                                              1.3,
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Name: ",
                                                    style: TextStyle(
                                                      fontFamily: "Rene Bieder",
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: width1 * 0.43,
                                                    //color: Colors.yellow,
                                                    child: Text(
                                                      meditation_list[index],
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Rene Bieder",
                                                        color: Colors.white,
                                                        fontSize: 17,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: width1 * 0.02,
                                            ),
                                            Container(
                                              height: 2,
                                              width: width1 * 0.6,
                                              color: kwhite,
                                            ),
                                            SizedBox(
                                              height: width1 * 0.02,
                                            ),
                                            FadeAnimation(
                                              1.4,
                                              Row(
                                                children: [
                                                  Text(
                                                    "Duration: ",
                                                    style: TextStyle(
                                                      fontFamily: "Rene Bieder",
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Text(
                                                    duration[index].toString() +
                                                        'Min',
                                                    style: TextStyle(
                                                      fontFamily: "Rene Bieder",
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: width1 * 0.02,
                                            ),
                                            Container(
                                              height: 2,
                                              width: width1 * 0.6,
                                              color: kwhite,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    //////////////////////////////////////////////////////   Yoga List End    ////////////////////////////////////
                  ],
                ),
              ),

              /////////////////////////////////////////////////////////////////  Start Button            /////////////////////////////////////////////
              GestureDetector(
                onTap: () {
                  if (minutes != 0 && meditation_selected != null) {
                    Get.to(CountDown(soundloc, minutes, imageloc, widget.uid,
                        widget.iswheel, widget.wheelhead));
                  }
                },
                child: Container(
                  height: 47,
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
                    color: Color(0xFFFFFFFFF),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeAnimation(
                        1.6,
                        Text(
                          "Start",
                          style: TextStyle(
                            color: kblue_1,
                            fontFamily: "Rene Bieder",
                            fontWeight: FontWeight.w700,
                            fontSize: 21,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /////////////////////////////////////////////////////////////////  Start Button  End      /////////////////////////////////////////////
              )
            ],
          ),
        ),
      ),
    ));
  }

  // List female_image = [
  //   'assets/male/p1.png',
  //   'assets/male/2.png',
  //   'assets/male/3.png',
  //   //'assets/male/4.png',
  //   'assets/male/5.png',
  //   'assets/male/6.png',
  //   'assets/male/7.png',
  //   //'assets/male/8.png',
  //   'assets/male/9.png',
  //   'assets/male/10.png',
  //   'assets/male/11.png',
  //   'assets/male/12.png',
  // ];
  // List female_sound = [
  //   "1m.mp3",
  //   "3m.mp3",
  //   "2m.mp3",
  //   "8m.mp3",
  //   "6m.mp3",
  //   "5m.mp3",
  //   "4m.mp3",
  //   "9m.mp3",

  //   //'assets/female/9.png',
  //   "10m.mp3",
  //   "7m.mp3",
  //   //'assets/female/12.png',
  // ];

  // int min_selected;
  // String imageloc = "";
  // String soundloc = "";
  // int minutes = 0;

  // int meditation_selected;

  // List min = [
  //   "5",
  //   "10",
  //   "15",
  //   "20",
  //   "25",
  //   "30",
  //   "35",
  //   "40",
  //   "45",
  //   "50",
  //   "55",
  //   "60",
  // ];

  // @override
  // Widget build(BuildContext context) {
  //   var height1 = MediaQuery.of(context).size.height;
  //   var width1 = MediaQuery.of(context).size.width;

  //   return Scaffold(
  //       body: WillPopScope(
  //     onWillPop: () async {
  //       if (widget.isDashboard == "Y") {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => Dashboard(widget.uid, "0")),
  //         );
  //       } else {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => TaskWheel(widget.uid)),
  //         );
  //       }
  //       return true;
  //     },
  //     child: Container(
  //       height: height1,
  //       width: width1,
  //       color: kblue_1,
  //       child: Align(
  //         alignment: Alignment.center,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             Padding(
  //               padding: EdgeInsets.only(top: width1 * 0.14),
  //               child: Column(
  //                 children: [
  //                   FadeAnimation(
  //                     1,
  //                     Text(
  //                       "Select  Meditation",
  //                       style: TextStyle(
  //                         fontFamily: "Rene Bieder",
  //                         color: kwhite,
  //                         fontSize: 30,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                     ),
  //                   ),
  //                   //SizedBox(height: 2,),
  //                   FadeAnimation(
  //                     1.1,
  //                     Text(
  //                       "With Male Voice",
  //                       style: TextStyle(
  //                         fontFamily: "Rene Bieder",
  //                         color: kwhite,
  //                         fontSize: 30,
  //                         fontWeight: FontWeight.w600,
  //                       ),
  //                     ),
  //                   ),

  //                   ///////////////////////////////////////////////    Female Yoga    List  ///////////////////////////////
  //                   Padding(
  //                     padding: EdgeInsets.only(top: width1 * 0.09),
  //                     child: Container(
  //                       height: height1 * 0.55,
  //                       width: width1 * 0.9,
  //                       child: GridView.builder(
  //                         physics: BouncingScrollPhysics(),
  //                         padding: EdgeInsets.zero,
  //                         itemCount: female_image.length,
  //                         gridDelegate:
  //                             SliverGridDelegateWithFixedCrossAxisCount(
  //                                 crossAxisCount: 3,
  //                                 crossAxisSpacing: 0,
  //                                 mainAxisExtent: 110),
  //                         itemBuilder: (BuildContext context, int index) {
  //                           return Column(
  //                             children: [
  //                               FadeAnimation(
  //                                 1.2,
  //                                 GestureDetector(
  //                                   onTap: () {
  //                                     setState(() {
  //                                       meditation_selected = index;
  //                                       imageloc = female_image[index];
  //                                       soundloc = female_sound[index];
  //                                     });
  //                                   },
  //                                   child: Container(
  //                                     height: 90,
  //                                     width: 90,
  //                                     decoration: BoxDecoration(
  //                                       borderRadius: BorderRadius.circular(7),
  //                                       color: meditation_selected == index
  //                                           ? kpink
  //                                           : Colors.white,
  //                                       border: Border.all(
  //                                         color: meditation_selected == index
  //                                             ? kwhite
  //                                             : kblue_1,
  //                                         width: 1.7,
  //                                       ),
  //                                     ),
  //                                     child: Center(
  //                                       child: Image.asset(
  //                                         female_image[index],
  //                                         color: meditation_selected == index
  //                                             ? kwhite
  //                                             : kblue_1,
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                               //SizedBox(height: 10,),
  //                             ],
  //                           );
  //                         },
  //                       ),
  //                     ),
  //                   ),

  //                   //////////////////////////////////////////////////////   Yoga List End    ////////////////////////////////////
  //                 ],
  //               ),
  //             ),

  //             SizedBox(
  //               height: width1 * 0.01,
  //             ),
  //             ////////////////////////////////////////////////////////////     Select  type and min    ////////////////////////////////////////////
  //             FadeAnimation(
  //               1.3,
  //               Text(
  //                 "Select type of meditation and duration",
  //                 style: TextStyle(
  //                     fontFamily: "Rene Bieder", fontSize: 17, color: kwhite),
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.symmetric(horizontal: width1 * 0.02),
  //               child: Container(
  //                 height: 41,
  //                 width: width1,
  //                 child: ListView.builder(
  //                     physics: BouncingScrollPhysics(),
  //                     scrollDirection: Axis.horizontal,
  //                     itemCount: min.length,
  //                     itemBuilder: (conext, index) {
  //                       return Padding(
  //                         padding: EdgeInsets.fromLTRB(7, 5, 8, 5),
  //                         child: GestureDetector(
  //                           onTap: () {
  //                             setState(() {
  //                               min_selected = index;
  //                               minutes = int.parse(min[index]);
  //                             });
  //                           },
  //                           child: Container(
  //                             width: 77,
  //                             decoration: BoxDecoration(
  //                               borderRadius: BorderRadius.circular(6),
  //                               color: min_selected == index ? kwhite : kblue_1,
  //                               border: Border.all(
  //                                 color: kwhite,
  //                               ),
  //                             ),
  //                             child: FadeAnimation(
  //                               1.4,
  //                               Center(
  //                                 child: Text(
  //                                   min[index] + " Min",
  //                                   style: TextStyle(
  //                                     color: min_selected == index
  //                                         ? kblue_1
  //                                         : kwhite,
  //                                     fontSize: 18,
  //                                     fontWeight: FontWeight.w500,
  //                                     //fontStyle: FontStyle.italic,
  //                                     fontFamily: "Rene Bieder",
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       );
  //                     }),
  //               ),
  //             ),

  //             /////////////////////////////////////////////////////////////////  Start Button     /////////////////////////////////////////////
  //             GestureDetector(
  //               onTap: () {
  //                 if (minutes != 0 && meditation_selected != null) {
  //                   Get.to(CountDown(soundloc, minutes, imageloc, widget.uid,
  //                       widget.iswheel, widget.wheelhead));
  //                 }
  //               },
  //               child: Container(
  //                 height: 47,
  //                 width: 190,
  //                 decoration: BoxDecoration(
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.white.withOpacity(0.3),
  //                       spreadRadius: 2,
  //                       blurRadius: 5,
  //                       offset: Offset(0, 0),
  //                     ),
  //                   ],
  //                   color: Color(0xFFFFFFFFF),
  //                   borderRadius: BorderRadius.circular(7),
  //                 ),
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     FadeAnimation(
  //                       1.5,
  //                       Text(
  //                         "Start",
  //                         style: TextStyle(
  //                           color: kblue_1,
  //                           fontFamily: "Rene Bieder",
  //                           fontWeight: FontWeight.w600,
  //                           fontSize: 23,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             /////////////////////////////////////////////////////////////////  Start Button End    /////////////////////////////////////////////
  //           ],
  //         ),
  //       ),
  //     ),
  //   ));
  // }
}
