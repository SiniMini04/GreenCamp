import 'package:mysql1/mysql1.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

bool isResultEmpty = false;

Future<bool> changeColorFromButton(int buttonId) async {
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
    logger.i("not Empty");
    isResultEmpty = true;
    await conn.close();
    return false;
  } else {
    isResultEmpty = false;
    await conn.close();
    return true;
  }
}

bool returnColorOption(int buttonId) {
  changeColorFromButton(buttonId);
  if (isResultEmpty) {
    logger.d('true');
    return true;
  } else {
    return false;
  }
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
