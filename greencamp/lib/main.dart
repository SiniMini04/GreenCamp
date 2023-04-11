import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
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
              //Camping Position 1-11
              for (int i = 0; i < 11; i++)
                Positioned(
                  bottom: 615 - i * 15,
                  left: 325 + i * 40,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.fiber_manual_record),
                    color: Colors.red,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                  ),
                ),
              //Camping Position 12-16
              for (int i = 12; i <= 16; i++)
                Positioned(
                  bottom: 485 - (i - 12) * 15,
                  left: 760 + (i - 12) * 35,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.fiber_manual_record),
                    color: Colors.red,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

/*

//Camping Position 32-17
            Positioned(
                bottom: 660,
                left: 345,
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
                bottom: 630,
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
                bottom: 615,
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
                bottom: 600,
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
                bottom: 585,
                left: 542,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 570,
                left: 581,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 555,
                left: 619,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 560,
                left: 657,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 555,
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
                bottom: 550,
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
                bottom: 545,
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
                bottom: 530,
                left: 820,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 510,
                left: 855,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            Positioned(
                bottom: 485,
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
                bottom: 460,
                left: 915,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
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
         
