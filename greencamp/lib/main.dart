import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Image(image: AssetImage('assets/Campingplatz_Layout.jpg')),
        ),
      )));
}
