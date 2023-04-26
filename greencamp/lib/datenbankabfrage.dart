import 'package:mysql1/mysql1.dart';
import 'package:logger/logger.dart';
import 'dart:async';

var logger = Logger(
  printer: PrettyPrinter(),
);

bool isResultEmpty = false;

Future<void> changeColorFromButton(int buttonId) async {
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

  logger.d(results);
  if (results.isNotEmpty) {
    isResultEmpty = true;

    await conn.close();
  } else {
    isResultEmpty = false;
    await conn.close();
  }
}

bool returnColorOption(int buttonId) {
  changeColorFromButton(buttonId);
  logger.i(isResultEmpty);
  if (!isResultEmpty) {
    return false;
  }
  return true;
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
