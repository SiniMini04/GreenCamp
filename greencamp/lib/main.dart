import 'package:flutter/material.dart';
import 'positions.dart';

void main() {
  runApp(MaterialApp(
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
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.fiber_manual_record),
                      color: Colors.green,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      key: ValueKey(index),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    ),
  ));
}
