import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:satiated_life/Animation/FadeAnimation.dart';
import 'package:satiated_life/Models/busyhours.dart';
import 'package:satiated_life/Models/dbHelper.dart';
import 'package:satiated_life/Theme/color.dart';
import 'package:get/get.dart';

import 'busy_hours_list.dart';
import 'dashboard.dart';

class BusyHours extends StatefulWidget {
  final String uid;
  BusyHours(this.uid);

  @override
  _BusyHoursState createState() => _BusyHoursState();
}

List days = [
  "Sun",
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
];

class _BusyHoursState extends State<BusyHours> {
  String _fromTime = '7:00 AM';
  String _toTime = '7:00 PM';

  int sun = 0;
  int mon = 0;
  int tue = 0;
  int wed = 0;
  int thurs = 0;
  int fri = 0;
  int sat = 0;

  int selected;

  final busyController = TextEditingController();
  var intention_data;
  Future<void> get() async {
    DbHelper daysdb = new DbHelper();
    intention_data = await daysdb.getbusyhours();
    setState(() {});
  }

  Reset() {
    busyController.text = "";
    _fromTime = '7:00 AM';
    _toTime = '7:00 PM';
    sun = 0;
    mon = 0;
    tue = 0;
    wed = 0;
    thurs = 0;
    fri = 0;
    sat = 0;
    setState(() {});
  }

  bool validate() {
    if ((sun == 1 ||
            mon == 1 ||
            tue == 1 ||
            wed == 1 ||
            thurs == 1 ||
            fri == 1 ||
            sat == 1) &&
        busyController.text != "") {
      return true;
    }
    return false;
  }

  /// Database uses
  DbHelper helper = DbHelper();
  void insertbusyhours(
      String busyreason,
      String from,
      String to,
      String su,
      String mo,
      String tu,
      String we,
      String thr,
      String fr,
      String sa,
      String uid) async {
    final list =
        BusyHour(busyreason, from, to, su, mo, tu, we, thr, fr, sa, uid);
    await helper.insertBusyHours(list);
  }

  bool getday(int index) {
    if (sun == 1 && index == 0) {
      return true;
    }
    if (mon == 1 && index == 1) {
      return true;
    }
    if (tue == 1 && index == 2) {
      return true;
    }
    if (wed == 1 && index == 3) {
      return true;
    }
    if (thurs == 1 && index == 4) {
      return true;
    }
    if (fri == 1 && index == 5) {
      return true;
    }
    if (sat == 1 && index == 6) {
      return true;
    } else {
      return false;
    }
  }

