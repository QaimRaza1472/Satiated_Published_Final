import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:satiated_life/Models/dbHelper.dart';
import 'package:satiated_life/Models/intensions.dart';
import 'Alert Dialog/start_skip_dialog.dart';
import 'Animation/FadeAnimation.dart';
import 'Models/logdetails.dart';
import 'Models/previousintension.dart';



import 'Screens/count_down.dart';
import 'Screens/dashboard.dart';
import 'Screens/dietary_and_health.dart';
import 'Screens/scheduled_intention.dart';
import 'Screens/login_page.dart';
import 'Screens/weekly_feeling.dart';
import 'Sync.dart';
import 'Theme/color.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
 // WidgetsFlutterBinding.ensureInitialized();
  Timer timer = Timer.periodic(Duration(minutes: 1), (Timer t) => callbackDispatcher());
  Workmanager.initialize(callbackDispatcher);
  // Periodic task registration
  Workmanager.registerPeriodicTask(
    "2",
    "simplePeriodicTask",
    frequency: Duration(minutes: 15),
  );
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}




void callbackDispatcher() {
  Workmanager.executeTask((task, inputData) async {
    // initialise the plugin of flutterlocalnotifications.
    DbHelper db = new DbHelper();

    await notifieddata();

    return Future.value(true);
  });
}

