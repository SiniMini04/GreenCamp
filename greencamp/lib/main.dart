import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, double>> positions = [
      //Camping Position 32-17
      {'bottom': 0.666, 'left': 0.345},
      {'bottom': 0.645, 'left': 0.385},
      {'bottom': 0.63, 'left': 0.425},
      {'bottom': 0.615, 'left': 0.465},
      {'bottom': 0.6, 'left': 0.505},
      {'bottom': 0.585, 'left': 0.542},
      {'bottom': 0.57, 'left': 0.581},
      {'bottom': 0.555, 'left': 0.619},
      {'bottom': 0.56, 'left': 0.657},
      {'bottom': 0.555, 'left': 0.705},
      {'bottom': 0.55, 'left': 0.745},
      {'bottom': 0.545, 'left': 0.785},
      {'bottom': 0.53, 'left': 0.82},
      {'bottom': 0.51, 'left': 0.855},
      {'bottom': 0.485, 'left': 0.885},
      {'bottom': 0.46, 'left': 0.915},
      //
      {'bottom': 0.84, 'left': 0.35},
      {'bottom': 0.81, 'left': 0.4},
      {'bottom': 0.78, 'left': 0.45},
      {'bottom': 0.75, 'left': 0.5},
      {'bottom': 0.72, 'left': 0.55},
      {'bottom': 0.69, 'left': 0.6},
      {'bottom': 0.66, 'left': 0.65},
      {'bottom': 0.63, 'left': 0.7},
      {'bottom': 0.6, 'left': 0.75},
      {'bottom': 0.57, 'left': 0.8},
      {'bottom': 0.54, 'left': 0.85},
      {'bottom': 0.51, 'left': 0.9},
      {'bottom': 0.48, 'left': 0.95},
      {'bottom': 0.68, 'left': 0.41},
      {'bottom': 0.65, 'left': 0.46},
      {'bottom': 0.62, 'left': 0.51},
      {'bottom': 0.59, 'left': 0.56},
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MediaQuery(
        data: MediaQuery.of(context),
        child: Container(
          decoration: BoxDecoration(
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
                for (final position in positions)
                  Positioned(
                    bottom: position['bottom']! *
                        MediaQuery.of(context).size.height,
                    left: position['left']! * MediaQuery.of(context).size.width,
                    child: FractionallySizedBox(
                      widthFactor: 0.05,
                      heightFactor: 0.05,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.fiber_manual_record),
                        color: Colors.green,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



/*


//Camping Position 33-45B
            Positioned(
                bottom: 715,
                left: 365,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 700,
                left: 405,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 685,
                left: 445,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 670,
                left: 485,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 655,
                left: 525,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 645,
                left: 565,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 635,
                left: 605,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 625,
                left: 645,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 620,
                left: 685,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 615,
                left: 725,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 610,
                left: 765,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 605,
                left: 805,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 600,
                left: 845,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 595,
                left: 885,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
//Camping Position 58-46B
            Positioned(
                bottom: 770,
                left: 385,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 755,
                left: 425,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 740,
                left: 465,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 725,
                left: 505,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 710,
                left: 545,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 700,
                left: 585,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 690,
                left: 625,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 680,
                left: 665,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 675,
                left: 705,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 670,
                left: 745,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 665,
                left: 785,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 660,
                left: 825,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 655,
                left: 865,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 650,
                left: 905,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
//Camping Position 59-73
            Positioned(
                bottom: 830,
                left: 415,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 815,
                left: 445,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 800,
                left: 485,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 785,
                left: 525,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 770,
                left: 565,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 760,
                left: 605,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 750,
                left: 645,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 740,
                left: 685,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 735,
                left: 725,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 730,
                left: 765,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 725,
                left: 805,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 720,
                left: 845,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 715,
                left: 885,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 710,
                left: 925,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 705,
                left: 965,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
//Camping Position 88-74
            Positioned(
                bottom: 875,
                left: 425,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 860,
                left: 465,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 845,
                left: 505,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 830,
                left: 545,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 815,
                left: 585,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 805,
                left: 625,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 795,
                left: 665,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 785,
                left: 705,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 775,
                left: 745,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 775,
                left: 785,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 775,
                left: 825,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 770,
                left: 865,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 765,
                left: 905,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 760,
                left: 945,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 755,
                left: 985,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
//Camping Position 89-105
            Positioned(
                bottom: 935,
                left: 475,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 923,
                left: 510,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 910,
                left: 540,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 898,
                left: 570,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 885,
                left: 600,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 873,
                left: 630,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 860,
                left: 660,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 855,
                left: 690,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 850,
                left: 725,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 845,
                left: 760,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 840,
                left: 795,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 835,
                left: 830,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 830,
                left: 865,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 825,
                left: 900,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 825,
                left: 935,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 825,
                left: 970,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 825,
                left: 1005,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                ))*/
         
