import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:satiated_life/Animation/FadeAnimation.dart';
import 'package:satiated_life/Models/dbHelper.dart';
import 'package:satiated_life/Screens/dashboard.dart';
import 'package:satiated_life/Theme/color.dart';
import 'package:get/get.dart';

import 'edit_your_intension.dart';
import 'task_wheel.dart';

class ScheduledIntention extends StatefulWidget {
  final String route;
  final String uid;

  ScheduledIntention(this.route, this.uid);

  @override
  _ScheduledIntentionState createState() => _ScheduledIntentionState();
}

class _ScheduledIntentionState extends State<ScheduledIntention> {
  List days = [
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];

  List intention_data;
  Future<void> get() async {
    DbHelper daysdb = new DbHelper();
    intention_data = await daysdb.getIntensions();
    setState(() {});
  }

  bool getdays(int listindex, int index) {
    print(intention_data[listindex].sunday);
    if (int.parse(intention_data[listindex].sunday) == 1 && index == 0) {
      return true;
    } else if (int.parse(intention_data[listindex].monday) == 1 && index == 1) {
      return true;
    } else if (int.parse(intention_data[listindex].tuesday) == 1 &&
        index == 2) {
      return true;
    } else if (int.parse(intention_data[listindex].wednesday) == 1 &&
        index == 3) {
      return true;
    } else if (int.parse(intention_data[listindex].thursday) == 1 &&
        index == 4) {
      return true;
    } else if (int.parse(intention_data[listindex].friday) == 1 && index == 5) {
      return true;
    } else if (int.parse(intention_data[listindex].saturday) == 1 &&
        index == 6) {
      return true;
    } else {
      return false;
    }
  }