notifieddata() async {
  List<IntensionsGET> intention_data;
  DbHelper daysdb = new DbHelper();
  String day = DateFormat('EEEE').format(DateTime.now());
  intention_data = await daysdb.getIntensions();

  for (var item in intention_data) {
    if (item.sunday == "1" && day == "Sunday") {
      DateTime date = DateFormat.jm().parse(item.fromtime);
      final myString = DateFormat("HH:mm").format(date);
      int databasefromtime = int.parse(myString.replaceAll(RegExp(':'), ''));
      int finaltime = databasefromtime - int.parse(item.prenotification);

      DateTime now = DateTime.now();
      String nowtime = DateFormat.jm().format(DateTime.parse(now.toString()));
      DateTime date2 = DateFormat.jm().parse(nowtime);
      final myString2 = DateFormat("HH:mm").format(date2);
      int nowdatetime = int.parse(myString2.replaceAll(RegExp(':'), ''));
      List<IntensionsGET> inten = await daysdb.getIntensions();
      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat('yyyy-MM-dd');
      final String istodaynoficationbeforetime = formatter1.format(now1);

      for (var items in inten) {
        if (items.istodaynoficationbeforetime == istodaynoficationbeforetime) {
        } else {
          if (finaltime <= nowdatetime) {
            var now = new DateTime.now();
            var formatter = new DateFormat('dd-MM-yyyy');
            String formattedDate = formatter.format(now);
            List intentiondatadone =
            await daysdb.getPreviousIntensionsForNotification(
                item.intensiontitle, formattedDate);
            if (intentiondatadone.isEmpty) {
              FlutterLocalNotificationsPlugin flip =
              new FlutterLocalNotificationsPlugin();

              // app_icon needs to be a added as a drawable
              // resource to the Android head project.
              var android =
              new AndroidInitializationSettings('@mipmap/ic_launcher');
              var IOS = new IOSInitializationSettings();

              // initialise settings for both Android and iOS device.
              var settings = new InitializationSettings(android, IOS);
              flip.initialize(settings);
              await _showNotificationWithDefaultSound(
                  flip, item.intensiontitle);

              final list = Previousintensions(item.intensiontitle,
                  formattedDate, item.fromtime, item.totime, '0', item.userid);

              await daysdb.insertPreviousIntension(list);
            }
          }
        }
      }
    }

    if (item.monday == "1" && day == "Monday") {
      DateTime date = DateFormat.jm().parse(item.fromtime);
      final myString = DateFormat("HH:mm").format(date);
      int databasefromtime = int.parse(myString.replaceAll(RegExp(':'), ''));
      int finaltime = databasefromtime - int.parse(item.prenotification);

      DateTime now = DateTime.now();
      String nowtime = DateFormat.jm().format(DateTime.parse(now.toString()));
      DateTime date2 = DateFormat.jm().parse(nowtime);
      final myString2 = DateFormat("HH:mm").format(date2);
      int nowdatetime = int.parse(myString2.replaceAll(RegExp(':'), ''));

      List<IntensionsGET> inten = await daysdb.getIntensions();
      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat('yyyy-MM-dd');
      final String istodaynoficationbeforetime = formatter1.format(now1);

      for (var items in inten) {
        if (items.istodaynoficationbeforetime == istodaynoficationbeforetime) {
        } else {
          if (finaltime <= nowdatetime) {
            var now = new DateTime.now();
            var formatter = new DateFormat('dd-MM-yyyy');
            String formattedDate = formatter.format(now);
            List intentiondatadone =
            await daysdb.getPreviousIntensionsForNotification(
                item.intensiontitle, formattedDate);
            if (intentiondatadone.isEmpty) {
              FlutterLocalNotificationsPlugin flip =
              new FlutterLocalNotificationsPlugin();

              // app_icon needs to be a added as a drawable
              // resource to the Android head project.
              var android =
              new AndroidInitializationSettings('@mipmap/ic_launcher');
              var IOS = new IOSInitializationSettings();

              // initialise settings for both Android and iOS device.
              var settings = new InitializationSettings(android, IOS);
              flip.initialize(settings);
              await _showNotificationWithDefaultSound(
                  flip, item.intensiontitle);

              final list = Previousintensions(item.intensiontitle,
                  formattedDate, item.fromtime, item.totime, '0', item.userid);

              await daysdb.insertPreviousIntension(list);
            }
          }
        }
      }
    }
    if (item.tuesday == "1" && day == "Tuesday") {
      DateTime date = DateFormat.jm().parse(item.fromtime);
      final myString = DateFormat("HH:mm").format(date);
      int databasefromtime = int.parse(myString.replaceAll(RegExp(':'), ''));
      int finaltime = databasefromtime - int.parse(item.prenotification);

      DateTime now = DateTime.now();
      String nowtime = DateFormat.jm().format(DateTime.parse(now.toString()));
      DateTime date2 = DateFormat.jm().parse(nowtime);
      final myString2 = DateFormat("HH:mm").format(date2);
      int nowdatetime = int.parse(myString2.replaceAll(RegExp(':'), ''));

      List<IntensionsGET> inten = await daysdb.getIntensions();
      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat('yyyy-MM-dd');
      final String istodaynoficationbeforetime = formatter1.format(now1);

      for (var items in inten) {
        if (items.istodaynoficationbeforetime == istodaynoficationbeforetime) {
        } else {
          if (finaltime <= nowdatetime) {
            var now = new DateTime.now();
            var formatter = new DateFormat('dd-MM-yyyy');
            String formattedDate = formatter.format(now);
            List intentiondatadone =
            await daysdb.getPreviousIntensionsForNotification(
                item.intensiontitle, formattedDate);
            if (intentiondatadone.isEmpty) {
              FlutterLocalNotificationsPlugin flip =
              new FlutterLocalNotificationsPlugin();

              // app_icon needs to be a added as a drawable
              // resource to the Android head project.
              var android =
              new AndroidInitializationSettings('@mipmap/ic_launcher');
              var IOS = new IOSInitializationSettings();

              // initialise settings for both Android and iOS device.
              var settings = new InitializationSettings(android, IOS);
              flip.initialize(settings);
              await _showNotificationWithDefaultSound(
                  flip, item.intensiontitle);

              final list = Previousintensions(item.intensiontitle,
                  formattedDate, item.fromtime, item.totime, '0', item.userid);

              await daysdb.insertPreviousIntension(list);
            }
          }
        }
      }
    }
    if (item.wednesday == "1" && day == "Wednesday") {
      DateTime date = DateFormat.jm().parse(item.fromtime);
      final myString = DateFormat("HH:mm").format(date);
      int databasefromtime = int.parse(myString.replaceAll(RegExp(':'), ''));
      int finaltime = databasefromtime - int.parse(item.prenotification);

      DateTime now = DateTime.now();
      String nowtime = DateFormat.jm().format(DateTime.parse(now.toString()));
      DateTime date2 = DateFormat.jm().parse(nowtime);
      final myString2 = DateFormat("HH:mm").format(date2);
      int nowdatetime = int.parse(myString2.replaceAll(RegExp(':'), ''));

      List<IntensionsGET> inten = await daysdb.getIntensions();
      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat('yyyy-MM-dd');
      final String istodaynoficationbeforetime = formatter1.format(now1);

      for (var items in inten) {
        if (items.istodaynoficationbeforetime == istodaynoficationbeforetime) {
        } else {
          if (finaltime <= nowdatetime) {
            var now = new DateTime.now();
            var formatter = new DateFormat('dd-MM-yyyy');
            String formattedDate = formatter.format(now);
            List intentiondatadone =
            await daysdb.getPreviousIntensionsForNotification(
                item.intensiontitle, formattedDate);
            if (intentiondatadone.isEmpty) {
              FlutterLocalNotificationsPlugin flip =
              new FlutterLocalNotificationsPlugin();

              // app_icon needs to be a added as a drawable
              // resource to the Android head project.
              var android =
              new AndroidInitializationSettings('@mipmap/ic_launcher');
              var IOS = new IOSInitializationSettings();

              // initialise settings for both Android and iOS device.
              var settings = new InitializationSettings(android, IOS);
              flip.initialize(settings);
              await _showNotificationWithDefaultSound(
                  flip, item.intensiontitle);

              final list = Previousintensions(item.intensiontitle,
                  formattedDate, item.fromtime, item.totime, '0', item.userid);

              await daysdb.insertPreviousIntension(list);
            }
          }
        }
      }
    }

    if (item.thursday == "1" && day == "Thursday") {
      DateTime date = DateFormat.jm().parse(item.fromtime);
      final myString = DateFormat("HH:mm").format(date);
      int databasefromtime = int.parse(myString.replaceAll(RegExp(':'), ''));
      int finaltime = databasefromtime - int.parse(item.prenotification);

      DateTime now = DateTime.now();
      String nowtime = DateFormat.jm().format(DateTime.parse(now.toString()));
      DateTime date2 = DateFormat.jm().parse(nowtime);
      final myString2 = DateFormat("HH:mm").format(date2);
      int nowdatetime = int.parse(myString2.replaceAll(RegExp(':'), ''));

      List<IntensionsGET> inten = await daysdb.getIntensions();
      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat('yyyy-MM-dd');
      final String istodaynoficationbeforetime = formatter1.format(now1);

      for (var items in inten) {
        if (items.istodaynoficationbeforetime == istodaynoficationbeforetime) {
        } else {
          if (finaltime <= nowdatetime) {
            var now = new DateTime.now();
            var formatter = new DateFormat('dd-MM-yyyy');
            String formattedDate = formatter.format(now);
            List intentiondatadone =
            await daysdb.getPreviousIntensionsForNotification(
                item.intensiontitle, formattedDate);
            if (intentiondatadone.isEmpty) {
              FlutterLocalNotificationsPlugin flip =
              new FlutterLocalNotificationsPlugin();

              // app_icon needs to be a added as a drawable
              // resource to the Android head project.
              var android =
              new AndroidInitializationSettings('@mipmap/ic_launcher');
              var IOS = new IOSInitializationSettings();

              // initialise settings for both Android and iOS device.
              var settings = new InitializationSettings(android, IOS);
              flip.initialize(settings);
              await _showNotificationWithDefaultSound(
                  flip, item.intensiontitle);

              final list = Previousintensions(item.intensiontitle,
                  formattedDate, item.fromtime, item.totime, '0', item.userid);

              await daysdb.insertPreviousIntension(list);
            }
          }
        }
      }
    }

    if (item.friday == "1" && day == "Friday") {
      DateTime date = DateFormat.jm().parse(item.fromtime);
      final myString = DateFormat("HH:mm").format(date);
      int databasefromtime = int.parse(myString.replaceAll(RegExp(':'), ''));
      int finaltime = databasefromtime - int.parse(item.prenotification);

      DateTime now = DateTime.now();
      String nowtime = DateFormat.jm().format(DateTime.parse(now.toString()));
      DateTime date2 = DateFormat.jm().parse(nowtime);
      final myString2 = DateFormat("HH:mm").format(date2);
      int nowdatetime = int.parse(myString2.replaceAll(RegExp(':'), ''));

      List<IntensionsGET> inten = await daysdb.getIntensions();
      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat('yyyy-MM-dd');
      final String istodaynoficationbeforetime = formatter1.format(now1);

      for (var items in inten) {
        if (items.istodaynoficationbeforetime == istodaynoficationbeforetime) {
        } else {
          if (finaltime <= nowdatetime) {
            var now = new DateTime.now();
            var formatter = new DateFormat('dd-MM-yyyy');
            String formattedDate = formatter.format(now);
            List intentiondatadone =
            await daysdb.getPreviousIntensionsForNotification(
                item.intensiontitle, formattedDate);
            if (intentiondatadone.isEmpty) {
              FlutterLocalNotificationsPlugin flip =
              new FlutterLocalNotificationsPlugin();

              // app_icon needs to be a added as a drawable
              // resource to the Android head project.
              var android =
              new AndroidInitializationSettings('@mipmap/ic_launcher');
              var IOS = new IOSInitializationSettings();

              // initialise settings for both Android and iOS device.
              var settings = new InitializationSettings(android, IOS);
              flip.initialize(settings);
              await _showNotificationWithDefaultSound(
                  flip, item.intensiontitle);

              final list = Previousintensions(item.intensiontitle,
                  formattedDate, item.fromtime, item.totime, '0', item.userid);

              await daysdb.insertPreviousIntension(list);
            }
          }
        }
      }
    }

    if (item.saturday == "1" && day == "Saturday") {
      DateTime date = DateFormat.jm().parse(item.fromtime);
      final myString = DateFormat("HH:mm").format(date);
      int databasefromtime = int.parse(myString.replaceAll(RegExp(':'), ''));
      int finaltime = databasefromtime - int.parse(item.prenotification);

      DateTime now = DateTime.now();
      String nowtime = DateFormat.jm().format(DateTime.parse(now.toString()));
      DateTime date2 = DateFormat.jm().parse(nowtime);
      final myString2 = DateFormat("HH:mm").format(date2);
      int nowdatetime = int.parse(myString2.replaceAll(RegExp(':'), ''));
      List<IntensionsGET> inten = await daysdb.getIntensions();
      final DateTime now1 = DateTime.now();
      final DateFormat formatter1 = DateFormat('yyyy-MM-dd');
      final String istodaynoficationbeforetime = formatter1.format(now1);

      for (var items in inten) {
        if (items.istodaynoficationbeforetime == istodaynoficationbeforetime) {
        } else {
          if (finaltime <= nowdatetime) {
            var now = new DateTime.now();
            var formatter = new DateFormat('dd-MM-yyyy');
            String formattedDate = formatter.format(now);
            List intentiondatadone =
            await daysdb.getPreviousIntensionsForNotification(
                item.intensiontitle, formattedDate);
            if (intentiondatadone.isEmpty) {
              FlutterLocalNotificationsPlugin flip =
              new FlutterLocalNotificationsPlugin();

              // app_icon needs to be a added as a drawable
              // resource to the Android head project.
              var android =
              new AndroidInitializationSettings('@mipmap/ic_launcher');
              var IOS = new IOSInitializationSettings();

              // initialise settings for both Android and iOS device.
              var settings = new InitializationSettings(android, IOS);
              flip.initialize(settings);
              await _showNotificationWithDefaultSound(
                  flip, item.intensiontitle);

              final list = Previousintensions(item.intensiontitle,
                  formattedDate, item.fromtime, item.totime, '0', item.userid);

              await daysdb.insertPreviousIntension(list);
            }
          }
        }
      }
    }
  }
}

