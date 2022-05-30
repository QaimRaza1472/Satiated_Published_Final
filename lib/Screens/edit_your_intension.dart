import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:satiated_life/Animation/FadeAnimation.dart';
import 'package:satiated_life/Models/dbHelper.dart';
import 'package:satiated_life/Screens/scheduled_intention.dart';
import 'package:satiated_life/Screens/task_wheel.dart';
import 'package:satiated_life/Theme/color.dart';
import 'package:get/get.dart';
import 'package:satiated_life/Models/intensions.dart';

import 'add_your_busy_hours.dart';

class EditYourIntention extends StatefulWidget {
  final int intid;
  final String uid;
  final String title;
  final String discription;
  final String fromtime;
  final String totime;
  final String sun;
  final String mon;
  final String tue;
  final String wed;
  final String thurs;
  final String fri;
  final String sat;
  final String prenot;
  final String wheelhead;

  EditYourIntention(
      this.intid,
      this.uid,
      this.title,
      this.discription,
      this.fromtime,
      this.totime,
      this.sun,
      this.mon,
      this.tue,
      this.wed,
      this.thurs,
      this.fri,
      this.sat,
      this.prenot,
      this.wheelhead);
  @override
  _EditYourIntentionState createState() => _EditYourIntentionState();
}

class _EditYourIntentionState extends State<EditYourIntention> {
  String getDescription(String head) {
    if (head == 'Spirituality') {
      return 'Spirituality ie go to church from Sunday 9-10 am';
    } else if (head == 'Artistic') {
      return 'Artistic - ie take an acting class Tuesdays 6-8pm';
    } else if (head == 'Therapy') {
      return 'Therapy- ie get a massage  Saturday 9-10 am';
    } else if (head == 'Inspiration') {
      return 'Inspiration- ie wake up every morning to journal 6-6.30 am';
    } else if (head == 'Activity') {
      return 'Activity- ie go to spin class Monday’s, Wednesday’s and Friday’s  9-10 am';
    } else if (head == 'Tranquility') {
      return 'Tranquility- ie take an epsom salt bath with lavender after work on friday’s 6-7 pm';
    } else if (head == 'Emotional') {
      return 'Emotional- ie 1x per month on Monday session with therapist 6-7pm';
    } else if (head == 'Dietary and health') {
      return 'Diet and Nutrition- ie try to mindfully eat breakfast every day 7-7.45am';
    } else if (head == 'Love and laughter') {
      return 'Love and Laughter- ie schedule a romantic getaway for boyfriends birthday friday Feb 14 at 9 am Feb 17th at 9 pm';
    } else if (head == 'Intellectual') {
      return 'Intellectual - ie sign up for French lessons Wednesday’s 6-8 pm';
    } else if (head == 'Fun') {
      return 'Fun- ie go to the amusement park on  Saturday March 15 9am-5pm';
    } else if (head == 'Environmental') {
      return 'Environment- ie carpool to work every week day 8.30am';
    }
  }

  int sun = 0;
  int mon = 0;
  int tue = 0;
  int wed = 0;
  int thurs = 0;
  int fri = 0;
  int sat = 0;
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

  List days = [
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];

  List min = [
    "15",
    "30",
    "45",
    "60",
  ];
  final titleController = TextEditingController();
  final discriptionController = TextEditingController();

  String _fromTime = '8:00 AM';
  String _toTime = '6:00 PM';

  // bool isRememberMe = false;
  String minVal = "";

  int selected;
  int min_selected;

  /// Database uses
  DbHelper helper = DbHelper();
  void insertintensions(
      String intensiontitle,
      String discription,
      String from,
      String to,
      String su,
      String mo,
      String tu,
      String we,
      String thr,
      String fr,
      String sa,
      String prenotification,
      String uid,
      String wheelhead) async {
    DateTime now = DateTime.now();
    String nowtime = DateFormat.jm().format(DateTime.parse(now.toString()));
    DateTime date2 = DateFormat.jm().parse(nowtime);
    final myString2 = DateFormat("HH:mm").format(date2);
    int databasefromtime2 = int.parse(myString2.replaceAll(RegExp(':'), '')); //

    DateTime date = DateFormat.jm().parse(from);
    final myString = DateFormat("HH:mm").format(date);
    int databasefromtime = int.parse(myString.replaceAll(RegExp(':'), '')); //

    String istodaynoficationbeforetime = "E";
    if (databasefromtime2 > databasefromtime) {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      istodaynoficationbeforetime = formatted;
    }
    final list = Intensions(
        intensiontitle,
        discription,
        from,
        to,
        su,
        mo,
        tu,
        we,
        thr,
        fr,
        sa,
        prenotification,
        uid,
        wheelhead,
        istodaynoficationbeforetime);
    await helper.insertIntensions(list);
  }

