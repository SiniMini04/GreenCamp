import 'package:intl/intl.dart';
import 'package:mysql1/mysql1.dart';
import 'package:logger/logger.dart';
import 'dart:async';

var logger = Logger(
  printer: PrettyPrinter(),
);

bool isResultEmpty = false;
int kundNr = 0;
bool isButtonFree = false;
bool dbAbfrage = false;

bool campSiteFree = false;

var firstKundId = 0;

int count = 0;

Future<List<ResultRow>> selctAllCampsites(String shownDate) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1234',
    db: 'greencamp',
  ));
  DateTime displayedDate = DateFormat("dd.MM.yyyy").parse(shownDate);
  String fixedCurrentDate = DateFormat("yyyy-MM-dd").format(displayedDate);

  final results = await conn.query(
      'select c.CampNr from TCampsite c, TBelege b, TKunden k where k.KundBeginMiete <= ? AND k.KundEndeMiete >=? AND k.KundId = b.KundId AND b.CampNr = c.CampNr;',
      [fixedCurrentDate, fixedCurrentDate]);

  logger.i(results);
  await conn.close();

  return results.toList();
}

Future<bool> checkButtonStatus(int buttonId, String shownDate) async {
  DateTime displayedDate = DateFormat("dd.MM.yyyy").parse(shownDate);
  String fixedCurrentDate = DateFormat("yyyy-MM-dd").format(displayedDate);

  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1234',
    db: 'greencamp',
  ));
  final results = await conn.query(
      "select KundVorname, KundName, KundEMail, KundTelefonNr, KundStrasse, KundPlzOrt, KundLand, KundKreditkartenNr, KundBeginMiete, KundEndeMiete from TCampsite c, TBelege b, TKunden k where c.CampNr = ? AND c.CampNr=b.CampNr AND b.KundId=k.KundId AND k.KundBeginMiete <= ? AND k.KundEndeMiete >= ?;",
      [buttonId, fixedCurrentDate, fixedCurrentDate]);

  logger.i(results);
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

Future<Results> selectQuery(int campNr, String ende) async {
  DateTime displayedDate = DateFormat("dd.MM.yyyy").parse(ende);
  String fixedCurrentDate = DateFormat("yyyy-MM-dd").format(displayedDate);
  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1234',
    db: 'greencamp',
  ));

// Select Query
  final results = await conn.query(
      'select KundVorname, KundName, KundEMail, KundTelefonNr, KundStrasse, KundPlzOrt, KundLand, KundKreditkartenNr, KundBeginMiete, KundEndeMiete from TCampsite c, TBelege b, TKunden k where c.CampNr = ? and c.CampNr = b.CampNr and b.KundId = k.KundId and k.KundEndeMiete > ? and k.KundBeginMiete<?;',
      [campNr, fixedCurrentDate, fixedCurrentDate]);

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

Future<bool> checkWhichPopUp(int campNr) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1234',
    db: 'greencamp',
  ));

  final results = await conn.query(
      'select * from TBelege b, TCampsite c where b.CampNr=c.CampNr and c.CampNr = ?;',
      [campNr]);

  await conn.close();
  if (results.isNotEmpty) {
    dbAbfrage = false;
    campSiteFree = true;
    return true;
  }
  dbAbfrage = false;
  campSiteFree = false;
  return false;
}

bool checkingStatus(int campNr) {
  dbAbfrage = true;
  checkWhichPopUp(campNr);

  while (dbAbfrage) {
    count++;
    Future.delayed(Duration(seconds: 5));
  }

  if (campSiteFree) {
    return true;
  }
  return false;
}

Future<void> insertData(vorname, name, strasse, plzOrt, land, kreditkarteNr,
    mail, telefon, begin, ende, campNr) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1234',
    db: 'greencamp',
  ));

  DateTime beginDate = DateFormat("dd.MM.yyyy").parse(begin);
  String fixedBegin = DateFormat("yyyy-MM-dd").format(beginDate);

  DateTime endeDate = DateFormat("dd.MM.yyyy").parse(ende);
  String fixedEnde = DateFormat("yyyy-MM-dd").format(endeDate);

  var checkForRent = await conn
      .query("select * from TBelege, TKunden where CampNr=? ", [campNr]);
  // Insert Query
  if (checkForRent.isEmpty) {
    await conn.query(
        "insert into TKunden (KundVorname, KundName, KundStrasse, KundPlzOrt, KundLand, KundKreditkartenNr, KundEmail, KundTelefonNr, KundBeginMiete, KundEndeMiete) values (?,?,?,?,?,?,?,?,?,?);",
        [
          vorname,
          name,
          strasse,
          plzOrt,
          land,
          kreditkarteNr,
          mail,
          telefon,
          fixedBegin,
          fixedEnde
        ]);
    final getKundId = await conn
        .query("select KundId from TKunden where KundName = ?", [name]);
    for (var row in getKundId) {
      firstKundId = row["KundId"];
    }
    await conn.query("insert into TBelege (KundId, CampNr) values (?,?);",
        [firstKundId, campNr]);
    //logger.i('Inserted record with ID: ${results}');
  }
  await conn.close();
}
