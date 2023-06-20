import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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

Future<List<int>> selctAllCampsites(String shownDate) async {
  DateTime displayedDate = DateFormat("dd.MM.yyyy").parse(shownDate);
  String fixedCurrentDate = DateFormat("yyyy-MM-dd").format(displayedDate);

  final response = await http.post(
      Uri.parse("https://kleeblaetter.net/greencamp/getCamp.php"),
      body: {"date": fixedCurrentDate});

  // Überprüfe den Statuscode der Antwort
  if (response.statusCode == 200) {
    // Konvertiere die Antwort von JSON zu Dart-Objekten
    final jsonData = jsonDecode(response.body);

    List<int> campNrList = [];

    for (var data in jsonData) {
      campNrList.add(data["CampNr"]);
    }

    return campNrList;
  } else {
    throw Exception('Fehler beim Abrufen der Daten');
  }
}

Future<List<dynamic>> selectQuery(int campNr, String ende) async {
  DateTime displayedDate = DateFormat("dd.MM.yyyy").parse(ende);
  String fixedCurrentDate = DateFormat("yyyy-MM-dd").format(displayedDate);
  final response = await http.post(
      Uri.parse("https://kleeblaetter.net/greencamp/getKund.php"),
      body: {"date": fixedCurrentDate, "campnr": campNr.toString()});
  if (response.statusCode == 200) {
    // Konvertiere die Antwort von JSON zu Dart-Objekten

    final jsonData = jsonDecode(response.body);

    return jsonData;
  } else {
    throw Exception('Fehler beim Abrufen der Daten');
  }
}

Future<bool> checkWhichPopUp(int campNr) async {
  final response = await http.post(
      Uri.parse("https://kleeblaetter.net/greencamp/popup.php"),
      body: {"campnr": campNr.toString()});

  String responseBody = response.body.toLowerCase();
  bool isOccupied = responseBody.contains("true");

  if (isOccupied) {
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
    mail, telefon, begin, ende, int campNr) async {
  final checkForRent = await http.post(
      Uri.parse("https://kleeblaetter.net/greencamp/checkRent.php"),
      body: {"campnr": campNr.toString()});

  DateTime beginDate = DateFormat("dd.MM.yyyy").parse(begin);
  String fixedBegin = DateFormat("yyyy-MM-dd").format(beginDate);

  DateTime endeDate = DateFormat("dd.MM.yyyy").parse(ende);
  String fixedEnde = DateFormat("yyyy-MM-dd").format(endeDate);

  String responseBody = checkForRent.body.toLowerCase();
  bool isOccupied = responseBody.contains("true");
  // Insert Query
  if (!isOccupied) {
    await http.post(
        Uri.parse("https://kleeblaetter.net/greencamp/insertUser.php"),
        body: {
          "vorname": vorname,
          "name": name,
          "strasse": strasse,
          "plzort": plzOrt,
          "land": land,
          "kreditkartennr": kreditkarteNr,
          "mail": mail,
          "telefon": telefon
        });

    final getKundId = await http.post(
        Uri.parse("https://kleeblaetter.net/greencamp/getKundId.php"),
        body: {
          "name": name,
        });
    final kundId =
        jsonDecode(getKundId.body.toString()); // Umwandlung in String
    for (var row in kundId) {
      firstKundId = row["KundId"];
    }
    logger.i("test");
    await http.post(
        Uri.parse("https://kleeblaetter.net/greencamp/insertBeleg.php"),
        body: {
          "kundid": firstKundId.toString(),
          "campnr": campNr.toString(),
          "begin": fixedBegin,
          "ende": fixedEnde
        }); // Umwandlung in String
    logger.i("TEST");
  }
}

Future<void> deleteReservation(campNr) async {
  await http.post(
      Uri.parse("https://kleeblaetter.net/greencamp/deleteRent.php"),
      body: {
        "campnr": campNr.toString(),
      });
}

Future<bool> checkLogin(user, password) async {
  final response = await http.post(
      Uri.parse("https://kleeblaetter.net/greencamp/checkLogin.php"),
      body: {
        "user": user,
        "password": password,
      });

  String responseBody = response.body.toLowerCase();
  bool isOccupied = responseBody.contains("true");

  if (isOccupied) {
    return true;
  } else {
    return false;
  }
}

Future<void> updateData(vorname, name, strasse, plzOrt, land, kreditkarteNr,
    mail, telefon, begin, ende, campNr) async {
  DateTime beginDate = DateFormat("dd.MM.yyyy").parse(begin);
  String fixedBegin = DateFormat("yyyy-MM-dd").format(beginDate);

  DateTime endeDate = DateFormat("dd.MM.yyyy").parse(ende);
  String fixedEnde = DateFormat("yyyy-MM-dd").format(endeDate);

  final getKundId = await http.post(
      Uri.parse("https://kleeblaetter.net/greencamp/getKundIdCampNr.php"),
      body: {
        "campnr": campNr.toString(),
      });

  if (getKundId.statusCode == 200) {
    final kundId =
        jsonDecode(getKundId.body.toString()); // Umwandlung in String
    for (var row in kundId) {
      firstKundId = row["KundId"];
    }

    await http.post(
        Uri.parse("https://kleeblaetter.net/greencamp/updateUser.php"),
        body: {
          "vorname": vorname,
          "name": name,
          "strasse": strasse,
          "plzort": plzOrt,
          "land": land,
          "kreditkartennr": kreditkarteNr,
          "mail": mail,
          "telefon": telefon,
          "begin": fixedBegin,
          "ende": fixedEnde,
          "kundid": firstKundId.toString() // Umwandlung in String
        });
  } else {
    throw Exception('Fehler beim Abrufen der KundId');
  }
}

Future<Results> getAppointments() async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '1234',
    db: 'greencamp',
  ));

// Select Query
  final results = await conn.query(
    'select c.CampNr, KundBeginMiete, KundEndeMiete from TCampsite c, TBelege b, TKunden k where c.CampNr = b.CampNr and b.KundId = k.KundId;',
  );

  for (var row in results) {
    logger.d(
        'CampNr: ${row['CampNr']}, KundBeginMiete: ${row['KundBeginMiete']}, KundEndeMiete: ${row['KundEndeMiete']}');
  }

  await conn.close();
  return results;
}
