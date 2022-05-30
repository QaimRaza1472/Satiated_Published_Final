import 'dart:io';
import 'package:flutter/material.dart';
import 'package:satiated_life/Alert%20Dialog/alert_add_schedule.dart';
import 'package:satiated_life/Alert%20Dialog/alert_congratulation.dart';
import 'package:satiated_life/Animation/FadeAnimation.dart';
import 'package:satiated_life/Screens/select_meditation_with_voice.dart';
import 'package:satiated_life/Screens/task_wheel.dart';
import 'package:satiated_life/Screens/weekly_feeling.dart';
import 'package:satiated_life/Screens/your_score.dart';
import 'package:satiated_life/Sync.dart';
import 'package:satiated_life/Theme/color.dart';
import 'package:get/get.dart';
import '../main.dart';
import 'Journal/journal_page.dart';
import 'add_your_busy_hours.dart';
import 'female_meditation.dart';
import 'scheduled_intention.dart';
import 'male_meditation.dart';

class Dashboard extends StatefulWidget {
  final String uid;
  final String islogin;

  Dashboard(this.uid, this.islogin);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool load = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.islogin == "1") {
      Syncronization syncronization = new Syncronization();

      Syncronization sn = new Syncronization();
      try {
        syncronization.synndata(widget.uid).then((String value) {
          setState(() {
            load = true;
          });
        });
      } catch (e) {
        print(e);
        setState(() {
          load = true;
        });
      }
      setState(() {});
    } else {
      load = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;

    return Scaffold(
        body: WillPopScope(
      onWillPop: () {
        exit(0);
      }, // Empty Function.
      child: load == false
          ? Container(
              child: Center(
              child: CircularProgressIndicator(),
            ))
          : Container(
              height: height1,
              width: width1,
              color: kblue_1,
              child: Padding(
                //padding: EdgeInsets.only(top: width1 * 0.14),

                //padding: EdgeInsets.only(top: height1 * 0.1 - 10),
                padding: EdgeInsets.only(top: height1 * 0.032),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    /*         FadeAnimation(
                      1,
                      Text(
                        "Satiated Life",
                        style: TextStyle(
                          fontFamily: "Rene Bieder",
                          color: kwhite,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    */

                    Expanded(
                      child: Container(
                        child: Center(
                          child: FadeAnimation(
                            1,
                            GestureDetector(
                              onTap: () {
                                 Get.to(AlertAddSchedule());
                               // Get.to(AlertCongratulation());
                              },
                              child: Text(
                                "Satiated Life",
                                style: TextStyle(
                                  fontFamily: "Rene Bieder",
                                  color: kwhite,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          dashboard_item(
                            height1: height1,
                            width1: width1,
                            title: "Schedule",
                            colors: kpink,
                            route: 0,
                            dashboard_image: "assets/busy_hours.png",
                            uid: widget.uid,
                          ),
                          dashboard_item(
                            height1: height1,
                            width1: width1,
                            title: "Wheel Of Satiety",
                            colors: kblue_1,
                            route: 1,
                            dashboard_image: "assets/task_wheel.png",
                            uid: widget.uid,
                          ),
                          dashboard_item(
                            height1: height1,
                            width1: width1,
                            title: "Voice Meditation",
                            colors: kpink,
                            route: 2,
                            dashboard_image: "assets/femalesymbol.png",
                            uid: widget.uid,
                          ),
                          dashboard_item(
                            height1: height1,
                            width1: width1,
                            title: "Voice Meditation",
                            colors: kblue_1,
                            route: 3,
                            dashboard_image: "assets/malesymbol.png",
                            uid: widget.uid,
                          ),
                          dashboard_item(
                            height1: height1,
                            width1: width1,
                            title: "My Intentions",
                            colors: kpink,
                            route: 4,
                            dashboard_image: "assets/task_list.png",
                            uid: widget.uid,
                          ),
                          dashboard_item(
                            height1: height1,
                            width1: width1,
                            title: "Your Score",
                            colors: kblue_1,
                            route: 5,
                            dashboard_image: "assets/your_score.png",
                            uid: widget.uid,
                          ),
                          dashboard_item(
                            height1: height1,
                            width1: width1,
                            title: "Journal Page",
                            colors: kpink,
                            route: 6,
                            dashboard_image: "assets/journal.png",
                            uid: widget.uid,
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

class dashboard_item extends StatelessWidget {
  dashboard_item({
    Key key,
    @required this.height1,
    @required this.width1,
    @required this.title,
    @required this.colors,
    @required this.route,
    @required this.dashboard_image,
    @required this.uid,
  }) : super(key: key);
   final  double height1;
  final double width1;
  String title;
  Color colors;
  int route;
  var dashboard_image;
  final String uid;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => select_option(context, route),
      child: Container(
        height: width1 * 0.22,
        //height: 90,

        width: width1,
        color: colors,
        child: Padding(
          padding: EdgeInsets.only(left: width1 * 0.01),
          child: FadeAnimation(
            1.1,
            Row(
              children: [
                Image.asset(dashboard_image),
                SizedBox(
                  width: width1 * 0.01,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: "Rene Bieder",
                    color: kwhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    //decoration: TextDecoration.none
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> select_option(BuildContext context, int index) async {
    switch (index) {
      case 0:
        Get.to(BusyHours(uid));
        break;
      case 1:
        Get.to(TaskWheel(uid));
        break;

      case 2:
        Get.to(FemaleMeditation(uid, "Y", "", "0"));
        break;
      case 3:
        Get.to(MaleMeditation(uid, "Y", "", "0"));
        break;

      case 4:
        Get.to(ScheduledIntention("d", uid));
        break;
      case 5:
        Get.to(YourScore(uid));
        break;
      case 6:
        Get.to(JournalPage(uid));
        break;
    }
  }
}
