import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'positions.dart';
import 'datenbankabfrage.dart';
import 'gridinfos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String shownDate = DateFormat('dd.MM.yyyy').format(DateTime.now());
  bool _isLoading = true;
  List<bool> _isButtonFree = List.filled(positions.length, false);

  @override
  void initState() {
    super.initState();
    _getButtonFreeStatuses();
  }

  Future<void> _getButtonFreeStatuses() async {
    for (var index = 0; index < positions.length; index++) {
      final isButtonFree = await changeColorFromButton(index, shownDate);
      setState(() {
        _isButtonFree[index] = isButtonFree;
      });
    }
    setState(() {
      _isLoading = false;
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
    }
  }

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
                                DateTime date =
                                    DateFormat('dd.MM.yyyy').parse(shownDate);
                                date = date.subtract(const Duration(days: 1));
                                shownDate =
                                    DateFormat('dd.MM.yyyy').format(date);
                              });
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
                                DateTime date =
                                    DateFormat('dd.MM.yyyy').parse(shownDate);
                                date = date.add(const Duration(days: 1));
                                shownDate =
                                    DateFormat('dd.MM.yyyy').format(date);
                              });
                            },
                            child: Text('>'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                primary: Colors.white),
                          )
                        ],
                      ))),
                      Expanded(
                        child: TextButton(
                          child: Text(
                            'User',
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            primary: Colors.white,
                          ),
                        ),
                      ),
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
                      bottom:
                          mediaSize.height * (positions[index]['bottom'] ?? 0),
                      left: positions[index].containsKey('right')
                          ? null
                          : mediaSize.width * (positions[index]['left'] ?? 0),
                      right: positions[index].containsKey('right')
                          ? mediaSize.width * (positions[index]['right'] ?? 0)
                          : null,
                      child: Stack(
                        children: [
                          _isLoading
                              ? CircularProgressIndicator()
                              : IconButton(
                                  onPressed: () => positioninfos(context),
                                  icon: const Icon(Icons.fiber_manual_record),
                                  color: _isButtonFree[index]
                                      ? Colors.red
                                      : Colors.green,
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  key: ValueKey(index),
                                ),
                          if (positions[index]['electricityConnection'] == true)
                            Positioned.fill(
                              child: Icon(
                                Icons.bolt,
                                color: Colors.yellow,
                                size: 15.0,
                              ),
                            ),
                        ],
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
