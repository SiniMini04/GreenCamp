import 'package:flutter/material.dart';
import 'positions.dart';

void main() {
  int campingPlaceKey = 0;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Container(
      //Adding Background Image
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Campingplatz_Layout.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            //Adding IconButtons to Immage on every single Campinggrid
            for (final position in positions)
              Positioned(
                bottom: position['bottom'],
                left: position['left'],
                right: position['right'],
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.green,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  key: ValueKey(campingPlaceKey++),
                ),
              ),
          ],
        ),
      ),
    ),
  ));
}
