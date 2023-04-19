import 'package:mysql1/mysql1.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

Future<void> selectQuery() async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '',
    db: 'mydb',
  ));

  List<Map<String, dynamic>> results =
      await database.rawQuery('SELECT * FROM my_table');
  for (var row in results) {
    logger.d('ID: ${row['id']}, Name: ${row['name']}, Age: ${row['age']}');
  }
  // Select Query
  //final results = await conn.query('SELECT * FROM TCampsite');

  // Insert Query
  // var result = await conn
  // .query('INSERT INTO mytable (name, age) VALUES (?, ?)', ['John Doe', 30]);

  // Result

  //logger.i('Inserted record with ID: ${results}');

  await conn.close();
  // Do smth with the results gotten from the Select Query
  //for (var row in results) {
  //final id = row[0];
  //final name = row[1];
  //final email = row[2];
  // ...
  //}
}
