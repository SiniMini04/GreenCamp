import 'package:flutter/material.dart';
import 'positions.dart';
import 'package:logger/logger.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

bool isButtonFree = false;
bool dbAbfrage = false;

var logger = Logger(
  printer: PrettyPrinter(),
);

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
  logger.d(results, dbAbfrage);
  if (results.isNotEmpty) {
    isButtonOccupied = true;
  } else {
    isButtonOccupied = false;
  }

  await conn.close();
  return isButtonOccupied;
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          final mediaSize = MediaQuery.of(context).size;
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Campingplatz_Layout.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                alignment: Alignment.center,
                children: [
                  // Adding IconButtons to Image on every single Camping grid
                  for (var index = 0; index < positions.length; index++)
                    Positioned(
                      bottom:
                          mediaSize.height * (positions[index]['bottom'] ?? 0),
                      left: positions[index].containsKey('right')
                          ? null
                          : mediaSize.width * (positions[index]['left'] ?? 0),
                      right: positions[index].containsKey('right')
                          ? mediaSize.width * (positions[index]['right'] ?? 0)
                          : null,
                      child: FutureBuilder<bool>(
                        future: changeColorFromButton(index),
                        builder: (BuildContext context,
                            AsyncSnapshot<bool> snapshot) {
                          logger.d(isButtonFree);
                          if (!dbAbfrage) {
                            return IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.fiber_manual_record),
                              color: isButtonFree ? Colors.red : Colors.green,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              key: ValueKey(index),
                            );
                          } else {
                            // Display a loading indicator while the future is being resolved
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Future<bool> changeColorFromButton(int index) async {
  dbAbfrage = true;
  await checkButtonStatus(index).then((value) => isButtonFree = value);
  dbAbfrage = false;
  return isButtonFree;
}
