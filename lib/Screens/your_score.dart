import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:satiated_life/Animation/FadeAnimation.dart';
import 'package:satiated_life/Models/dbHelper.dart';
import 'package:satiated_life/Screens/previous_intention.dart';
import 'package:satiated_life/Screens/weekly_feeling.dart';
import 'package:satiated_life/Theme/color.dart';
import 'package:get/get.dart';

import 'dashboard.dart';

class YourScore extends StatefulWidget {
  final String uid;
  YourScore(this.uid);

  @override
  _YourScoreState createState() => _YourScoreState();
}

class _YourScoreState extends State<YourScore> {
  int complete = 0;
  int incomplete = 0;
  int total = 0;
  double percentage = 0;

  List intention_data;
  Future<void> geti() async {
    DbHelper daysdb = new DbHelper();
    intention_data = await daysdb.getPreviousIntensions();
    setState(() {});
  }

  void reset() {
    complete = 0;
    incomplete = 0;
    total = 0;
    percentage = 0;
  }

  List data;
  List data2;

  Future<void> get() async {
    DbHelper daysdb = new DbHelper();
    data = await daysdb.getPreviousIntensionsforsqlserver();
    data2 = await daysdb.getmeditation();

    setState(() {
      //if (data.isNotEmpty && data2.isNotEmpty) {
      //calculate3();
      //} else if (data.isNotEmpty) {
      calculate();
      //} else if (data2.isNotEmpty) {
      // calculate2();
      //}
    });
  }

  calculate() {
    reset();
    if (data.isEmpty) {
      setState(() {});
    } else {
      total = data.length;
      for (var item in data) {
        if (item.done == '1') {
          complete += 1;
        }
      }
      if (complete != 0) {
        incomplete = total - complete;
        percentage = (complete / total) * 100.0;
      }
      setState(() {});
    }
  }

  calculate2() {
    reset();

    if (data2.isEmpty) {
      setState(() {});
    } else {
      total = data2.length;
      for (var item in data2) {
        if (item.done == '1') {
          complete += 1;
        }
      }
      if (complete != 0) {
        incomplete = total - complete;
        percentage = (complete / total) * 100.0;
      } else {
        incomplete = total;
      }
      setState(() {});
    }
  }

  calculate3() {
    reset();

    if (data2.isEmpty && data.isEmpty) {
      setState(() {});
    } else {
      total = data2.length + data.length;
      for (var item in data2) {
        if (item.done == '1') {
          complete += 1;
        }
      }
      for (var item in data) {
        if (item.done == '1') {
          complete += 1;
        }
      }
      if (complete != 0) {
        incomplete = total - complete;
        percentage = (complete / total) * 100.0;
      } else {
        incomplete = total;
      }
      setState(() {});
    }
  }

  var heading = ["Intentions Score", "Meditation Score", "Total Score"];
  String val = "Intentions Score";
  @override
  void initState() {
    get();
    geti();

    super.initState();
  }

