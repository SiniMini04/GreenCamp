import 'package:mysql1/mysql1.dart';
import 'package:logger/logger.dart';
import 'dart:async';

var logger = Logger(
  printer: PrettyPrinter(),
);

bool isResultEmpty = false;

bool isButtonFree = false;
bool dbAbfrage = false;

Future<bool> checkButtonStatus(int buttonId) async {
  buttonId += 1;
  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1234',
    db: 'mydb',
  ));
  final results = await conn.query(
      "select * from TCampsite where CampNr=? AND CampBesetzt='Ja'",
      [buttonId]);
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

Future<bool> changeColorFromButton(int index) async {
  dbAbfrage = true;
  bool buttonStatus = await checkButtonStatus(index);
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
