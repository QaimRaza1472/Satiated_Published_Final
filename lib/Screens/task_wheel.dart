import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:satiated_life/Animation/FadeAnimation.dart';
import 'package:satiated_life/Models/busyhours.dart';
import 'package:satiated_life/Models/dbHelper.dart';
import 'package:satiated_life/Screens/scheduled_intention.dart';
import 'package:satiated_life/Theme/color.dart';
import 'package:get/get.dart';
import '../Sync.dart';
import '../main.dart';
import 'add_your_intention.dart';
import 'dashboard.dart';
import 'dietary_and_health.dart';
import 'female_meditation.dart';
import 'male_meditation.dart';

class TaskWheel extends StatefulWidget {
  final String uid;
  TaskWheel(this.uid);
  @override
  _TaskWheelState createState() => _TaskWheelState();
}

class _TaskWheelState extends State<TaskWheel> {
  String url = "";
  String headinghalf = "";
  String discription = "";
  int isdialogue = 0;

  List imageurl = [
    'assets/wheelimages/1.jpg',
    'assets/wheelimages/2.jpg',
    'assets/wheelimages/3.jpg',
    'assets/wheelimages/4.jpg',
    'assets/wheelimages/5.jpg',
    'assets/wheelimages/6.jpg',
    'assets/wheelimages/7.jpg',
    'assets/wheelimages/8.jpg',
    'assets/wheelimages/9.jpg',
    'assets/wheelimages/10.jpg',
    'assets/wheelimages/11.jpg',
    'assets/wheelimages/12.jpg',
  ];
  var heading = [
    'Spirituality',
    'Artistic',
    'Therapy',
    'Inspiration',
    'Activity',
    'Tranquility',
    'Emotional',
    'Dietary and health',
    'Love and laughter',
    'Intellectual',
    'Fun',
    'Environmental',
  ];
  List defination = [
    'What is spirituality to you? It may be worship in a religious establishment, perhaps just being in nature. For some its yoga and meditation. Are you spiritually satiated? Take time in your day for spiritual connections.',
    'What artistic mediums interest you? Do you like to act, draw, dance, cook, sing, write poetry and or literature? Are you artistically satiated?',
    'What is your go to therapy? schedule a therapy that will help you on your satiated life journey. Beauty, massage, retail or psychotherapy?  Maybe you are due for a physical. Therapy is an important ingredient of self-care; Whether it be a night out with friends or professional therapy in a medical setting. Take time in your week for some form of therapy.',
    'Where do you look for inspiration? Do you get inspired from books, music or movies? Perhaps you like to journal or meditate. Do you have ways to inspire yourself or are you unsatiated and constantly looking for inspiration with no avail?',
    'Do you feel you are getting enough Physical activity? What are your favorite ways to exercise? Work towards making a list of physical activities that Satiate you, like dancing, walking or swimming.',
    'Are you struggling to find any time in your schedule to relax? What is tranquility to you? Perhaps its meditation, taking a nap or going for a walk. Taking time to just breathe is so basic that its often overlooked.',
    'How are you doing emotionally? Are you fully satiated? Call someone you haven’t spoken to in a while or just hang out with friends.  Delve deep within you to find ways you can help manage and deal with your emotional self.',
    'How do you feel physically? Are you meeting your nutritional needs? Do you want to cook at home more? Perhaps you want to prepare more of your meals at home or just be more adventurous with food. What are some goals you’d like to set for yourself to get closer to feeling fully satiated self?',
    'Laughter is often coined to be the best medicine. We all know how love makes us feel. What is love to you? Are love and laughter present in your life? How can you work toward feeling fully satiated in these realms? ',
    'Are you intellectually stimulated? What is intellectually satiating for you? Get a list of satiating intellectual activities to improve your life and well-being. Sign up for a class or learn a new language.  The possibilities are endless.',
    'We all know what all work and no play did to Jack. What is fun to you, and are you having it? Can you remember the last time you had fun? Maybe you’d like to check out a new restaurant, go bowling or take a vacation.',
    'How are you connected to the environment? This can be your immediate surroundings or globally. What can you do better? Are you living a sustainable life? Set goals and activities to help you become more environmentally satiated. Instead of wasting food you could start to compost or maybe there is an act of service you’ve been meaning to do. Get creative and think of ways you can make a difference.',
  ];

