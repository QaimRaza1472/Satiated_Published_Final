import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:satiated_life/Animation/FadeAnimation.dart';
import 'package:satiated_life/Models/dbHelper.dart';
import 'package:satiated_life/Screens/your_score.dart';
import 'package:satiated_life/Theme/color.dart';

class PreviousIntention extends StatefulWidget {
  final String uid;
  PreviousIntention(this.uid);
  @override
  _PreviousIntentionState createState() => _PreviousIntentionState();
}

class _PreviousIntentionState extends State<PreviousIntention> {
  // List intention_data = [
  //   {
  //     'intentions': "Morning Exercise",
  //     "date": "03-Sept-2021",
  //     "from": "07:00 AM",
  //     "to": "07:30 AM",
  //   },
  //   {
  //     'intentions': "Will Do Swimming",
  //     "date": "03-Sept-2021",
  //     "from": "04:00 PM",
  //     "to": "04:30 PM",
  //   },
  //   {
  //     'intentions': "Go For Cycling",
  //     "date": "03-Sept-2021",
  //     "from": "05:00 PM",
  //     "to": "05:30 PM",
  //   },
  // ];

  int done_button_clicked;
  int not_done_clicked;
  List intention_data;
  Future<void> get() async {
    DbHelper daysdb = new DbHelper();
    intention_data = await daysdb.getPreviousIntensions();
    setState(() {});
  }

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => YourScore(widget.uid)),
        );

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
                                  " Previous Intention",
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

                        //////////////////////////////////////////////////////  List of Intentions      ////////////////////////////////////////
                        Container(
                          height: height1 * 0.8,
                          width: width1,
                          child: ListView.builder(
                              itemCount: intention_data.length,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(9, 0, 9, 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 100,
                                        //color: Colors.yellow,
                                        width: width1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            FadeAnimation(
                                              1.1,
                                              Text(
                                                intention_data[index]
                                                    .intensiontitle,
                                                style: TextStyle(
                                                    fontFamily: "Rene Bieder",
                                                    color: kwhite,
                                                    fontSize: 23,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),

                                            ///////////////////////////////////////////////////
                                            SizedBox(
                                              height: 16,
                                            ),
                                            FadeAnimation(
                                              1.3,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ///////////////////////////////// Date AND Time Column //////////////////////////////
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Date: ",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Rene Bieder",
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: kwhite,
                                                            ),
                                                          ),
                                                          Text(
                                                            intention_data[
                                                                    index]
                                                                .date,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Rene Bieder",
                                                              color: kwhite,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        intention_data[index]
                                                                .fromtime +
                                                            "  to  " +
                                                            intention_data[
                                                                    index]
                                                                .totime,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Rene Bieder",
                                                          fontSize: 14,
                                                          color: kwhite,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  //////////////////////////////////      Column End     ////////////////////////////////////

                                                  /////////////////////////////////////  Done /not Done Button Row /////////////////////
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            //done_button_clicked = index;
                                                            DbHelper daysdb =
                                                                new DbHelper();
                                                            daysdb.updatePreviosIntension(
                                                                intention_data[
                                                                        index]
                                                                    .id,
                                                                '1');
                                                            get();
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 45,
                                                          width: 81,
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  color:
                                                                      //done_button_clicked ==
                                                                      //          index
                                                                      //        ? kwhite:
                                                                      kblue_1,
                                                                  border: Border
                                                                      .all(
                                                                    color:
                                                                        kwhite,
                                                                  )),
                                                          child: Center(
                                                            child: Text(
                                                              "Done",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Rene Bieder",
                                                                color:
                                                                    // done_button_clicked ==
                                                                    //         index
                                                                    //     ? kblue_1
                                                                    //     :
                                                                    kwhite,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 9,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            setState(() {
                                                              DbHelper daysdb =
                                                                  new DbHelper();
                                                              daysdb.updatePreviosIntension(
                                                                  intention_data[
                                                                          index]
                                                                      .id,
                                                                  '2');
                                                              get();
                                                            });
                                                          });
                                                        },
                                                        child: Container(
                                                          height: 45,
                                                          width: 81,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: kblue_1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                              color: kwhite,
                                                            ),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "Not Done",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "Rene Bieder",
                                                                color: kwhite,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  /////////////////////////////////////  Done /not Done Button Row END  /////////////////////
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 1,
                                        width: width1,
                                        color: kwhite,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                        //////////////////////////////////////////////////////  List of Intentions END ////////////////////////////////////////
                      ],
                    ),
                  ),
                ),
    ));
  }
}
