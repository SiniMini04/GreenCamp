import 'dart:html';

import 'package:flutter/material.dart';
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
  bool _isLoading = true;
  List<bool> _isButtonFree = List.filled(positions.length, false);

  @override
  void initState() {
    super.initState();
    _getButtonFreeStatuses();
  }

  Future<void> _getButtonFreeStatuses() async {
    for (var index = 0; index < positions.length; index++) {
      final isButtonFree = await changeColorFromButton(index);
      setState(() {
        _isButtonFree[index] = isButtonFree;
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          final mediaSize = MediaQuery.of(context).size;
         return SafeArea(
  child: Column(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Campingplatz_Layout.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: const <Widget>[
              Text(
                'Spiegazione',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('occupato'),
              Text('libero'),
              Text('con l\'elettricità'),
            ],
          ),
        ),
      ),
    ],
  ),
);
            Scaffold(
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
                      child: Stack(
                        children: [
                          _isLoading
                              ? CircularProgressIndicator()
                              : IconButton(
                                  onPressed: (() => positioninfos(context)),
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
        );
      },
      ),
    );
  }
}

class BasicDialogAlert {}