  var busy_data;
  Future<void> get() async {
    DbHelper daysdb = new DbHelper();
    busy_data = await daysdb.getbusyhours();
    setState(() {});
  }

  var intention_data;
  Future<void> getIntension() async {
    DbHelper daysdb = new DbHelper();
    intention_data = await daysdb.getIntensions();
    setState(() {});
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

  bool checkAlreadyDataOnBusyHour() {
    for (var item in busy_data) {
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

  bool validate() {
    if ((sun == 1 ||
            mon == 1 ||
            tue == 1 ||
            wed == 1 ||
            thurs == 1 ||
            fri == 1 ||
            sat == 1) &&
        titleController.text != "" &&
        discriptionController.text != "" &&
        minVal != "") {
      return true;
    }
    return false;
  }

  Reset() {
    titleController.text = "";
    discriptionController.text = "";

    _fromTime = '7:00 AM';
    _toTime = '7:00 PM';
    sun = 0;
    mon = 0;
    tue = 0;
    wed = 0;
    thurs = 0;
    fri = 0;
    sat = 0;

    selected = 0;

    setState(() {});
  }

//   bool checkAlreadyDataOnBusyHour() {
//     for (var item in busy_data) {
//       DateTime date = DateFormat.jm().parse(item.fromtime);
//       DateTime date2 = DateFormat("hh:mm a").parse(item.totime);
//       DateTime date3 = DateFormat.jm().parse(_fromTime);
//       DateTime date4 = DateFormat("hh:mm a").parse(_toTime);

// // format date
//       print(DateFormat("HH:mm").format(date));
//       print(DateFormat("HH:mm").format(date2));
//       final myString = DateFormat("HH:mm").format(date);
//       final myString2 = DateFormat("HH:mm").format(date2);
//       final myString3 = DateFormat("HH:mm").format(date3);
//       final myString4 = DateFormat("HH:mm").format(date4);

//       int databasefromtime = int.parse(myString.replaceAll(RegExp(':'), '')); //
//       int databasetotime = int.parse(myString2.replaceAll(RegExp(':'), '')); //
//       int runtimefromtime = int.parse(myString3.replaceAll(RegExp(':'), '')); //
//       int runtimetotime = int.parse(myString4.replaceAll(RegExp(':'), '')); //
//       print(databasefromtime);
//       print(databasetotime);
//       print(runtimefromtime);
//       print(runtimetotime);

//       if (databasefromtime <= runtimefromtime &&
//           runtimefromtime <= databasetotime) {
//         return true;
//       } else if (databasefromtime <= runtimetotime &&
//           runtimetotime <= databasetotime) {
//         return true;
//       }
//     }
//     return false;
//   }

//   bool checkAlreadyData() {
//     for (var item in intention_data) {
//       DateTime date = DateFormat.jm().parse(item.fromtime);
//       DateTime date2 = DateFormat("hh:mm a").parse(item.totime);
//       DateTime date3 = DateFormat.jm().parse(_fromTime);
//       DateTime date4 = DateFormat("hh:mm a").parse(_toTime);

// // format date
//       print(DateFormat("HH:mm").format(date));
//       print(DateFormat("HH:mm").format(date2));
//       final myString = DateFormat("HH:mm").format(date);
//       final myString2 = DateFormat("HH:mm").format(date2);
//       final myString3 = DateFormat("HH:mm").format(date3);
//       final myString4 = DateFormat("HH:mm").format(date4);

//       int databasefromtime = int.parse(myString.replaceAll(RegExp(':'), '')); //
//       int databasetotime = int.parse(myString2.replaceAll(RegExp(':'), '')); //
//       int runtimefromtime = int.parse(myString3.replaceAll(RegExp(':'), '')); //
//       int runtimetotime = int.parse(myString4.replaceAll(RegExp(':'), '')); //
//       print(databasefromtime);
//       print(databasetotime);
//       print(runtimefromtime);
//       print(runtimetotime);

//       if (databasefromtime <= runtimefromtime &&
//           runtimefromtime <= databasetotime) {
//         return true;
//       } else if (databasefromtime <= runtimetotime &&
//           runtimetotime <= databasetotime) {
//         return true;
//       }
//     }
//     return false;
//   }
  void del() async {
    DbHelper db = new DbHelper();
    db.deleteIntensions(widget.intid);
  }

  String txtLength = "0";
  @override
  void initState() {
    del();
    super.initState();
    sun = int.parse(widget.sun);
    mon = int.parse(widget.mon);
    tue = int.parse(widget.tue);
    wed = int.parse(widget.wed);
    thurs = int.parse(widget.thurs);
    fri = int.parse(widget.fri);
    sat = int.parse(widget.sat);
    titleController.text = widget.title;
    txtLength = widget.title.length.toString();
    discriptionController.text = widget.discription;
    _fromTime = widget.fromtime;
    _toTime = widget.totime;
    minVal = widget.prenot;
    if (widget.prenot == "15") {
      min_selected = 0;
    } else if (widget.prenot == "30") {
      min_selected = 1;
    } else if (widget.prenot == "45") {
      min_selected = 2;
    } else if (widget.prenot == "60") {
      min_selected = 3;
    }
    get();
    getIntension();
  }

  _filesDialogbusyhour(BuildContext context, String eventName) {
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
                            SizedBox(width: 120),

                            Image.asset(
                              "assets/attention.png",
                              scale: 10,
                            ),
                            SizedBox(width: 90),

                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: 18.0),
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
                            // SizedBox(height: 15),
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
                                  Get.to(BusyHours(widget.uid));
                                },
                                child: Container(
                                  height: 40,
                                  width: 180,
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
                                        "Adjust Schedule",
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
  //                     SizedBox(height: 90),
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

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 38,
          backgroundColor: kblue_1,
          elevation: 0,
        ),
        body: WillPopScope(
      onWillPop: () async {
        await insertintensions(
            widget.title,
            widget.discription,
            widget.fromtime,
            widget.totime,
            widget.sun,
            widget.mon,
            widget.tue,
            widget.wed,
            widget.thurs,
            widget.fri,
            widget.sat,
            widget.prenot,
            widget.uid,
            widget.wheelhead);

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ScheduledIntention("d", widget.uid)),
        );

        return true;
      },
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                  padding: EdgeInsets.only(top: width1 * 0.0),
                  child: Column(
                    children: [
                      FadeAnimation(
                        1,
                        Text(
                          widget.wheelhead,
                          style: TextStyle(
                            fontFamily: "Rene Bieder",
                            color: kwhite,
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: width1 * 0.0),
                  child: Column(
                    children: [
                      FadeAnimation(
                        1,
                        Text(
                          "Edit Your Intention",
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

                Column(
                  children: [
                    /////////////////////////////////////////////////////////    Task Name  Field  //////////////////////////////////////////
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
                            controller: titleController,
                            onChanged: (String value) async {
                              setState(() {
                                txtLength = value.length.toString();
                              });
                            },
                            cursorColor: kwhite,
                            style: TextStyle(
                              fontSize: 16,
                              color: kwhite,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Rene Bieder",
                            ),
                            maxLines: 8,
                            decoration: InputDecoration.collapsed(
                              hintText: "Intention title",
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
                      padding: EdgeInsets.only(right: width1 * 0.07, top: 5),
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
                    /////////////////////////////////////////////////////////    Task Name  Field  End      //////////////////////////////////////////

                    ///////////////////////////////////////////////////////////   Description Container   ////////////////////////////////////
                    // SizedBox(
                    //   height: width1 * 0.05,
                    // ),
                    Container(
                      width: width1 * 0.9,
                      height: 100,
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
                          controller: discriptionController,
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
                            hintText: getDescription(widget.wheelhead),
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
                    ///////////////////////////////////////////////////////////   Description Container End    ////////////////////////////////////

                    //////////////////////////////////////////////////////////   Select Time  Container  /////////////////////////
                    SizedBox(
                      height: width1 * 0.05,
                    ),
                    Container(
                      height: width1 * 0.86,
                      width: width1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              /////////////////////////////////////////////////////     From Time       ////////////////////////////////////////
                              Column(
                                children: [
                                  FadeAnimation(
                                    1.3,
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
                                      _fromTimePicker(context);
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
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
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: FadeAnimation(
                                          1.4,
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
                                    1.3,
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
                                      _toTimePicker(context);
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 110,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
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
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                        child: FadeAnimation(
                                          1.4,
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
                            padding: EdgeInsets.only(left: width1 * 0.02),
                            height: 50,
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: days.length,
                                itemBuilder: (conext, index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(7, 5, 0, 5),
                                    child: GestureDetector(
                                      onTap: () async {
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
                                        await get();
                                        await getIntension();
                                      },
                                      child: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          color:
                                              getday(index) ? kwhite : kblue_1,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: kwhite,
                                          ),
                                        ),
                                        child: Center(
                                          child: FadeAnimation(
                                            1.5,
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

                          SizedBox(
                            height: 12,
                          ),

                          ///////////////////////////////////////////////////////////   Checkbox Code  ///////////////////////////////////////////
                          // Padding(
                          //   padding:
                          //       EdgeInsets.symmetric(horizontal: width1 * 0.05),
                          //   child: FadeAnimation(
                          //     1.6,
                          //     Row(
                          //       mainAxisAlignment:
                          //           MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Text(
                          //           "Continue Circle on every week",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.w500,
                          //             fontSize: 16,
                          //             color: kwhite,
                          //             fontFamily: "Rene Bieder",
                          //           ),
                          //         ),
                          //         Theme(
                          //           child: Checkbox(
                          //             value: isRememberMe,
                          //             onChanged: (bool value) {
                          //               setState(() {
                          //                 isRememberMe = value;
                          //               });
                          //             },
                          //           ),
                          //           data: ThemeData(
                          //               // checked color
                          //               primarySwatch: Colors.blue,
                          //               // border color
                          //               unselectedWidgetColor: Colors.white),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // ///////////////////////////////////////////////////////////   Checkbox Code End  ///////////////////////////////////////////

                          SizedBox(
                            height: 12,
                          ),
                          FadeAnimation(
                            1.7,
                            Text(
                              "Select Notification Time",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: kwhite,
                                fontFamily: "Rene Bieder",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ///////////////////////////////////////////////////////////   Min List        ///////////////////////////////////////////
                          Container(
                            height: 41,
                            width: width1,
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: min.length,
                                itemBuilder: (conext, index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(7, 5, 8, 5),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          min_selected = index;
                                          minVal = min[index];
                                        });
                                      },
                                      child: Container(
                                        width: 110,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: min_selected == index
                                              ? kwhite
                                              : kblue_1,
                                          border: Border.all(
                                            color: kwhite,
                                          ),
                                        ),
                                        child: FadeAnimation(
                                          1.8,
                                          Center(
                                            child: Text(
                                              min[index] + " Min",
                                              style: TextStyle(
                                                //color: Colors.grey,
                                                color: min_selected == index
                                                    ? kblue_1
                                                    : kwhite,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Rene Bieder",
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          ///////////////////////////////////////////////////////////   Min List Edn    ///////////////////////////////////////////
                        ],
                      ),
                    ),
                  ],
                ),

                ///////////////////////////////////////////////////////////   Save Button  ////////////////////////////////////
                GestureDetector(
                  onTap: () async {
                    print('hello');
                    if (checkAlreadyData() == true) {
                      _filesDialog(context,
                          "Intension Already Exist between selected time");
                    } else if (checkAlreadyDataOnBusyHour() == true) {
                      _filesDialogbusyhour(context, "Unable to schedule");
                    } else {
                      if (validate() == false) {
                        _filesDialog(context, "Please enter data correctly...");
                      } else {
                        await insertintensions(
                            titleController.text,
                            discriptionController.text,
                            _fromTime,
                            _toTime,
                            sun.toString(),
                            mon.toString(),
                            tue.toString(),
                            wed.toString(),
                            thurs.toString(),
                            fri.toString(),
                            sat.toString(),
                            minVal,
                            widget.uid,
                            widget.uid);
                        Reset();
                        Get.to(ScheduledIntention("d", widget.uid));
                      }
                    }
                  },
                  child: Container(
                    height: 47,
                    width: 190,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 0),
                      ),
                    ], borderRadius: BorderRadius.circular(7), color: kwhite),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeAnimation(
                          1.9,
                          Text(
                            "Edit",
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
                ///////////////////////////////////////////////////////////   Save Button  End   ////////////////////////////////////
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