  bool view = false;
  int view_selected;
  int edit_selected;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    get();
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
        if (widget.route == "d") {
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
      child: intention_data == null
          ? Container(
              child: Center(
              child: CircularProgressIndicator(),
            ))
          : intention_data.isEmpty
              ? Container(
                  height: height1,
                  width: width1,
                  color: kblue_1,
                  child: Center(
                    child: Text(
                      "No Record Found!",
                      style: TextStyle(
                        fontFamily: "Rene Bieder",
                        color: kwhite,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
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
                            children: [
                              FadeAnimation(
                                1,
                                Text(
                                  "Scheduled Intention ",
                                  style: TextStyle(
                                    fontFamily: "Rene Bieder",
                                    color: kwhite,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /////////////////////////////////////////////////////////////  List of Task    /////////////////////////////////////
                        Container(
                          height: height1 * 0.80,
                          width: width1,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: intention_data.length,
                              itemBuilder: (BuildContext context, indexx) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: width1 * 0.04,
                                      left: width1 * 0.03,
                                      right: width1 * 0.03),
                                  child: Container(
                                    height: view_selected == indexx
                                        ? width1 * 0.83
                                        : 50,
                                    width: width1 * 0.9,
                                    decoration: BoxDecoration(
                                      color: kblue_1,
                                      border: Border.all(
                                        width: 1.7,
                                        color: kwhite,
                                      ),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 4,
                                                top: view_selected == indexx
                                                    ? 14
                                                    : 7,
                                                left: 4),
                                            ////////////////////////////////////////////  Row of Task Name and Menu Button   ////////////////////////////////
                                            child: FadeAnimation(
                                              1.1,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    intention_data[indexx]
                                                        .intensiontitle,
                                                    style: TextStyle(
                                                      fontFamily: "Rene Bieder",
                                                      color: kwhite,
                                                      fontSize: view_selected ==
                                                              indexx
                                                          ? 23
                                                          : 21,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 0),
                                                    child: PopupMenuButton(
                                                      tooltip: 'Menu',
                                                      child: Icon(
                                                        Icons.more_vert,
                                                        size: 34.0,
                                                        color: Colors.white,
                                                      ),
                                                      itemBuilder: (
                                                        context,
                                                      ) =>
                                                          [
                                                        PopupMenuItem(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                view_selected =
                                                                    indexx;
                                                                print(
                                                                    view_selected);
                                                                Get.back();
                                                              });
                                                            },
                                                            child: Row(
                                                                children: [
                                                                  Container(
                                                                    height: 9,
                                                                    width: 9,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color:
                                                                          kblue_1,
                                                                    ),
                                                                  ),

                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left: 7.0,
                                                                    ),
                                                                    child: Text(
                                                                      "View",
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            "Rene Bieder",
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            18.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  //),
                                                                ]),
                                                          ),
                                                        ),
                                                        PopupMenuItem(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () async {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => EditYourIntention(
                                                                        intention_data[indexx]
                                                                            .id,
                                                                        intention_data[indexx]
                                                                            .userid,
                                                                        intention_data[indexx]
                                                                            .intensiontitle,
                                                                        intention_data[indexx]
                                                                            .discription,
                                                                        intention_data[indexx]
                                                                            .fromtime,
                                                                        intention_data[indexx]
                                                                            .totime,
                                                                        intention_data[indexx]
                                                                            .sunday,
                                                                        intention_data[indexx]
                                                                            .monday,
                                                                        intention_data[indexx]
                                                                            .tuesday,
                                                                        intention_data[indexx]
                                                                            .wednesday,
                                                                        intention_data[indexx]
                                                                            .thursday,
                                                                        intention_data[indexx]
                                                                            .friday,
                                                                        intention_data[indexx]
                                                                            .saturday,
                                                                        intention_data[indexx]
                                                                            .prenotification,
                                                                        intention_data[indexx]
                                                                            .wheelhead)),
                                                              );
                                                            },
                                                            child: Row(
                                                                children: [
                                                                  Container(
                                                                    height: 9,
                                                                    width: 9,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color:
                                                                          kblue_1,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left: 7,
                                                                    ),
                                                                    child: Text(
                                                                      "Edit",
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            "Rene Bieder",
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            18.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  //)
                                                                ]),
                                                          ),
                                                        ),
                                                        PopupMenuItem(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () async {
                                                              DbHelper helper =
                                                                  DbHelper();
                                                              await helper.deleteIntensions(
                                                                  intention_data[
                                                                          indexx]
                                                                      .id);
                                                              Get.back();
                                                              await get();
                                                            },
                                                            child: Row(
                                                                children: [
                                                                  Container(
                                                                    height: 9,
                                                                    width: 9,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color:
                                                                          kblue_1,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      left: 7.0,
                                                                    ),
                                                                    child: Text(
                                                                      "Delete",
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            "Rene Bieder",
                                                                        color: Colors
                                                                            .black54,
                                                                        fontSize:
                                                                            18.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              ////////////////////////////////////////////              End                   ////////////////////////////////
                                            ),
                                          ),

                                          /////////////////////////////////////////////////     jab menu button m view  py click krn gy ye open ho ga   /////////////////

                                          view_selected == indexx
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 7,
                                                    top: width1 * 0.03,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      ///////////////////////////////////////////////////////   Selected Time Container /////////////////////////////
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: width1 *
                                                                    0.05),
                                                        child: Container(
                                                          width: 230,
                                                          height: 110,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              FadeAnimation(
                                                                1,
                                                                Text(
                                                                  'Selected Time',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "Rene Bieder",
                                                                    color:
                                                                        kwhite,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 12,
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            25),
                                                                child:
                                                                    FadeAnimation(
                                                                  1.1,
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'From: ',
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              "Rene Bieder",
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              kwhite,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        intention_data[indexx]
                                                                            .fromtime,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              "Rene Bieder",
                                                                          color:
                                                                              kwhite,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 9,
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            25),
                                                                child:
                                                                    FadeAnimation(
                                                                  1.2,
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'To: ',
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              "Rene Bieder",
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          color:
                                                                              kwhite,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        intention_data[indexx]
                                                                            .totime,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              "Rene Bieder",
                                                                          color:
                                                                              kwhite,
                                                                          fontSize:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      //////////////////////////////////////////////////////    Container End       //////////////////////////////

                                                      ////////////////////////////////////////////////////// Selected Date  ////////////////////////////////
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: width1 * 0.05,
                                                        ),
                                                        child: FadeAnimation(
                                                          1.3,
                                                          Text(
                                                            "Selected Days",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Rene Bieder",
                                                              color: kwhite,
                                                              fontSize: 21,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 7,
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: width1 * 0.00,
                                                        ),
                                                        height: 50,
                                                        width: width1 * 0.86,
                                                        child: ListView.builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            physics:
                                                                BouncingScrollPhysics(),
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                days.length,
                                                            itemBuilder:
                                                                (conext,
                                                                    index) {
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            0,
                                                                            5,
                                                                            1,
                                                                            5),
                                                                child:
                                                                    Container(
                                                                  width: 43,
                                                                  height: 43,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: getdays(
                                                                            indexx,
                                                                            index)
                                                                        ? kwhite
                                                                        : kblue_1,
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color:
                                                                          kwhite,
                                                                    ),
                                                                  ),
                                                                  child: Center(
                                                                    child:
                                                                        FadeAnimation(
                                                                      1.4,
                                                                      Text(
                                                                        days[
                                                                            index],
                                                                        style:
                                                                            TextStyle(
                                                                          color: getdays(indexx, index)
                                                                              ? kblue_1
                                                                              : kwhite,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                          fontFamily:
                                                                              "Rene Bieder",
                                                                          letterSpacing:
                                                                              1.1,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : Container(),
                                          ///////////////////////////////////////////////////    view End    //////////////////////////////////////////////////////
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
    ));
  }
}