  int selected = 0;
  String val = "Spirituality";
  String getName() {
    Timer _timer;

    _timer = new Timer(const Duration(seconds: 3), () {
      setState(() {
        if (selected == 0) {
          url = imageurl[0];
          headinghalf = heading[0];
          discription = defination[0];
          val = headinghalf;
        }
        if (selected == 1) {
          url = imageurl[1];
          headinghalf = heading[1];
          discription = defination[1];
          val = headinghalf;
        }
        if (selected == 2) {
          url = imageurl[2];
          headinghalf = heading[2];
          discription = defination[2];
          val = headinghalf;
        }
        if (selected == 3) {
          url = imageurl[3];
          headinghalf = heading[3];
          discription = defination[3];
          val = headinghalf;
        }
        if (selected == 4) {
          url = imageurl[4];
          headinghalf = heading[4];
          discription = defination[4];
          val = headinghalf;
        }
        if (selected == 5) {
          url = imageurl[5];
          headinghalf = heading[5];
          discription = defination[5];
          val = headinghalf;
        }
        if (selected == 6) {
          url = imageurl[6];
          headinghalf = heading[6];
          discription = defination[6];
          val = headinghalf;
        }
        if (selected == 7) {
          url = imageurl[7];
          headinghalf = heading[7];
          discription = defination[7];
          val = headinghalf;
        }
        if (selected == 8) {
          url = imageurl[8];
          headinghalf = heading[8];
          discription = defination[8];
          val = headinghalf;
        }
        if (selected == 9) {
          url = imageurl[9];
          headinghalf = heading[9];
          discription = defination[9];
          val = headinghalf;
        }
        if (selected == 10) {
          url = imageurl[10];
          headinghalf = heading[10];
          discription = defination[10];
          val = headinghalf;
        }
        if (selected == 11) {
          url = imageurl[11];
          headinghalf = heading[11];
          discription = defination[11];
          val = headinghalf;
        }
      });
    });

    return val;
  }

