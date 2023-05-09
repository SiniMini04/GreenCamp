import 'package:mysql1/mysql1.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'dart:async';

var logger = Logger(
  printer: PrettyPrinter(),
);

bool isResultEmpty = false;
int kundNr = 0;
bool isButtonFree = false;
bool dbAbfrage = false;

Future<bool> checkButtonStatus(int buttonId, String shownDate) async {
  DateTime currentDate = DateFormat('dd.MM.yyyy').parse(shownDate);
  buttonId += 1;
  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1234',
    db: 'mydb',
  ));
  final results = await conn.query(
      "select * from TCampsite c, TBelege b, TKunden k where c.CampNr = ? AND c.CampNr=b.CampNr AND b.KundId=k.KundId AND k.KundId=? AND k.KundBeginMiete < ? AND k.KundBeginMiete > ?",
      [buttonId, kundNr, currentDate, currentDate]);
  bool isButtonOccupied = false;
  // logger.d(results, dbAbfrage);
  if (results.isNotEmpty) {
    isButtonOccupied = true;
  } else {
    isButtonOccupied = false;
  }

  await conn.close();
  return isButtonOccupied;
}

Future<bool> changeColorFromButton(int index, String shownDate) async {
  dbAbfrage = true;
  bool buttonStatus = await checkButtonStatus(index, shownDate);
  isButtonFree = buttonStatus;
  logger.i(isButtonFree);
  dbAbfrage = false;
  return isButtonFree;
}

Future<Results> selectQuery() async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1234',
    db: 'mydb',
  ));

// Select Query
  final results = await conn.query('select * from TCampsite;');

  for (var row in results) {
    logger.d(
        'ID: ${row['CampNr']}, CampNr: ${row['CampActuallNr']}, CampBesetzt: ${row['CampBesetzt']}');
  }

  // Insert Query
  // var result = await conny
  // .query('INSERT INTO mytable (name, age) VALUES (?, ?)', ['John Doe', 30]);

  // Result

  //logger.i('Inserted record with ID: ${results}');

  await conn.close();
  return results;
}
