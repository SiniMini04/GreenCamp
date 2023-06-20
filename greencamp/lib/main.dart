import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'positions.dart';
import 'datenbankabfrage.dart';
import 'gridinfos.dart';
import 'gridInfoInsert.dart';
import 'package:desktop_window/desktop_window.dart';
import 'dart:io';
import 'login.dart';
import 'logout.dart';
import 'kalender.dart';


void main() async {
  runApp(MyApp());
}

void fullscreen() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DesktopWindow.setMinWindowSize(Size(800, 600));
  await DesktopWindow.setMaxWindowSize(Size(1920, 1080));
  await DesktopWindow.setFullScreen(true);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String shownDate = DateFormat('dd.MM.yyyy').format(DateTime.now());
  bool _isLoading = false;
  List<bool> _isButtonFree = List.filled(positions.length, false);
  bool isTheUserLoggedIn = false;
  String username = "";

  @override
  void initState() {
    super.initState();
    _getButtonFreeStatuses();
  }

  void closeapp() {
    exit(0);
  }

  Future<void> _getButtonFreeStatuses() async {
    setState(() {
      _isLoading = true;
    });
    var buttonOccupied = await selctAllCampsites(shownDate);
    for (int index = 0; index < positions.length; index++) {
      _isButtonFree[index] = false;
    }

    if (buttonOccupied.isNotEmpty) {
      for (int index = 0; index < buttonOccupied.length; index++) {
        int currentCampsite = buttonOccupied[index];
        int campsiteValue = currentCampsite;
        for (int i = 0; i < positions.length; i++) {
          if (_isButtonFree[i] == false) {
            if (identical(i, campsiteValue)) {
              setState(() {
                _isButtonFree[i] = true;
              });
            }
          }
        }
      }
    }
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  Future<void> _showDatePicker(BuildContext context) async {
    DateTime date = DateFormat('dd.MM.yyyy').parse(shownDate);
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != date) {
      setState(() {
        shownDate = DateFormat('dd.MM.yyyy').format(pickedDate);
      });
      reloadButtons();
    }
  }

  Future<void> reloadButtons() async {
    _getButtonFreeStatuses();
  }

  @override
  Widget build(BuildContext context) {
    fullscreen();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          final mediaSize = MediaQuery.of(context).size;
          return Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Campingplatz_Layout.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(35.0),
                    child: AppBar(
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'GreenCamp',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                              child: Container(
                                  child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    DateTime date = DateFormat('dd.MM.yyyy')
                                        .parse(shownDate);
                                    date =
                                        date.subtract(const Duration(days: 1));
                                    shownDate =
                                        DateFormat('dd.MM.yyyy').format(date);
                                  });
                                  reloadButtons();
                                },
                                child: Text('<'),
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    primary: Colors.white),
                              ),
                              TextButton(
                                onPressed: () {
                                  _showDatePicker(context);
                                },
                                child: Text(shownDate),
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    primary: Colors.white),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    DateTime date = DateFormat('dd.MM.yyyy')
                                        .parse(shownDate);
                                    date = date.add(const Duration(days: 1));
                                    shownDate =
                                        DateFormat('dd.MM.yyyy').format(date);
                                  });
                                  reloadButtons();
                                },
                                child: Text('>'),
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    primary: Colors.white),
                              ),
                              TextButton(
                                onPressed: () {
                                  reloadButtons();
                                  setState(() {
                                    shownDate = DateFormat('dd.MM.yyyy')
                                        .format(DateTime.now());
                                  });
                                },
                                child: Text("Heute"),
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    primary: Colors.white),
                              ),
                            ],
                          ))),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      var data = getAppointments();
                                      showCalendar(context, data);
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      primary: Colors.white,
                                    ),
                                    child: Text(
                                      'Kalender',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextButton(
                                    onPressed: () async {
                                      if (isTheUserLoggedIn) {
                                        await logUserOut(context);
                                        setState(() {
                                          isTheUserLoggedIn =
                                              getIfUserIsLoggedIn();
                                        });
                                      } else {
                                        await loginPopUp(context);
                                        setState(() {
                                          isTheUserLoggedIn =
                                              getIfUserIsLoggedIn();
                                        });
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      primary: Colors.white,
                                    ),
                                    child: isTheUserLoggedIn
                                        ? Text(
                                            'Log out',
                                            textAlign: TextAlign.center,
                                          )
                                        : Text(
                                            'Einloggen',
                                            textAlign: TextAlign.center,
                                          ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: closeapp,
                                  icon: Icon(Icons.close),
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  body: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Adding IconButtons to Image on every single Camping grid
                      for (var index = 0; index < positions.length; index++)
                        Positioned(
                          bottom: mediaSize.height *
                              (positions[index]['bottom'] ?? 0),
                          left: positions[index].containsKey('right')
                              ? null
                              : mediaSize.width *
                                  (positions[index]['left'] ?? 0),
                          right: positions[index].containsKey('right')
                              ? mediaSize.width *
                                  (positions[index]['right'] ?? 0)
                              : null,
                          child: Stack(
                            children: [
                              _isLoading
                                  ? CircularProgressIndicator()
                                  : IconButton(
                                      onPressed: () async {
                                        if (await checkWhichPopUp(index)) {
                                          gridInfoAfterInsert(
                                              context, index, shownDate);
                                        } else {
                                          positioninfos(
                                              context, index, shownDate);
                                        }
                                      },
                                      icon:
                                          const Icon(Icons.fiber_manual_record),
                                      color: _isButtonFree[index]
                                          ? Colors.red
                                          : Colors.green,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      key: ValueKey(index + 1),
                                    ),
                              if (positions[index]['electricityConnection'] ==
                                  true)
                                Positioned.fill(
                                  child: Container(
                                    child: IconButton(
                                      icon: const Icon(Icons.bolt),
                                      color: Colors.yellow,
                                      onPressed: () async {
                                        if (await checkWhichPopUp(index)) {
                                          gridInfoAfterInsert(
                                              context, index, shownDate);
                                        } else {
                                          positioninfos(
                                              context, index, shownDate);
                                        }
                                      },
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      iconSize: 20,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    margin: EdgeInsets.all(50),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color:
                          Color.fromARGB(255, 227, 227, 227).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.fiber_manual_record,
                                color: Colors.green,
                              ),
                              Text(
                                'Libero',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.fiber_manual_record,
                                color: Colors.red,
                              ),
                              Text(
                                'Occupato',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.bolt,
                                color: Colors.yellow,
                              ),
                              Text(
                                'con l\'elettricità',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}
