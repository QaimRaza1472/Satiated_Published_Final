import 'package:intl/intl.dart';
import 'package:satiated_life/Models/previousintension.dart';
import 'package:satiated_life/Models/previousmeditation.dart';
import 'package:sqflite/sqflite.dart'; //sqflite package
import 'package:path_provider/path_provider.dart'; //path_provider package
import 'package:path/path.dart'; //used to join paths
//import model class
import 'dart:io';
import 'dart:async';

import 'busyhours.dart';
import 'feelings.dart';
import 'intensions.dart';
import 'logdetails.dart';

class DbHelper {
  Future<Database> init() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path, "st.db"); //create path to database

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE logs(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          userid TEXT)""");
      await db.execute("""
          CREATE TABLE busyhours(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          busyreason TEXT,
          fromtime TEXT,
          totime TEXT,
          sunday TEXT,
          monday TEXT,
          tuesday TEXT,
          wednesday TEXT,
          thursday TEXT,
          friday TEXT,
          saturday TEXT,
          userid TEXT)""");
      await db.execute("""
          CREATE TABLE intensions(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          intensiontitle TEXT,
          discription TEXT,
          fromtime TEXT,
          totime TEXT,
          sunday TEXT,
          monday TEXT,
          tuesday TEXT,
          wednesday TEXT,
          thursday TEXT,
          friday TEXT,
          saturday TEXT,
          prenotification TEXT,
          userid TEXT,
          wheelhead TEXT,
          istodaynoficationbeforetime TEXT)""");
      await db.execute("""
          CREATE TABLE feelings(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          details TEXT,
          submiton TEXT,
          userid TEXT)""");
      await db.execute("""
          CREATE TABLE previousintension(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          intensiontitle TEXT,
          date TEXT,
          fromtime TEXT,
          totime TEXT,
          done TEXT,
          userid TEXT)""");
      await db.execute("""
          CREATE TABLE previousmeditation(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          male TEXT,
          date TEXT,
          done TEXT,
          userid TEXT)""");
    });
  }

  Future<int> insertPreviousIntension(Previousintensions item) async {
    //returns number of items inserted as an integer

    final db = await init(); //open database

    return db.insert(
      "previousintension", item.toMap(), //toMap() function from MemoModel
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<int> insertPreviousmeditation(PreviousMeditation item) async {
    //returns number of items inserted as an integer

    final db = await init(); //open database

    return db.insert(
      "previousmeditation", item.toMap(), //toMap() function from MemoModel
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<int> insertLogs(LogsDetail item) async {
    //returns number of items inserted as an integer

    final db = await init(); //open database

    return db.insert(
      "logs", item.toMap(), //toMap() function from MemoModel
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<int> insertBusyHours(BusyHour item) async {
    //returns number of items inserted as an integer

    final db = await init(); //open database

    return db.insert(
      "busyhours", item.toMap(), //toMap() function from MemoModel
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<int> insertIntensions(Intensions item) async {
    //returns number of items inserted as an integer

    final db = await init(); //open database

    return db.insert(
      "intensions", item.toMap(), //toMap() function from MemoModel
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<int> insertFeelings(Feelings item) async {
    //returns number of items inserted as an integer

    final db = await init(); //open database

    return db.insert(
      "feelings", item.toMap(), //toMap() function from MemoModel
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<List<LogsDetail>> getLogs() async {
    //returns the memos as a list (array)

    final db = await init();
    final maps = await db
        .query("logs"); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) {
      //create a list of memos
      return LogsDetail(
        maps[i]['id'],
        maps[i]['userid'],
      );
    });
  }

  Future<List<Feelings>> getFeeling() async {
    //returns the memos as a list (array)

    final db = await init();
    final maps = await db
        .query("feelings"); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) {
      //create a list of memos
      return Feelings(
        maps[i]['details'],
        maps[i]['submiton'],
        maps[i]['userid'],
      );
    });
  }

  Future<List<BusyHourGET>> getbusyhours() async {
    //returns the memos as a list (array)

    final db = await init();
    final maps = await db
        .query("busyhours"); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) {
      //create a list of memos
      return BusyHourGET(
        maps[i]['id'],
        maps[i]['busyreason'],
        maps[i]['fromtime'],
        maps[i]['totime'],
        maps[i]['sunday'],
        maps[i]['monday'],
        maps[i]['tuesday'],
        maps[i]['wednesday'],
        maps[i]['thursday'],
        maps[i]['friday'],
        maps[i]['saturday'],
        maps[i]['userid'],
      );
    });
  }

  Future<List<IntensionsGET>> getIntensions() async {
    //returns the memos as a list (array)

    final db = await init();
    final maps = await db.query(
        "intensions"); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) {
      //create a list of memos
      return IntensionsGET(
        maps[i]['id'],
        maps[i]['intensiontitle'],
        maps[i]['discription'],
        maps[i]['fromtime'],
        maps[i]['totime'],
        maps[i]['sunday'],
        maps[i]['monday'],
        maps[i]['tuesday'],
        maps[i]['wednesday'],
        maps[i]['thursday'],
        maps[i]['friday'],
        maps[i]['saturday'],
        maps[i]['prenotification'],
        maps[i]['userid'],
        maps[i]['wheelhead'],
        maps[i]['istodaynoficationbeforetime'],
      );
    });
  }

  // Future<List<IntensionsGET>> getIntensionsForNotification() async {
  //   //returns the memos as a list (array)
  //   final DateTime now = DateTime.now();
  //   final DateFormat formatter = DateFormat('yyyy-MM-dd');
  //   final String istodaynoficationbeforetime = formatter.format(now);

  //   final db = await init();
  //   final maps = await db.query("intensions",
  //       where: "istodaynoficationbeforetime = ?",
  //       whereArgs: [istodaynoficationbeforetime]);

  //   return List.generate(maps.length, (i) {
  //     return IntensionsGET(
  //       maps[i]['id'],
  //       maps[i]['intensiontitle'],
  //       maps[i]['discription'],
  //       maps[i]['fromtime'],
  //       maps[i]['totime'],
  //       maps[i]['sunday'],
  //       maps[i]['monday'],
  //       maps[i]['tuesday'],
  //       maps[i]['wednesday'],
  //       maps[i]['thursday'],
  //       maps[i]['friday'],
  //       maps[i]['saturday'],
  //       maps[i]['prenotification'],
  //       maps[i]['userid'],
  //       maps[i]['wheelhead'],
  //       maps[i]['istodaynoficationbeforetime'],
  //     );
  //   });
  // }

  Future<List<PreviousintensionsGET>> getPreviousIntensions() async {
    //returns the memos as a list (array)
    String done = "0";
    final db = await init();
    final maps = await db
        .query("previousintension", where: "done = ?", whereArgs: [done]);
    return List.generate(maps.length, (i) {
      return PreviousintensionsGET(
        maps[i]['id'],
        maps[i]['intensiontitle'],
        maps[i]['date'],
        maps[i]['fromtime'],
        maps[i]['totime'],
        maps[i]['done'],
        maps[i]['userid'],
      );
    });
  }

  Future<List<PreviousintensionsGET>>
      getPreviousIntensionsforsqlserver() async {
    //returns the memos as a list (array)
    final db = await init();
    final maps = await db.query("previousintension");
    return List.generate(maps.length, (i) {
      return PreviousintensionsGET(
        maps[i]['id'],
        maps[i]['intensiontitle'],
        maps[i]['date'],
        maps[i]['fromtime'],
        maps[i]['totime'],
        maps[i]['done'],
        maps[i]['userid'],
      );
    });
  }

  Future<List<PreviousMeditationGET>> getmeditation() async {
    //returns the memos as a list (array)
    final db = await init();
    final maps = await db.query("previousmeditation");
    return List.generate(maps.length, (i) {
      return PreviousMeditationGET(
        maps[i]['id'],
        maps[i]['male'],
        maps[i]['date'],
        maps[i]['done'],
        maps[i]['userid'],
      );
    });
  }

  Future<List<PreviousintensionsGET>> getPreviousIntensionsForNotification(
      String title, String date) async {
    //returns the memos as a list (array)
    String done = "0";
    final db = await init();
    // final maps = await db
    //     .rawQuery("previousintension", where: "done = ?", whereArgs: [done]);
    final maps = await db.rawQuery(
        'SELECT * FROM previousintension WHERE intensiontitle=? and date=?',
        ['$title', '$date']);
    return List.generate(maps.length, (i) {
      return PreviousintensionsGET(
        maps[i]['id'],
        maps[i]['intensiontitle'],
        maps[i]['date'],
        maps[i]['fromtime'],
        maps[i]['totime'],
        maps[i]['done'],
        maps[i]['userid'],
      );
    });
  }

  Future<int> updatePreviosIntension(int id, String done) async {
    final db = await init(); //open database
    int count = await db.rawUpdate(
        'UPDATE previousintension SET done = ?  WHERE id = ?',
        ['$done', '$id']);
    return count;
  }

  Future<int> updateMeditation(int id, String done) async {
    final db = await init(); //open database
    int count = await db.rawUpdate(
        'UPDATE previousmeditation SET done = ?  WHERE id = ?',
        ['$done', '$id']);
    return count;
  }

  Future<int> deleteBusyHour(int id) async {
    // returns the number of rows updated

    final db = await init();

    int result = await db.delete("busyhours", where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<int> deleteIntensions(int id) async {
    // returns the number of rows updated

    final db = await init();

    int result =
        await db.delete("intensions", where: "id = ?", whereArgs: [id]);
    return result;
  }
}