  bool checkAlreadyData() {
    for (var item in intention_data) {
      if (item.sunday == "1" && sun == 1) {
        DateTime date = DateFormat.jm().parse(item.fromtime);
        DateTime date2 = DateFormat("hh:mm a").parse(item.totime);
        DateTime date3 = DateFormat.jm().parse(_fromTime);
        DateTime date4 = DateFormat("hh:mm a").parse(_toTime);

// format date
        print(DateFormat("HH:mm").format(date));
        print(DateFormat("HH:mm").format(date2));
        final myString = DateFormat("HH:mm").format(date);
        final myString2 = DateFormat("HH:mm").format(date2);
        final myString3 = DateFormat("HH:mm").format(date3);
        final myString4 = DateFormat("HH:mm").format(date4);

        int databasefromtime =
            int.parse(myString.replaceAll(RegExp(':'), '')); //
        int databasetotime =
            int.parse(myString2.replaceAll(RegExp(':'), '')); //
        int runtimefromtime =
            int.parse(myString3.replaceAll(RegExp(':'), '')); //
        int runtimetotime = int.parse(myString4.replaceAll(RegExp(':'), '')); //
        print(databasefromtime);
        print(databasetotime);
        print(runtimefromtime);
        print(runtimetotime);

        if (databasefromtime <= runtimefromtime &&
            runtimefromtime <= databasetotime) {
          return true;
        } else if (databasefromtime <= runtimetotime &&
            runtimetotime <= databasetotime) {
          return true;
        }
      }
      if (item.monday == "1" && mon == 1) {
        DateTime date = DateFormat.jm().parse(item.fromtime);
        DateTime date2 = DateFormat("hh:mm a").parse(item.totime);
        DateTime date3 = DateFormat.jm().parse(_fromTime);
        DateTime date4 = DateFormat("hh:mm a").parse(_toTime);

// format date
        print(DateFormat("HH:mm").format(date));
        print(DateFormat("HH:mm").format(date2));
        final myString = DateFormat("HH:mm").format(date);
        final myString2 = DateFormat("HH:mm").format(date2);
        final myString3 = DateFormat("HH:mm").format(date3);
        final myString4 = DateFormat("HH:mm").format(date4);

        int databasefromtime =
            int.parse(myString.replaceAll(RegExp(':'), '')); //
        int databasetotime =
            int.parse(myString2.replaceAll(RegExp(':'), '')); //
        int runtimefromtime =
            int.parse(myString3.replaceAll(RegExp(':'), '')); //
        int runtimetotime = int.parse(myString4.replaceAll(RegExp(':'), '')); //
        print(databasefromtime);
        print(databasetotime);
        print(runtimefromtime);
        print(runtimetotime);

        if (databasefromtime <= runtimefromtime &&
            runtimefromtime <= databasetotime) {
          return true;
        } else if (databasefromtime <= runtimetotime &&
            runtimetotime <= databasetotime) {
          return true;
        }
      }
      if (item.tuesday == "1" && tue == 1) {
        DateTime date = DateFormat.jm().parse(item.fromtime);
        DateTime date2 = DateFormat("hh:mm a").parse(item.totime);
        DateTime date3 = DateFormat.jm().parse(_fromTime);
        DateTime date4 = DateFormat("hh:mm a").parse(_toTime);

// format date
        print(DateFormat("HH:mm").format(date));
        print(DateFormat("HH:mm").format(date2));
        final myString = DateFormat("HH:mm").format(date);
        final myString2 = DateFormat("HH:mm").format(date2);
        final myString3 = DateFormat("HH:mm").format(date3);
        final myString4 = DateFormat("HH:mm").format(date4);

        int databasefromtime =
            int.parse(myString.replaceAll(RegExp(':'), '')); //
        int databasetotime =
            int.parse(myString2.replaceAll(RegExp(':'), '')); //
        int runtimefromtime =
            int.parse(myString3.replaceAll(RegExp(':'), '')); //
        int runtimetotime = int.parse(myString4.replaceAll(RegExp(':'), '')); //
        print(databasefromtime);
        print(databasetotime);
        print(runtimefromtime);
        print(runtimetotime);

        if (databasefromtime <= runtimefromtime &&
            runtimefromtime <= databasetotime) {
          return true;
        } else if (databasefromtime <= runtimetotime &&
            runtimetotime <= databasetotime) {
          return true;
        }
      }
      if (item.wednesday == "1" && wed == 1) {
        DateTime date = DateFormat.jm().parse(item.fromtime);
        DateTime date2 = DateFormat("hh:mm a").parse(item.totime);
        DateTime date3 = DateFormat.jm().parse(_fromTime);
        DateTime date4 = DateFormat("hh:mm a").parse(_toTime);

// format date
        print(DateFormat("HH:mm").format(date));
        print(DateFormat("HH:mm").format(date2));
        final myString = DateFormat("HH:mm").format(date);
        final myString2 = DateFormat("HH:mm").format(date2);
        final myString3 = DateFormat("HH:mm").format(date3);
        final myString4 = DateFormat("HH:mm").format(date4);

        int databasefromtime =
            int.parse(myString.replaceAll(RegExp(':'), '')); //
        int databasetotime =
            int.parse(myString2.replaceAll(RegExp(':'), '')); //
        int runtimefromtime =
            int.parse(myString3.replaceAll(RegExp(':'), '')); //
        int runtimetotime = int.parse(myString4.replaceAll(RegExp(':'), '')); //
        print(databasefromtime);
        print(databasetotime);
        print(runtimefromtime);
        print(runtimetotime);

        if (databasefromtime <= runtimefromtime &&
            runtimefromtime <= databasetotime) {
          return true;
        } else if (databasefromtime <= runtimetotime &&
            runtimetotime <= databasetotime) {
          return true;
        }
      }
      if (item.thursday == "1" && thurs == 1) {
        DateTime date = DateFormat.jm().parse(item.fromtime);
        DateTime date2 = DateFormat("hh:mm a").parse(item.totime);
        DateTime date3 = DateFormat.jm().parse(_fromTime);
        DateTime date4 = DateFormat("hh:mm a").parse(_toTime);

// format date
        print(DateFormat("HH:mm").format(date));
        print(DateFormat("HH:mm").format(date2));
        final myString = DateFormat("HH:mm").format(date);
        final myString2 = DateFormat("HH:mm").format(date2);
        final myString3 = DateFormat("HH:mm").format(date3);
        final myString4 = DateFormat("HH:mm").format(date4);

        int databasefromtime =
            int.parse(myString.replaceAll(RegExp(':'), '')); //
        int databasetotime =
            int.parse(myString2.replaceAll(RegExp(':'), '')); //
        int runtimefromtime =
            int.parse(myString3.replaceAll(RegExp(':'), '')); //
        int runtimetotime = int.parse(myString4.replaceAll(RegExp(':'), '')); //
        print(databasefromtime);
        print(databasetotime);
        print(runtimefromtime);
        print(runtimetotime);

        if (databasefromtime <= runtimefromtime &&
            runtimefromtime <= databasetotime) {
          return true;
        } else if (databasefromtime <= runtimetotime &&
            runtimetotime <= databasetotime) {
          return true;
        }
      }
      if (item.friday == "1" && fri == 1) {
        DateTime date = DateFormat.jm().parse(item.fromtime);
        DateTime date2 = DateFormat("hh:mm a").parse(item.totime);
        DateTime date3 = DateFormat.jm().parse(_fromTime);
        DateTime date4 = DateFormat("hh:mm a").parse(_toTime);

// format date
        print(DateFormat("HH:mm").format(date));
        print(DateFormat("HH:mm").format(date2));
        final myString = DateFormat("HH:mm").format(date);
        final myString2 = DateFormat("HH:mm").format(date2);
        final myString3 = DateFormat("HH:mm").format(date3);
        final myString4 = DateFormat("HH:mm").format(date4);

        int databasefromtime =
            int.parse(myString.replaceAll(RegExp(':'), '')); //
        int databasetotime =
            int.parse(myString2.replaceAll(RegExp(':'), '')); //
        int runtimefromtime =
            int.parse(myString3.replaceAll(RegExp(':'), '')); //
        int runtimetotime = int.parse(myString4.replaceAll(RegExp(':'), '')); //
        print(databasefromtime);
        print(databasetotime);
        print(runtimefromtime);
        print(runtimetotime);

        if (databasefromtime <= runtimefromtime &&
            runtimefromtime <= databasetotime) {
          return true;
        } else if (databasefromtime <= runtimetotime &&
            runtimetotime <= databasetotime) {
          return true;
        }
      }
      if (item.saturday == "1" && sat == 1) {
        DateTime date = DateFormat.jm().parse(item.fromtime);
        DateTime date2 = DateFormat("hh:mm a").parse(item.totime);
        DateTime date3 = DateFormat.jm().parse(_fromTime);
        DateTime date4 = DateFormat("hh:mm a").parse(_toTime);

// format date
        print(DateFormat("HH:mm").format(date));
        print(DateFormat("HH:mm").format(date2));
        final myString = DateFormat("HH:mm").format(date);
        final myString2 = DateFormat("HH:mm").format(date2);
        final myString3 = DateFormat("HH:mm").format(date3);
        final myString4 = DateFormat("HH:mm").format(date4);

        int databasefromtime =
            int.parse(myString.replaceAll(RegExp(':'), '')); //
        int databasetotime =
            int.parse(myString2.replaceAll(RegExp(':'), '')); //
        int runtimefromtime =
            int.parse(myString3.replaceAll(RegExp(':'), '')); //
        int runtimetotime = int.parse(myString4.replaceAll(RegExp(':'), '')); //
        print(databasefromtime);
        print(databasetotime);
        print(runtimefromtime);
        print(runtimetotime);

        if (databasefromtime <= runtimefromtime &&
            runtimefromtime <= databasetotime) {
          return true;
        } else if (databasefromtime <= runtimetotime &&
            runtimetotime <= databasetotime) {
          return true;
        }
      }
    }
    return false;
  }

