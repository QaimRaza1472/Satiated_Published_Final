import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:satiated_life/Animation/FadeAnimation.dart';
import 'package:satiated_life/Models/dbHelper.dart';
import 'package:satiated_life/Models/previousmeditation.dart';
import 'package:satiated_life/Theme/color.dart';
import 'package:get/get.dart';

class MeditationTab extends StatefulWidget {
  @override
  _MeditationTabState createState() => _MeditationTabState();
}

class _MeditationTabState extends State<MeditationTab> {
  String getdate(String date) {
    var finaldate =
        DateFormat('MM-dd-yyyy').format(DateFormat('dd-MM-yyyy').parse(date));
    return finaldate;
  }

  List image = [
    "assets/male/2.png",
    "assets/male/2.png",
    "assets/male/2.png",
    "assets/male/2.png",
    "assets/male/2.png",
    "assets/male/2.png"
  ];
  List title = [
    "OCEAN BEAUTY",
    "80's CONCERT",
    "OCEAN BEAUTY",
  ];

  int view_selected;
  List<PreviousMeditationGET> intention_data;
  DbHelper db = new DbHelper();
  Future<void> get() async {
    intention_data = await db.getmeditation();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: intention_data.isNullOrBlank == true
          ? Container(
              child: Center(
              child: Text('No data found'),
            ))
          : Container(
              height: height1,
              width: width1,
              child: Column(
                children: [
                  SizedBox(
                    height: height1 * 0.023,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: width1 * 0.025, top: 14, left: width1 * 0.025),
                    child:
                        ////////////////////////////////////////////  Row of Task Name and Menu Button   ////////////////////////////////
                        Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select Type",
                          style: TextStyle(
                            fontSize: 21,
                            color: kblue_1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: PopupMenuButton(
                            color: kblue_1,
                            tooltip: 'Menu',
                            child: Icon(
                              Icons.more_vert,
                              size: 34.0,
                              color: kblue_1,
                            ),
                            itemBuilder: (
                              context,
                            ) =>
                                [
                              PopupMenuItem(
                                child: GestureDetector(
                                  onTap: () async {
                                    await get();
                                    setState(() {
                                      Get.back();
                                    });
                                  },
                                  child: Row(children: [
                                    Container(
                                      height: 9,
                                      width: 9,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kwhite,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 7.0,
                                      ),
                                      child: Text(
                                        "All",
                                        style: TextStyle(
                                          fontFamily: "Rene Bieder",
                                          color: kwhite,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                              PopupMenuItem(
                                child: GestureDetector(
                                  onTap: () async {
                                    await get();
                                    intention_data = intention_data
                                        .where((done) => done.done == "1")
                                        .toList();
                                    setState(() {
                                      Get.back();
                                    });
                                  },
                                  child: Row(children: [
                                    Container(
                                      height: 9,
                                      width: 9,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kwhite,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 7,
                                      ),
                                      child: Text(
                                        "Complete",
                                        style: TextStyle(
                                          fontFamily: "Rene Bieder",
                                          color: kwhite,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    //)
                                  ]),
                                ),
                              ),
                              PopupMenuItem(
                                child: GestureDetector(
                                  onTap: () async {
                                    await get();
                                    intention_data = intention_data
                                        .where((done) => done.done == "0")
                                        .toList();
                                    setState(() {
                                      Get.back();
                                    });
                                  },
                                  child: Row(children: [
                                    Container(
                                      height: 9,
                                      width: 9,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kwhite,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 7.0,
                                      ),
                                      child: Text(
                                        "In-Complete",
                                        style: TextStyle(
                                          fontFamily: "Rene Bieder",
                                          color: kwhite,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w500,
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

                    //////////////////////////////////////////////              End               //////////////////////////////////
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: height1 * 0.5,
                    width: width1,
                    //color: Colors.yellow,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: intention_data.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (conext, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 1,
                                width: width1 * 0.9,
                                color: kblue_1,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: height1 * 0.0, top: height1 * 0.0),
                                child: Container(
                                  height: 70,
                                  //color: Colors.green,
                                  width: width1 * 0.95,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(intention_data[index].male),
                                      Padding(
                                        padding: EdgeInsets.only(right: 7),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              getdate(
                                                  intention_data[index].date),
                                              style: TextStyle(
                                                color: kblue_1,
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              width: width1 * 0.02,
                                            ),
                                            intention_data[index].done == "0"
                                                ? Icon(
                                                    Icons.cancel,
                                                    color: kblue_1,
                                                  )
                                                : Icon(
                                                    Icons.check,
                                                    color: kblue_1,
                                                  )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