  _filesDialog(BuildContext context, String wheelAplha, String abreviation,
      String discription) {
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (thisLowerContext, innerSetState) {
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
                    //height: height1 * 0.68,
                    height: width1 + 145,
                    padding: EdgeInsets.symmetric(vertical: 5),
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
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.cancel_outlined,
                                    size: 32,
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(height: 15),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width1 * 0.1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your Pointer Landed On:",
                                style: TextStyle(
                                  color: kblack,
                                  fontFamily: "Rene Bieder",
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "$wheelAplha",
                                    style: TextStyle(
                                      color: kblack,
                                      fontFamily: "Rene Bieder",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    " For ",
                                    style: TextStyle(
                                      color: kblack,
                                      fontFamily: "Rene Bieder",
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    "$abreviation",
                                    style: TextStyle(
                                      color: kblack,
                                      fontFamily: "Rene Bieder",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Definition:",
                                    style: TextStyle(
                                      color: kblack,
                                      fontFamily: "Rene Bieder",
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  /*  Text(
                                    "$discription",
                                    style: TextStyle(
                                      color: kblack,
                                      fontFamily: "Rene Bieder",
                                      fontSize: 15,
                                    ),
                                  ),*/
                                  Container(
                                    height: 120,
                                    width: width1,
                                    //color: Colors.yellow,
                                    child: ListView.builder(
                                        //physics: BouncingScrollPhysics(),
                                        itemCount: 1,
                                        itemBuilder: (context, index) {
                                          return Text(
                                            "$discription",
                                            style: TextStyle(
                                              color: kblack,
                                              fontFamily: "Rene Bieder",
                                              fontSize: 15,
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height1 * 0.023,
                              ),
                              Container(
                                height: 3,
                                width: width1 * 0.9,
                                color: kblack,
                              ),
                              SizedBox(
                                height: height1 * 0.023,
                              ),
                              Text(
                                "Before writing your Intentions, would you like to meditate ?",
                                style: TextStyle(
                                  color: kblack,
                                  fontFamily: "Rene Bieder",
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(MaleMeditation(
                                        widget.uid, "N", abreviation, "1"));
                                  },
                                  child: Image.asset(
                                    "assets/male/2.png",
                                    scale: 4.5,
                                  ),
                                ),
                                Text(
                                  "Male Voice",
                                  style: TextStyle(
                                    color: kblack,
                                    fontFamily: "Rene Bieder",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Meditation",
                                  style: TextStyle(
                                    color: kblack,
                                    fontFamily: "Rene Bieder",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(FemaleMeditation(
                                        widget.uid, "N", abreviation, "1"));
                                  },
                                  child: Image.asset(
                                    "assets/female/2.png",
                                    scale: 4.5,
                                  ),
                                ),
                                Text(
                                  "Female Voice",
                                  style: TextStyle(
                                    color: kblack,
                                    fontFamily: "Rene Bieder",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Meditation",
                                  style: TextStyle(
                                    color: kblack,
                                    fontFamily: "Rene Bieder",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height1 * 0.025,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                    AddYourIntention(widget.uid, abreviation));
                              },
                              child: Container(
                                height: 45,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: kblue_1,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'SKIP',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Rene Bieder",
                                      //color: kblue_1,
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.9,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ));
          });
        });
  }

///////////////////////////////////////// List Code ///////////////////////

  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 38,
          backgroundColor: kblue_1,
          elevation: 0,
        ),
        body: WillPopScope(
      onWillPop: () async {
        if (isdialogue == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard(widget.uid, "0")),
          );
        } else {
          isdialogue = 0;
          Navigator.pop(context);
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
              Column(
                children: [
                  ///////////////////////////////////////////////////////   By Qaim   ///////////////////////////////////////////////
                  //SizedBox(height: 12,),
                  /*   Padding(
                    padding:EdgeInsets.symmetric(horizontal:29),
                    child: Container(
                      height: 52,
                      padding: EdgeInsets.only(left: 5, right: 5, top: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          //color: kdark_purple,
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child:FadeAnimation(
                        1,Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              focusColor: Colors.white,
                              //isDense: true,
                              autofocus: false,
                              hint: Center(
                                child: Text(
                                  "Select",
                                  style: TextStyle(
                                    fontSize: 18,
                                    //color: kdark_purple,
                                    color: kblue_1,
                                  ),
                                ),
                              ),
                              icon: Icon(Icons.arrow_drop_down,
                                color: kblue_1,
                              ),
                              iconSize: 36,
                              //elevation: 5,
                              isExpanded: true,
                              style: TextStyle(
                                color: kblue_1,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              value: _friendsVal,
                              onChanged: (value) {
                                setState(() {
                                  _friendsVal = value;
                                  print("Selected $_friendsVal");
                                });
                              },
                              items: _score_list.map((value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Center(
                                    child: Text(value,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      ),
                    ),
                  ),*/
                  ///////////////////////////////////////////////////////   End      ///////////////////////////////////////////////

                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 29),
                    child: Container(
                      height: 52,
                      padding: EdgeInsets.only(left: 5, right: 5, top: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          //color: kdark_purple,
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: FadeAnimation(
                        1,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                focusColor: Colors.white,
                                //isDense: true,
                                autofocus: false,
                                hint: Center(
                                  child: Text(
                                    val,
                                    style: TextStyle(
                                      fontSize: 18,
                                      //color: kdark_purple,
                                      color: kblue_1,
                                    ),
                                  ),
                                ),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: kblue_1,
                                ),
                                iconSize: 36,
                                //elevation: 5,
                                isExpanded: true,
                                style: TextStyle(
                                  //color: kdark_purple,
                                  color: kblue_1,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                items: heading.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    //                    child:
                                    child: SizedBox(
                                      width: 285,
                                      // for example
                                      child: Center(
                                        child: Text(
                                          items,
                                          style: TextStyle(
                                            //color: kwhite,
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _filesDialog(context, newValue[0], newValue,
                                        defination[heading.indexOf(newValue)]);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //////////////////////////////////////////// by Talha    /////////////////////////////////
                  /*    DropdownButton(
                    value: val,
                    dropdownColor: kblue,
                    //dropdownColor: kwhite,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: kwhite,
                      fontFamily: "Rene Bieder",
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    items: heading.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        //                    child:
                        child: SizedBox(
                          width: 300, // for example
                          child: Text(
                            items,
                            style: TextStyle(
                              //color: kwhite,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        _filesDialog(context, newValue[0], newValue,
                            defination[heading.indexOf(newValue)]);
                      }
                      );
                    },
                  ),*/

                  // FadeAnimation(
                  //   1,
                  //   Text(
                  //     val,
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.w700,
                  //       fontSize: 30,
                  //       color: kwhite,
                  //       fontFamily: "Rene Bieder",
                  //     ),
                  //   ),
                  // ),
                  ///////////////////////////////////////////////   Info Container   ///////////////////////////
                  SizedBox(
                    height: width1 * 0.05,
                  ),

                  // GestureDetector(
                  //   onTap: () {
                  //     if (headinghalf != "") {
                  //       Get.to(DietaryAndHealth(
                  //           headinghalf, discription, url, widget.uid));
                  //     }
                  //   },
                  //   child: Container(
                  //     height: 45,
                  //     width: 110,
                  //     decoration: BoxDecoration(
                  //       border: Border.all(
                  //         color: kwhite,
                  //       ),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.white.withOpacity(0.3),
                  //           spreadRadius: 2,
                  //           blurRadius: 5,
                  //           offset: Offset(0, 0),
                  //         ),
                  //       ],
                  //       color: kblue_1,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         FadeAnimation(
                  //           2.4,
                  //           Text(
                  //             "Info",
                  //             style: TextStyle(
                  //               color: kwhite,
                  //               fontWeight: FontWeight.w700,
                  //               fontSize: 21,
                  //               letterSpacing: 1.0,
                  //               fontFamily: "Rene Bieder",
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  ///////////////////////////////////////////////////////////////////////        End       ////////////////////////////////////////////////

                  ///////////////////////////////////////////////////////////////////    Wheel  Code  Start   /////////////////////////////////////////////////////////
                  SizedBox(
                    height: width1 * 0.09,
                  ),
                  Container(
                    height: 300,
                    child: FortuneWheel(
                      animateFirst: false,
                      selected: selected,
                      physics: CircularPanPhysics(
                        duration: Duration(seconds: 3),
                        curve: Curves.decelerate,
                      ),
                      onFling: () {
                        // setState(() {
                        //   selected;
                        // });
                      },
                      styleStrategy: UniformStyleStrategy(
                        borderColor: Colors.black,
                        color: kpink,
                        borderWidth: 5,
                      ),
                      items: [
                        FortuneItem(
                          style: FortuneItemStyle(
                            //borderColor: Colors.green,
                            //color: Colors.green,
                            color: kgrey,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 57.0),
                            child: Transform.rotate(
                              angle: pi / 2,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _filesDialog(context, "S", heading[0],
                                        defination[0]);
                                  });
                                },
                                child: Text(
                                  "S",
                                  style: TextStyle(
                                    fontFamily: "Rene Bieder",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 29,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        FortuneItem(
                          style: FortuneItemStyle(color: kblue_1),
                          child: Padding(
                            padding: EdgeInsets.only(left: 57.0),
                            child: Transform.rotate(
                              angle: pi / 2,
                              child: Text(
                                "A",
                                style: TextStyle(
                                  fontFamily: "Rene Bieder",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 29,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        FortuneItem(
                            style: FortuneItemStyle(
                              color: kgrey,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 57.0),
                              child: Transform.rotate(
                                angle: pi / 2,
                                child: Text(
                                  "T",
                                  style: TextStyle(
                                    fontFamily: "Rene Bieder",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 29,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                        FortuneItem(
                            style: FortuneItemStyle(color: kblue_1),
                            child: Padding(
                              padding: EdgeInsets.only(left: 57.0),
                              child: Transform.rotate(
                                angle: pi / 2,
                                child: Text(
                                  "I",
                                  style: TextStyle(
                                    fontFamily: "Rene Bieder",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 29,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                        ///////////////////////////////////////////white portion
                        FortuneItem(
                            style: FortuneItemStyle(color: kgrey),
                            child: Padding(
                              padding: EdgeInsets.only(left: 57.0),
                              child: Transform.rotate(
                                angle: pi / 2,
                                child: Text(
                                  "A",
                                  style: TextStyle(
                                      fontFamily: "Rene Bieder",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 29,
                                      color: Colors.white),
                                ),
                              ),
                            )),
                        FortuneItem(
                            style: FortuneItemStyle(color: kblue_1),
                            child: Padding(
                              padding: EdgeInsets.only(left: 57.0),
                              child: Transform.rotate(
                                angle: pi / 2,
                                child: Text(
                                  "T",
                                  style: TextStyle(
                                    fontFamily: "Rene Bieder",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 29,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                        FortuneItem(
                            style: FortuneItemStyle(color: kgrey),
                            child: Padding(
                              padding: EdgeInsets.only(left: 57.0),
                              child: Transform.rotate(
                                angle: pi / 2,
                                child: Text(
                                  "E",
                                  style: TextStyle(
                                    fontFamily: "Rene Bieder",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 29,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                        FortuneItem(
                            style: FortuneItemStyle(color: kblue_1),
                            child: Padding(
                              padding: EdgeInsets.only(left: 57.0),
                              child: Transform.rotate(
                                angle: pi / 2,
                                child: Text(
                                  "D",
                                  style: TextStyle(
                                    fontFamily: "Rene Bieder",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 29,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                        FortuneItem(
                            style: FortuneItemStyle(color: kpink),
                            child: Padding(
                              padding: EdgeInsets.only(left: 57.0),
                              child: Transform.rotate(
                                angle: pi / 2,
                                child: Text(
                                  "L",
                                  style: TextStyle(
                                    fontFamily: "Rene Bieder",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 29,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                        FortuneItem(
                            style: FortuneItemStyle(color: kblue_1),
                            child: Padding(
                              padding: EdgeInsets.only(left: 57.0),
                              child: Transform.rotate(
                                angle: pi / 2,
                                child: Text(
                                  "I",
                                  style: TextStyle(
                                    fontFamily: "Rene Bieder",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 29,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                        FortuneItem(
                            style: FortuneItemStyle(color: kpink),
                            child: Padding(
                              padding: EdgeInsets.only(left: 57.0),
                              child: Transform.rotate(
                                angle: pi / 2,
                                child: Text(
                                  "F",
                                  style: TextStyle(
                                    fontFamily: "Rene Bieder",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 29,
                                    //color: Colors.black,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                        FortuneItem(
                            style: FortuneItemStyle(color: kblue_1),
                            child: Padding(
                              padding: EdgeInsets.only(left: 57.0),
                              child: Transform.rotate(
                                angle: pi / 2,
                                child: Text(
                                  "E",
                                  style: TextStyle(
                                    fontFamily: "Rene Bieder",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 29,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                      ],
                      onAnimationEnd: () {
                        setState(() {
                          print("Value : " + "$selected");
                          isdialogue = 1;
                          Timer(
                              Duration(milliseconds: 25),
                              _filesDialog(context, headinghalf[0], headinghalf,
                                  discription));
                        });
                      },
                    ),
                  ),

                  ///////////////////////////////////////////////////////////////////    Wheel  Code  End      /////////////////////////////////////////////////////////
                ],
              ),

              ////////////////////////////////////////////////////////////      Spin the Wheel / Previous Task / Add Task   Button    ////////////////////////////////////////////
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      // Syncronization sn = new Syncronization();
                      // //sn.postdatatointernet(widget.uid).then((String value) {});
                      // sn.synndata(widget.uid).then((String value) {});
                      setState(() {
                        selected = Random().nextInt(11);
                        getName();
                      });
                    },
                    child: Container(
                      height: 47,
                      width: 190,
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
                            2.4,
                            Text(
                              "Spin The Wheel",
                              style: TextStyle(
                                color: kblue_1,
                                fontWeight: FontWeight.w700,
                                fontSize: 21,
                                fontFamily: "Rene Bieder",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width1 * 0.1,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width1 * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // GestureDetector(
                        //   onTap: () {
                        //     Get.to(ScheduledIntention("tw", widget.uid));
                        //   },
                        //   child: Container(
                        //     height: 47,
                        //     width: 150,
                        //     decoration: BoxDecoration(
                        //       boxShadow: [
                        //         BoxShadow(
                        //           color: Colors.white.withOpacity(0.3),
                        //           spreadRadius: 1,
                        //           blurRadius: 5,
                        //           offset: Offset(0, 0),
                        //         ),
                        //       ],
                        //       border: Border.all(
                        //         width: 1.7,
                        //         color: kwhite,
                        //       ),
                        //       color: kblue_1,
                        //       borderRadius: BorderRadius.circular(7),
                        //     ),
                        //     child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         FadeAnimation(
                        //           2.4,
                        //           Center(
                        //             child: Text(
                        //               "Previous Task",
                        //               style: TextStyle(
                        //                 color: kwhite,
                        //                 fontWeight: FontWeight.w700,
                        //                 fontSize: 21,
                        //                 fontFamily: "Rene Bieder",
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            Get.to(ScheduledIntention("tw", widget.uid));
                          },
                          child: Container(
                            height: 47,
                            width: 170,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              border: Border.all(
                                width: 1.7,
                                color: kwhite,
                              ),
                              color: kblue_1,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FadeAnimation(
                                  2.4,
                                  Center(
                                    child: Text(
                                      "My Intentions",
                                      style: TextStyle(
                                        color: kwhite,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 21,
                                        fontFamily: "Rene Bieder",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
      ),
    ));
  }
}
