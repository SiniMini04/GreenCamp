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
                                      onPressed: (() => positioninfos(context)),
                                      icon:
                                          const Icon(Icons.fiber_manual_record),
                                      color: _isButtonFree[index]
                                          ? Colors.red
                                          : Colors.green,
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      key: ValueKey(index),
                                    ),
                              if (positions[index]['electricityConnection'] ==
                                  true)
                                Positioned.fill(
                                    child: Icon(
                                  Icons.bolt,
                                  color: Colors.yellow,
                                  size: 15.0,
                                )),
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