  //  return true;

  _filesDialog(BuildContext context, String eventName) {
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
                                "Oops",
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
                                eventName,
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
  // _filesDialog(BuildContext context, String eventName) {
  //   // set up the button
  //   Widget okButton = TextButton(
  //     child: Text("OK"),
  //     onPressed: () {
  //       Navigator.pop(context);
  //     },
  //   );

  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Alert!"),
  //     content: Text(eventName),
  //     actions: [
  //       okButton,
  //     ],
  //   );

  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  String txtLength = "0";
  @override
  void initState() {
    super.initState();
    get();
    busyController.text = "";
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    busyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;

    ///////////////////////////////////////////////////////////// For From Time /////////////////////////
    Future<void> _fromTimePicker(BuildContext context) async {
      final TimeOfDay time1 =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (time1 != null) {
        setState(() {
          _fromTime = time1.format(context);
        });
      }
    }
///////////////////////////////////////////////////////  From Time End ////////////////////////////////////

////////////////////////////////////////////////////////  To Time ////////////////////////////////////////
    Future<void> _toTimePicker(BuildContext context) async {
      final TimeOfDay time2 =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (time2 != null) {
        setState(() {
          _toTime = time2.format(context);
        });
      }
    }

///////////////////////////////////////////////////////    TO Time End    /////////////////////////////////
    // _filesDialog(BuildContext context, String eventName) {
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return StatefulBuilder(builder: (thisLowerContext, innerSetState) {
    //           return Dialog(
    //             insetPadding: EdgeInsets.zero,
    //             elevation: 1,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //             child: Padding(
    //               padding: EdgeInsets.all(8.0),
    //               child: Container(
    //                 width: 390,
    //                 height: 250,
    //                 padding: EdgeInsets.symmetric(vertical: 15),
    //                 decoration: BoxDecoration(
    //                   color: kwhite,
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color: Colors.grey.withOpacity(0.1),
    //                       spreadRadius: 1,
    //                       blurRadius: 5,
    //                       offset: Offset(
    //                         0,
    //                         0,
    //                       ),
    //                     ),
    //                   ],
    //                   borderRadius: BorderRadius.circular(10),
    //                 ),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     SizedBox(height: 15),
    //                     Text(
    //                       eventName,
    //                       style: TextStyle(
    //                         color: kblue_1,
    //                         fontFamily: "Rene Bieder",
    //                         fontSize: 20,
    //                       ),
    //                     ),
    //                     SizedBox(height: 120),
    //                     Row(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: [
    //                         SizedBox(width: 20),
    //                         Container(
    //                           width: 145,
    //                           height: 50,
    //                           decoration: BoxDecoration(
    //                               color: Color(0xFFFFFFFFF),
    //                               borderRadius: BorderRadius.circular(10),
    //                               border: Border.all(
    //                                 width: 1,
    //                                 color: Color(0xFF0360a3),
    //                               )),
    //                           child: FlatButton(
    //                             onPressed: () {
    //                               Navigator.of(context).pop();
    //                             },
    //                             child: Text(
    //                               'OK',
    //                               textAlign: TextAlign.center,
    //                               style: TextStyle(
    //                                 fontFamily: "Rene Bieder",
    //                                 color: kblue_1,
    //                                 fontSize: 19,
    //                                 fontWeight: FontWeight.w600,
    //                                 letterSpacing: 0.9,
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           );
    //         });
    //       });
    // }

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
      child: Container(
        height: height1,
        width: width1,
        color: kblue_1,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(top: width1 * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: width1 * 0.1),
                      child: FadeAnimation(
                        1,
                        Text(
                          "Add Your Schedule",
                          style: TextStyle(
                            fontFamily: "Rene Bieder",
                            color: kwhite,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    /////////////////////////////////////////////////////////   Busy Reason Container       //////////////////////////////////////////
                    Padding(
                      padding: EdgeInsets.only(top: width1 * 0.2),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: width1 * 0.9,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              border: Border.all(width: 1.7, color: kwhite),
                              color: kblue_1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, top: 11),
                              child: FadeAnimation(
                                1.1,
                                TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(15),
                                  ],
                                  controller: busyController,
                                  cursorColor: kwhite,
                                  onChanged: (String value) async {
                                    setState(() {
                                      txtLength = value.length.toString();
                                    });
                                  },
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kwhite,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Rene Bieder",
                                  ),
                                  maxLines: 8,
                                  decoration: InputDecoration.collapsed(
                                    hintText:
                                        "Input Schedule like Work, Sleep...",
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: kwhite,
                                      fontFamily: "Rene Bieder",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: width1 * 0.07, top: 5),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "$txtLength/15",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kwhite,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //////////////////////////////////////////////////////// Busy Reason Container End  //////////////////////////////////////////

                    Padding(
                      padding: EdgeInsets.only(top: width1 * 0.07),
                      child: Container(
                        // color: Colors.green,
                        height: 200,
                        width: width1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                /////////////////////////////////////////////////////     From Time       ////////////////////////////////////////
                                Column(
                                  children: [
                                    FadeAnimation(
                                      1.2,
                                      Text(
                                        "From",
                                        style: TextStyle(
                                          fontFamily: "Rene Bieder",
                                          fontWeight: FontWeight.w500,
                                          color: kwhite,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        FocusScopeNode currentFocus =
                                            FocusScope.of(context);

                                        if (!currentFocus.hasPrimaryFocus) {
                                          currentFocus.unfocus();
                                        }

                                        _fromTimePicker(context);
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                          border: Border.all(
                                            width: 1.7,
                                            color: kwhite,
                                          ),
                                          color: kblue_1,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: FadeAnimation(
                                            1.3,
                                            Text(
                                              _fromTime,
                                              style: TextStyle(
                                                fontFamily: "Rene Bieder",
                                                fontWeight: FontWeight.w500,
                                                color: kwhite,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //////////////////////////////////////////////////////   From Time End    /////////////////////////////////////
                                Container(
                                  height: 100,
                                  width: 2,
                                  color: kwhite,
                                ),
                                /////////////////////////////////////////////////////   To Time         //////////////////////////////////////////////
                                Column(
                                  children: [
                                    FadeAnimation(
                                      1.2,
                                      Text(
                                        "To",
                                        style: TextStyle(
                                          fontFamily: "Rene Bieder",
                                          fontWeight: FontWeight.w500,
                                          color: kwhite,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        FocusScopeNode currentFocus =
                                            FocusScope.of(context);

                                        if (!currentFocus.hasPrimaryFocus) {
                                          currentFocus.unfocus();
                                        }

                                        _toTimePicker(context);
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                          border: Border.all(
                                            width: 1.7,
                                            color: kwhite,
                                          ),
                                          color: kblue_1,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: FadeAnimation(
                                            1.3,
                                            Text(
                                              _toTime,
                                              style: TextStyle(
                                                fontFamily: "Rene Bieder",
                                                fontWeight: FontWeight.w500,
                                                color: kwhite,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                /////////////////////////////////////////////////////  To Time End    //////////////////////////////////////////
                              ],
                            ),
                            //////////////////////////////////////////////////////    Days List       ////////////////////////////////////////////
                            SizedBox(
                              height: width1 * 0.05,
                            ),
                            Container(
                              //padding: EdgeInsets.only(left: width1 * 0.025),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              height: 50,
                              //width: width1*0.97,
                              width: 350,
                              //color: Colors.yellow,
                              child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: days.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.fromLTRB(3, 5, 0, 5),
                                      child: GestureDetector(
                                        onTap: () async {
                                          await get();
                                          setState(() {
                                            if (index == 0) {
                                              if (sun == 0) {
                                                sun = 1;
                                              } else {
                                                sun = 0;
                                              }
                                            }
                                            if (index == 1) {
                                              if (mon == 0) {
                                                mon = 1;
                                              } else {
                                                mon = 0;
                                              }
                                            }

                                            if (index == 2) {
                                              if (tue == 0) {
                                                tue = 1;
                                              } else {
                                                tue = 0;
                                              }
                                            }

                                            if (index == 3) {
                                              if (wed == 0) {
                                                wed = 1;
                                              } else {
                                                wed = 0;
                                              }
                                            }

                                            if (index == 4) {
                                              if (thurs == 0) {
                                                thurs = 1;
                                              } else {
                                                thurs = 0;
                                              }
                                            }

                                            if (index == 5) {
                                              if (fri == 0) {
                                                fri = 1;
                                              } else {
                                                fri = 0;
                                              }
                                            }

                                            if (index == 6) {
                                              if (sat == 0) {
                                                sat = 1;
                                              } else {
                                                sat = 0;
                                              }
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            color: getday(index)
                                                ? kwhite
                                                : kblue_1,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: kwhite,
                                            ),
                                          ),
                                          child: Center(
                                            child: FadeAnimation(
                                              1.4,
                                              Text(
                                                days[index],
                                                style: TextStyle(
                                                  color: getday(index)
                                                      ? kblue_1
                                                      : kwhite,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "Rene Bieder",
                                                  letterSpacing: 1.1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),

                            /////////////////////////////////////////////////////     Days List End //////////////////////////////////////////////
                          ],
                        ),
                      ),
                    ),

                    ////////////////////////////////////////////////////////////      Save/ View Button  ////////////////////////////////////////////
                    Padding(
                      padding: EdgeInsets.only(top: width1 * 0.14),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              if (checkAlreadyData() == false) {
                                if (validate() == false) {
                                  _filesDialog(context,
                                      "Please enter data correctly...");
                                } else {
                                  await insertbusyhours(
                                      busyController.text,
                                      _fromTime,
                                      _toTime,
                                      sun.toString(),
                                      mon.toString(),
                                      tue.toString(),
                                      wed.toString(),
                                      thurs.toString(),
                                      fri.toString(),
                                      sat.toString(),
                                      widget.uid);
                                  await get();
                                  Reset();
                                  Get.to(BusyHoursList());
                                }
                              } else {
                                print('not add');

                                _filesDialog(
                                    context, "Already Have Data On Same Hours");
                              }

                              // print(widget.uid);
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FadeAnimation(
                                    1.5,
                                    Text(
                                      "Save",
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
                          ),
                          SizedBox(
                            height: width1 * 0.032,
                          ),
                          GestureDetector(
                            onTap: () async {
                              Get.to(BusyHoursList());

                              // print("hello");
                              //DbHelper daysdb = new DbHelper();
                              //var test = await daysdb.getbusyhours();
                              // print(test[1].fromtime);
                              //  print(test.length);
                            },
                            child: Container(
                              height: 47,
                              width: 190,
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FadeAnimation(
                                    1.6,
                                    Text(
                                      "My Schedules",
                                      style: TextStyle(
                                        color: kwhite,
                                        fontFamily: "Rene Bieder",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 21,
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
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
