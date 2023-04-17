import 'package:flutter/material.dart';
import 'positions.dart';

void main() {
  int campingPlaceKey = 0;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Builder(
      builder: (context) => Container(
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
              for (final position in positions)
                Positioned(
                  bottom: MediaQuery.of(context).size.height *
                      (position['bottom'] ?? 0),
                  left: position.containsKey('right')
                      ? null
                      : MediaQuery.of(context).size.width *
                          (position['left'] ?? 0),
                  right: position.containsKey('right')
                      ? MediaQuery.of(context).size.width *
                          (position['right'] ?? 0)
                      : null,
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
    ),
  ));
}