Future _showNotificationWithDefaultSound(flip, String title) async {
  // Show a notification after every 15 minute with the first
  // appearance happening a minute after invoking the method
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      importance: Importance.Max, priority: Priority.High);
  var iOSPlatformChannelSpecifics = new IOSNotificationDetails();

  // initialise channel platform for both Android and iOS device.
  var platformChannelSpecifics = new NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flip.show(0, '$title', 'Your task on ahead', platformChannelSpecifics,
      payload: 'Default_Sound');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Satiated Life",
      color: kblue_1,
      debugShowCheckedModeBanner: false,
      routes: {
        //'/dashboard': (context) => Dashboard(),
        // '/alert_1': (context) => StartSkip(),
        //'/dietary': (context) => DietaryAndHealth(),
        // '/weekly_feelings': (context) => WeeklyFeelings(),
        //'/count_down': (context) => CountDown(),
        '/login_page': (context) => LoginPage(),
        // '/intention': (context) => ScheduledIntention(),
        //'/alert_1': (context) => StartSkip(),
      },
      home: SplashScreen(),
    );
  }
}




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var logs;
  Future<void> get() async {
    DbHelper daysdb = new DbHelper();
    logs = await daysdb.getLogs();
  }

  @override
  void initState() {
    super.initState();
    get();
    Timer(Duration(seconds: 4), finished);
  }

  Future<void> finished() async {
    // Navigator.pushNamed(context,'/dashboard');
    // Navigator.pushNamed(context,'/alert_1');

    //Navigator.pushNamed(context,'/dietary');
    // Navigator.pushNamed(context,'/weekly_feelings');
    //Navigator.pushNamed(context,'/count_down');

    List<LogsDetail> logList;
    try {
      print(logs[0].userid);
      if (logs.length != 0) {
        try {
          Syncronization sn = new Syncronization();
          sn.postdatatointernet(logs[0].userid).then((String value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Dashboard(logs[0].userid, "0")),
            );
          });
        } catch (e) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Dashboard(logs[0].userid, "0")),
          );
        }
      } else {
        Navigator.pushNamed(context, '/login_page');
      }
    } catch (Exception) {
      Navigator.pushNamed(context, '/login_page');
    }

    //Navigator.pushNamed(context,'/bottom_bar');

    // Navigator.pushNamed(context,'/intention');

    //For Qaim
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => Dashboard("qaimjee@gmail.com", "0")),
    // );
  }

  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height;
    var width1 = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kblue_1,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height1 * 0.04,
              ),
              FadeAnimation(
                1.2,
                Image.asset('assets/images/logo.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
