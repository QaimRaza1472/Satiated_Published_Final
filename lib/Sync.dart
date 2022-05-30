import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:satiated_life/Models/feelings.dart';
import 'package:satiated_life/Models/intensions.dart';
import 'package:satiated_life/Models/previousmeditation.dart';
import 'Models/busyhours.dart';
import 'Models/dbHelper.dart';
import 'Models/previousintension.dart';

class Syncronization {
  DbHelper db = new DbHelper();
  getFeelings(String uid) async {
    var url = Uri.parse(
        'https://interesting-bartik.66-165-248-146.plesk.page/api/BusyHour/Getfeelings?uid=$uid');
    var response = await http.get(url);
    var jsondata = jsonDecode(response.body);
    List<Feelings> feel = [];
    for (var item in jsondata) {
      Feelings fl =
          new Feelings(item['details'], item['submiton'], item['userid']);
      feel.add(fl);
    }
    for (var item in feel) {
      final list = Feelings(item.details, item.submiton, item.userid);
      await db.insertFeelings(list);
    }
  }




  getPreviousIntesnsion(String uid) async {
    var url = Uri.parse(
        'https://interesting-bartik.66-165-248-146.plesk.page/api/BusyHour/Getpreviousintension?uid=$uid');

    var response = await http.get(url);

    var jsondata = jsonDecode(response.body);
    List<Previousintensions> feel = [];
    for (var item in jsondata) {
      Previousintensions fl = new Previousintensions(
          item['intensiontitle'],
          item['date'],
          item['fromtime'],
          item['totime'],
          item['done'],
          item['userid']);
      feel.add(fl);
    }
    for (var item in feel) {
      final list = Previousintensions(item.intensiontitle, item.date,
          item.fromtime, item.totime, item.done, item.userid);
      await db.insertPreviousIntension(list);
    }
  }

  getPreviousmeditation(String uid) async {
    var url = Uri.parse(
        'https://interesting-bartik.66-165-248-146.plesk.page/api/BusyHour/Getpreviousmeditation?uid=$uid');

    var response = await http.get(url);

    var jsondata = jsonDecode(response.body);
    List<PreviousMeditation> feel = [];
    for (var item in jsondata) {
      PreviousMeditation fl = new PreviousMeditation(
          item['male'], item['date'], item['done'], item['userid']);
      feel.add(fl);
    }
    for (var item in feel) {
      final list =
          PreviousMeditation(item.male, item.date, item.done, item.userid);
      await db.insertPreviousmeditation(list);
    }
  }

  getbusyhour(String uid) async {
    var url = Uri.parse(
        'https://interesting-bartik.66-165-248-146.plesk.page/api/BusyHour/GetBusyHour?uid=$uid');

    var response = await http.get(url);

    var jsondata = jsonDecode(response.body);
    List<BusyHour> feel = [];
    for (var item in jsondata) {
      BusyHour fl = new BusyHour(
          item['busyreason'],
          item['fromtime'],
          item['totime'],
          item['sunday'],
          item['monday'],
          item['tuesday'],
          item['wednesday'],
          item['thursday'],
          item['friday'],
          item['saturday'],
          item['userid']);
      feel.add(fl);
    }
    for (var item in feel) {
      final list = BusyHour(
          item.busyreason,
          item.fromtime,
          item.totime,
          item.sunday,
          item.monday,
          item.tuesday,
          item.wednesday,
          item.thursday,
          item.friday,
          item.saturday,
          item.userid);
      await db.insertBusyHours(list);
    }
  }

  getIntension(String uid) async {
    var url = Uri.parse(
        'https://interesting-bartik.66-165-248-146.plesk.page/api/BusyHour/GetIntesnsion?uid=$uid');

    var response = await http.get(url);

    var jsondata = jsonDecode(response.body);
    List<Intensions> feel = [];
    for (var item in jsondata) {
      Intensions fl = new Intensions(
          item['intensiontitle'],
          item['discription'],
          item['fromtime'],
          item['totime'],
          item['sunday'],
          item['monday'],
          item['tuesday'],
          item['wednesday'],
          item['thursday'],
          item['friday'],
          item['saturday'],
          item['prenotification'],
          item['userid'],
          item['wheelhead'],
          item['istodaynoficationbeforetime']);
      feel.add(fl);
    }
    for (var item in feel) {
      final list = Intensions(
          item.intensiontitle,
          item.discription,
          item.fromtime,
          item.totime,
          item.sunday,
          item.monday,
          item.tuesday,
          item.wednesday,
          item.thursday,
          item.friday,
          item.saturday,
          item.prenotification,
          item.userid,
          item.wheelhead,
          item.istodaynoficationbeforetime);
      await db.insertIntensions(list);
    }
  }

