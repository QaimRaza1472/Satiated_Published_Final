import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:satiated_life/Animation/FadeAnimation.dart';
import 'package:satiated_life/Models/dbHelper.dart';
import 'package:satiated_life/Models/feelings.dart';
import 'package:satiated_life/Theme/color.dart';

class WeeklyFeelings extends StatefulWidget {
  final String uid;
  WeeklyFeelings(this.uid);

  @override
  _WeeklyFeelingsState createState() => _WeeklyFeelingsState();
}

class _WeeklyFeelingsState extends State<WeeklyFeelings> {
  String getdate(String date) {
    var finaldate =
        DateFormat('MM-dd-yyyy').format(DateFormat('dd-MM-yyyy').parse(date));
    return finaldate;
  }

  List data = [
    {
      'detail':
          "Lorem Ispum si simply dummy text of the printing and typesetting industry.Lorem Ispum si simply dummy text of the printing and typesetting industry.",
      "date": "03-Sept-2021",
      "from": "07:00 AM",
      "to": "07:30 AM",
    },
    {
      'detail':
          "Lorem Ispum si simply dummy text of the printing and typesetting industry.Lorem Ispum si simply dummy text of the printing and typesetting industry.",
      "date": "03-Sept-2021",
      "from": "04:00 PM",
      "to": "04:30 PM",
    },
  ];
  DbHelper db = new DbHelper();
  final typehere = TextEditingController();
  var intention_data;
  Future<void> get() async {
    intention_data = await db.getFeeling();
    setState(() {});
  }

  void insertFeelings(String details, String submiton, String uid) async {
    final list = Feelings(details, submiton, uid);
    await db.insertFeelings(list);
  }

  @override
  void initState() {
    // TODO: implement initState
    get();
    super.initState();
    typehere.text = "";
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
      body: intention_data == null
          ? Container(
              child: Center(
              child: CircularProgressIndicator(),
            ))
          : Container(
              height: height1,
              width: width1,
              color: kblue_1,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: width1 * 0.15),
                        child: Column(
                          children: [
                            FadeAnimation(
                              1,
                              Text(
                                "Weekly Feelings",
                                style: TextStyle(
                                  fontFamily: "Rene Bieder",
                                  color: kwhite,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: width1 * 0.05,
                            ),

                            FadeAnimation(
                              1.1,
                              Text(
                                "How You are Feeling This week ?",
                                style: TextStyle(
                                  fontFamily: "Rene Bieder",
                                  color: kwhite,
                                  fontSize: 18,
                                ),
                              ),
                            ),

                            //////////////////////////////////////////////////////  Type Here Container      ////////////////////////////////////////
                            Padding(
                              padding: EdgeInsets.only(
                                top: width1 * 0.01,
                              ),
                              child: Container(
                                width: width1 * 0.9,
                                height: width1 * 0.32,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                  color: kblue_1,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 1.3,
                                    color: kwhite,
                                  ),
                                ),
                                child: FadeAnimation(
                                  1.2,
                                  TextFormField(
                                    controller: typehere,
                                    cursorColor: kwhite,
                                    maxLines: 8,
                                    style: TextStyle(
                                      color: kwhite,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Rene Bieder",
                                      letterSpacing: 1.1,
                                    ),
                                    decoration: InputDecoration.collapsed(
                                      hintText: "Type Here...",
                                      hintStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: kwhite,
                                        fontFamily: "Rene Bieder",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //////////////////////////////////////////////////////  Type Here Container  End  ////////////////////////////////////////

                            //////////////////////////////////////////////////////  Submit Button           ////////////////////////////////////////
                            Padding(
                              padding: EdgeInsets.only(
                                top: width1 * 0.05,
                              ),
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
                                    borderRadius: BorderRadius.circular(7),
                                    color: kwhite),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        if (typehere.text != "") {
                                          var now = new DateTime.now();
                                          var formatter =
                                              new DateFormat('dd-MM-yyyy');
                                          String formattedDate =
                                              formatter.format(now);

                                          await insertFeelings(typehere.text,
                                              formattedDate, widget.uid);
                                          get();
                                          setState(() {
                                            typehere.text = "";
                                          });
                                        }
                                      },
                                      child: FadeAnimation(
                                        1.3,
                                        Text(
                                          "Submit",
                                          style: TextStyle(
                                            color: kblue_1,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 21,
                                            fontFamily: "Rene Bieder",
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            //////////////////////////////////////////////////////  Submit Button End      ////////////////////////////////////////

                            //////////////////////////////////////////////////////  Past Feeling Container  ////////////////////////////////////////
                            Padding(
                              padding: EdgeInsets.only(
                                top: width1 * 0.05,
                              ),
                              child: Container(
                                height: width1 * 0.1,
                                width: width1 * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: kblue_1,
                                  border: Border.all(
                                    width: 1.7,
                                    color: kwhite,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FadeAnimation(
                                          1.4,
                                          Text(
                                            "Past Feeling",
                                            style: TextStyle(
                                              fontFamily: "Rene Bieder",
                                              fontWeight: FontWeight.w500,
                                              color: kwhite,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //////////////////////////////////////////////////////  Past Feeling Container  End   ////////////////////////////////////////
                          ],
                        ),
                      ),

                      //////////////////////////////////////////////////////  List of Weekly Feelings  ////////////////////////////////////////
                      Padding(
                        padding: EdgeInsets.only(
                          top: width1 * 0.05,
                        ),
                        child: Container(
                          height: height1 * 0.45,
                          width: width1,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: intention_data.length,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(14, 7, 14, 10),
                                  child: Column(
                                    children: [
                                      Container(
                                        //color: Colors.red,
                                        //height: 100,
                                        width: width1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FadeAnimation(
                                              1.5,
                                              Text(
                                                "Submitted On :" +
                                                    // new DateFormat('MM-dd-yyyy')
                                                    //     .parse(intention_data[
                                                    //             index]
                                                    //         .submiton)
                                                    //     .toString(),
                                                    getdate(
                                                        intention_data[index]
                                                            .submiton),
                                                style: TextStyle(
                                                  fontFamily: "Rene Bieder",
                                                  color: kwhite,
                                                  fontSize: 21,
                                                ),
                                              ),
                                            ),

                                            ///////////////////////////////////////////////
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Container(
                                              width: 360,
                                              //color: Colors.green,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: width1,
                                                    //color: kwhite,
                                                    child: FadeAnimation(
                                                      1.6,
                                                      Text(
                                                        intention_data[index]
                                                            .details,
                                                        style: TextStyle(
                                                          //color: Colors.yellow,
                                                          color: Colors.white,
                                                          fontFamily:
                                                              "Rene Bieder",
                                                          //color: kwhite,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  /*         FadeAnimation(
                                                    1.6,

                                                    TextFormField(
                                                      initialValue: intention_data[index].details,
                                                      // maxLines: 8,
                                                      style: TextStyle(
                                                        color: Colors.yellow,
                                                        fontFamily:
                                                            "Rene Bieder",
                                                        //color: kwhite,
                                                        fontSize: 16,
                                                      ),
                                                    ),


                                                  ),*/

                                                  SizedBox(
                                                    height: 1,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      //////////////////////////////////////////////////////  List of Weekly Feelings End ////////////////////////////////////////
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
