import 'package:mysql1/mysql1.dart';
import 'package:logger/logger.dart';

import 'dart:async';

var logger = Logger(
  printer: PrettyPrinter(),
);

bool isResultEmpty = false;

bool isButtonFree = false;
bool dbAbfrage = false;

var firstKundId = 0;

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

Future<Results> selectQuery(int campNr) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1234',
    db: 'mydb',
  ));

// Select Query
  final results = await conn.query(
      'select KundVorname, KundName, KundEMail, KundTelefonNr, KundAdresse, KundKreditkartenNr, KundBeginMiete, KundEndeMiete from TCampsite c, TBelege b, TKunden k where c.CampNr = ? and c.CampNr = b.CampNr and b.KundId = k.KundId;',
      [campNr]);

  for (var row in results) {
    logger.d(
        'ID: ${row['KundVorname']}, CampNr: ${row['KundName']}, CampBesetzt: ${row['KundEMail']}');
  }

  // Insert Query
  // var result = await conny
  // .query('INSERT INTO mytable (name, age) VALUES (?, ?)', ['John Doe', 30]);

  // Result

  //logger.i('Inserted record with ID: ${results}');

  await conn.close();
  return results;
}

Future<void> insertData(vorname, name, adresse, kreditkarteNr, mail, telefon,
    begin, ende, campNr) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1234',
    db: 'mydb',
  ));

  var checkForRent = await conn
      .query("select * from TBelege, TKunden where CampNr=? ", [campNr]);
  // Insert Query
  if (checkForRent.isEmpty) {
    var kundenInsert = await conn.query(
        "insert into TKunden (KundVorname, KundName, KundAdresse, KundKreditkartenNr, KundEmail, KundTelefonNr, KundBeginMiete, KundEndeMiete) values (?, ?, ?,?,?,?,?,?);",
        [vorname, name, adresse, kreditkarteNr, mail, telefon, begin, ende]);

    final getKundId = await conn
        .query("select KundId from TKunden where KundName = ?", [name]);
    for (var row in getKundId) {
      firstKundId = row["KundId"];
    }

    var belegInsert = await conn.query(
        "insert into TBelege (KundId, CampNr) values (?,?);",
        [firstKundId, campNr]);

    //logger.i('Inserted record with ID: ${results}');
  }
  await conn.close();
}
