import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:satiated_life/Theme/color.dart';
import '../weekly_feeling.dart';
import 'intention_tab.dart';
import 'meditation_tab.dart';

class JournalPage extends StatefulWidget {
  final String uid;
  JournalPage(this.uid);
  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;

    List image = [
      "assets/acadmy.jpg",
      "assets/event.jpg",
      "assets/menu.jpg",
      "assets/acadmy.jpg",
      "assets/event.jpg",
      "assets/menu.jpg"
    ];
    List title = [
      "OCEAN BEAUTY",
      "80's CONCERT",
      "OCEAN BEAUTY",
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 38,
        backgroundColor: kblue_1,
        elevation: 0,
      ),
      key: scaffoldKey,
      backgroundColor: kblue_1,
      body: Container(
        height: height1,
        width: width1,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: height1 * 0.09,
              ),
              Text(
                "Journal Page",
                style: TextStyle(
                  fontFamily: "Rene Bieder",
                  color: kwhite,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: height1 * 0.017,
              ),
              Container(
                ///height: height1 * 0.17,
                height: 95,
                width: width1 * 0.95,
                decoration: BoxDecoration(
                  color: kblue_1,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: kwhite,
                    width: 1,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "How You are Feeling Today?",
                      style: TextStyle(
                        color: kwhite,
                        fontSize: 17,
                        fontFamily: "Rene Bieder",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WeeklyFeelings(widget.uid)),
                        );
                      },
                      child: Container(
                        height: 41,
                        width: 75,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kwhite,
                          ),
                          color: kblue_1,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'View',
                            style: TextStyle(
                              color: kwhite,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 1.0,
                              fontFamily: "Rene Bieder",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height1 * 0.03,
              ),
              Text(
                "Tracking History",
                style: TextStyle(
                  fontFamily: "Rene Bieder",
                  color: kwhite,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: height1 * 0.017,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TabBar(
                    physics: BouncingScrollPhysics(),
                    unselectedLabelColor: kwhite,
                    labelColor: kblue_1,
                    controller: _tabcontroller,
                    labelStyle: TextStyle(
                      //color: kwhite,
                      color: kblue_1,
                      fontSize: 21,
                    ),
                    indicator: BoxDecoration(
                      color: kwhite,
                      //color:kred,

                      /*  borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),*/
                      //border: Border.all(color: kred,)
                    ),
                    tabs: [
                      Tab(
                        text: "Meditation",
                      ),
                      Tab(
                        text: "Intentions",
                      ),
                    ]),
              ),

              //SizedBox(height: 12,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  height: height1 * 0.62,
                  child: TabBarView(
                    physics: BouncingScrollPhysics(),
                    controller: _tabcontroller,
                    children: [
                      MeditationTab(),
                      IntentionTab(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget eventButton(String title) {
  return Container(
    height: 50,
    width: 180,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: kred,
    ),
    child: Center(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 21,
          color: kwhite,
        ),
      ),
    ),
  );
}