  Future<String> synndata(String user) async {
    await getFeelings(user);
    await getIntension(user);
    await getbusyhour(user);
    await getPreviousIntesnsion(user);
    await getPreviousmeditation(user);
    return "Done";
  }

  deletefrominternet(String user) async {
    var url = Uri.parse(
        'https://interesting-bartik.66-165-248-146.plesk.page/api/BusyHour/DeleteDataByuid?uid=$user');
    var response = await http.post(url);
    print('Delete' + '$response');
  }

  insertbusyhour(
      String id,
      String busyreason,
      String ftime,
      String ttime,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday,
      String uid) async {
    var url = Uri.parse(
        'https://interesting-bartik.66-165-248-146.plesk.page/api/BusyHour/insertBusyHour?id=$id&busyreason=$busyreason&fromtime=$ftime&totime=$ttime&sunday=$sunday&monday=$monday&tuesday=$tuesday&wednesday=$wednesday&thursday=$thursday&friday=$friday&saturday=$saturday&uid=$uid');
    var response = await http.post(url);
    print('hello');

    print(response.toString());
  }

  insertintesnsion(
      String id,
      String intensiontitle,
      String discription,
      String ftime,
      String ttime,
      String sunday,
      String monday,
      String tuesday,
      String wednesday,
      String thursday,
      String friday,
      String saturday,
      String prenotification,
      String uid,
      String wheelhead,
      String istodaynoficationbeforetime) async {
    var url = Uri.parse(
        'https://interesting-bartik.66-165-248-146.plesk.page/api/BusyHour/insertintensions?id=$id&intensiontitle=$intensiontitle&discription=$discription&fromtime=$ftime&totime=$ttime&sunday=$sunday&monday=$monday&tuesday=$tuesday&wednesday=$wednesday&thursday=$thursday&friday=$friday&saturday=$saturday&prenotification=$prenotification&uid=$uid&wheelhead=$wheelhead&istodaynoficationbeforetime=$istodaynoficationbeforetime');
    var response = await http.post(url);
    print('Intesnsion' + '$response');
  }

  insertfeelings(String id, String details, String submiton, String uid) async {
    var url = Uri.parse(
        'https://interesting-bartik.66-165-248-146.plesk.page/api/BusyHour/insertfeelings?id=$id&details=$details&submiton=$submiton&uid=$uid');
    var response = await http.post(url);
    print('Feelings' + '$response');
  }

  insertpreviousintesnsion(String id, String intensiontitle, String date,
      String fromtime, String totime, String done, String uid) async {
    var url = Uri.parse(
        'https://interesting-bartik.66-165-248-146.plesk.page/api/BusyHour/insertPreviousIntension?id=$id&intensiontitle=$intensiontitle&date=$date&fromtime=$fromtime&totime=$totime&done=$done&uid=$uid');
    var response = await http.post(url);
    print('Previous Intesnion' + '$response');
  }

  insertpreviousmeditation(
      String id, String male, String date, String done, String uid) async {
    var url = Uri.parse(
        'https://interesting-bartik.66-165-248-146.plesk.page/api/BusyHour/insertmeditation?id=$id&male=$male&date=$date&done=$done&uid=$uid');
    var response = await http.post(url);
    print('Previous meditation' + '$response');
  }

  Future<String> postdatatointernet(String user) async {
    deletefrominternet(user);
    List<BusyHourGET> listbusy = await db.getbusyhours();
    for (var item in listbusy) {
      await insertbusyhour(
          item.id.toString(),
          item.busyreason,
          item.fromtime,
          item.totime,
          item.sunday,
          item.monday,
          item.tuesday,
          item.wednesday,
          item.thursday,
          item.friday,
          item.saturday,
          item.userid);
    }
    List<IntensionsGET> listint = await db.getIntensions();
    for (var item in listint) {
      await insertintesnsion(
          item.id.toString(),
          item.intensiontitle,
          item.discription,
          item.fromtime,
          item.totime,
          item.sunday,
          item.monday,
          item.tuesday,
          item.wednesday,
          item.thursday,
          item.friday,
          item.saturday,
          item.prenotification,
          item.userid,
          item.wheelhead,
          item.istodaynoficationbeforetime);
    }
    List<Feelings> listfeel = await db.getFeeling();
    for (var item in listfeel) {
      await insertfeelings("1", item.details, item.submiton, item.userid);
    }
    List<PreviousintensionsGET> listpre =
        await db.getPreviousIntensionsforsqlserver();
    for (var item in listpre) {
      await insertpreviousintesnsion(item.id.toString(), item.intensiontitle,
          item.date, item.fromtime, item.totime, item.done, item.userid);
    }
    List<PreviousMeditationGET> listpmed = await db.getmeditation();
    for (var item in listpmed) {
      await insertpreviousmeditation(
          item.id.toString(), item.male, item.date, item.done, item.userid);
    }
    return "Sucess";
  }
}