  bool getbutton(String val) {
    if (val == heading[0]) {
      return true;
    } else {
      return false;
    }
  }

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard(widget.uid, "0")),
        );

        return true;
      },
      child: data == null
          ? Container(
              child: Center(
              child: CircularProgressIndicator(),
            ))
          : Container(
              height: height1,
              width: width1,
              color: kblue_1,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: width1 * 0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // FadeAnimation(
                          //   1,
                          //   Text(
                          //     "Your Score",
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.w700,
                          //       fontSize: 36,
                          //       color: kwhite,
                          //       fontFamily: "Rene Bieder",
                          //     ),
                          //   ),
                          // ),

                          ///////////////////////////////////////////////////// By Talha   ///////////////////
                          /* DropdownButton(
                      value: val,
                      dropdownColor: kblue,
                      //dropdownColor: kwhite,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
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
                          val = newValue;
                          if (heading[0] == newValue) {
                            calculate();
                          } else if (heading[1] == newValue) {
                            calculate2();
                          } else {
                            calculate3();
                          }
                        });
                      },
                    ),*/
                          ///////////////////////////////////////////////////////////////////////////

                          ///////////////////////////////////////////////////////   By Qaim   ///////////////////////////////////////////////

                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 29),
                            child: Container(
                              height: 52,
                              padding:
                                  EdgeInsets.only(left: 5, right: 5, top: 0),
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
                                            val = newValue;
                                            if (heading[0] == newValue) {
                                              calculate();
                                            } else if (heading[1] == newValue) {
                                              calculate2();
                                            } else {
                                              calculate3();
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 29),
                          //   child: Container(
                          //     height: 55,
                          //     padding: EdgeInsets.only(left: 15, right: 5, top: 0),
                          //     decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(8),
                          //       border: Border.all(
                          //         //color: kdark_purple,
                          //         color: Colors.white,
                          //         width: 1,
                          //       ),
                          //     ),
                          //     child: FadeAnimation(
                          //       1,
                          //       Row(
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: [
                          //           SizedBox(
                          //             width: 8,
                          //           ),
                          //           Expanded(
                          //             child: DropdownButtonFormField(
                          //               decoration: InputDecoration(
                          //                 border: InputBorder.none,
                          //               ),
                          //               focusColor: Colors.white,
                          //               //isDense: true,
                          //               autofocus: false,
                          //               hint: Text(
                          //                 val,
                          //                 style: TextStyle(
                          //                   fontSize: 16,
                          //                   //color: kdark_purple,
                          //                   color: kblue_1,
                          //                 ),
                          //               ),
                          //               icon: Icon(
                          //                 Icons.arrow_drop_down,
                          //                 color: kblue_1,
                          //               ),
                          //               iconSize: 36,
                          //               //elevation: 5,
                          //               isExpanded: true,
                          //               style: TextStyle(
                          //                 //color: kdark_purple,
                          //                 color: kblue_1,
                          //                 fontSize: 18,
                          //               ),
                          //               value: val,
                          //               onChanged: (value) {
                          //                 setState(() {
                          //                   _friendsVal = value;
                          //                   print("Selected $_friendsVal");
                          //                 });
                          //               },

                          //               items: _score_list.map((value) {
                          //                 //print("My Value $value");
                          //                 return DropdownMenuItem(
                          //                   value: value,
                          //                   child: Text(
                          //                     value,
                          //                   ),
                          //                 );
                          //               }).toList(),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          //////////////////////////////////////////////////////   Score Board       ////////////////////////////////////////
                          SizedBox(
                            height: width1 * 0.05,
                          ),
                          Container(
                            height: 240,
                            width: 240,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(
                                    "assets/score_board.png",
                                    scale: 1.7,
                                  ),
                                ),
                                Positioned(
                                  left: 70,
                                  top: 65,
                                  child: FadeAnimation(
                                    1.2,
                                    Text(
                                      percentage.floor().toString() + '%',
                                      style: TextStyle(
                                        fontFamily: "Rene Bieder",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 52,
                                        color: kblue_1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //////////////////////////////////////////////////////   Score Board  End  ////////////////////////////////////////

                          //////////////////////////////////////////////////////   Score Detail Container  ////////////////////////////////////////
                          Container(
                            height: 160,
                            width: width1 * 0.9,
                            decoration: BoxDecoration(
                              color: kblue_1,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1,
                                color: kwhite,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width1 * 0.07),
                                        child: FadeAnimation(
                                          1.3,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Completed",
                                                style: TextStyle(
                                                    fontFamily: "Rene Bieder",
                                                    color: kwhite,
                                                    fontSize: 23,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                complete.toString(),
                                                style: TextStyle(
                                                    fontFamily: "Rene Bieder",
                                                    color: kwhite,
                                                    fontSize: 23,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width1 * 0.07),
                                        child: FadeAnimation(
                                          1.4,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Incomplete",
                                                style: TextStyle(
                                                    fontFamily: "Rene Bieder",
                                                    color: kwhite,
                                                    fontSize: 23,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                incomplete.toString(),
                                                style: TextStyle(
                                                    fontFamily: "Rene Bieder",
                                                    color: kwhite,
                                                    fontSize: 23,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 40,
                                    width: width1 * 0.9,
                                    color: kwhite,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width1 * 0.07),
                                      child: FadeAnimation(
                                        1.5,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total",
                                              style: TextStyle(
                                                fontFamily: "Rene Bieder",
                                                color: kblue_1,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              total.toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "Rene Bieder",
                                                color: kblue_1,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //////////////////////////////////////////////////////   Score Detail Container END  ////////////////////////////////////////
                        ],
                      ),
                    ),

                    //////////////////////////////////////////////////////  Row of Previous Task / How you feel Button  ////////////////////////////////////////
                    getbutton(val)
                        ? Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width1 * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(PreviousIntention(widget.uid));
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 190,
                                    //color: Colors.yellow,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 14,
                                          child: Container(
                                            height: 50,
                                            width: 190,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white
                                                        .withOpacity(0.3),
                                                    spreadRadius: 1,
                                                    blurRadius: 5,
                                                    offset: Offset(0, 0),
                                                  ),
                                                ],
                                                color: kblue_1,
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                border: Border.all(
                                                    width: 1, color: kwhite)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FadeAnimation(
                                                  1.6,
                                                  intention_data == null
                                                      ? Container(
                                                          child: Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ))
                                                      : Text(
                                                          "Notification",

                                                          //"Notifications (" + intention_data.length.toString() + ")",
                                                          style: TextStyle(
                                                            color: kwhite,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 22,
                                                            letterSpacing: 1,
                                                            fontFamily:
                                                                "Rene Bieder",
                                                          ),
                                                        ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          //top: -2,
                                          right: 16,
                                          child: Container(
                                            height: 26,
                                            width: 26,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.red,
                                            ),
                                            child: Center(
                                              child: Text(
                                                intention_data.length
                                                    .toString(),
                                                style: TextStyle(
                                                  color: kwhite,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11,
                                                  fontFamily: "Rene Bieder",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Container(
                                //   width: 45,
                                //   height: 45,
                                //   decoration: BoxDecoration(
                                //     color: Colors.redAccent,
                                //     shape: BoxShape.circle,
                                //     border: Border.all(
                                //       color: kwhite,
                                //     ),
                                //   ),
                                //   child: Center(
                                //     child: FadeAnimation(
                                //       1.4,
                                //       Text(
                                //         intention_data.length.toString(),
                                //         style: TextStyle(
                                //           color: kwhite,
                                //           fontSize: 14,
                                //           fontWeight: FontWeight.w500,
                                //           fontFamily: "Rene Bieder",
                                //           letterSpacing: 1.1,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                // GestureDetector(
                                //   onTap: () {
                                //     Get.to(WeeklyFeelings(widget.uid));
                                //   },
                                //   child: Container(
                                //     height: 47,
                                //     width: 150,
                                //     decoration: BoxDecoration(
                                //       boxShadow: [
                                //         BoxShadow(
                                //           color: Colors.white.withOpacity(0.3),
                                //           spreadRadius: 2,
                                //           blurRadius: 5,
                                //           offset: Offset(0, 0),
                                //         ),
                                //       ],
                                //       color: kwhite,
                                //       borderRadius: BorderRadius.circular(7),
                                //     ),
                                //     child: Column(
                                //       mainAxisAlignment: MainAxisAlignment.center,
                                //       children: [
                                //         FadeAnimation(
                                //           1.6,
                                //           Text(
                                //             "How You Feel",
                                //             style: TextStyle(
                                //               color: kblue_1,
                                //               fontWeight: FontWeight.w700,
                                //               fontSize: 21,
                                //               fontFamily: "Rene Bieder",
                                //             ),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          )
                        : Container(),
                    //////////////////////////////////////////////////////  Row of Previous Task / How you feel Button  End ////////////////////////////////////////
                  ],
                ),
              ),
            ),
    ));
  }
}
