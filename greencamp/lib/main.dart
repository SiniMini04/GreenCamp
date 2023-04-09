import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Container(
      //Adding Background Image
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Campingplatz_Layout.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                bottom: 615,
                left: 325,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                ))
          ],
        ),
      ),
    ),
  ));
}
