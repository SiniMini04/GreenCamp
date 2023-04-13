import 'package:flutter/material.dart';

void main() {
  final List<Map<String, double>> positions = [
    //Camping Position 1-11
    {'bottom': 615, 'left': 325},
    {'bottom': 600, 'left': 365},
    {'bottom': 585, 'left': 405},
    {'bottom': 570, 'left': 445},
    {'bottom': 555, 'left': 483},
    {'bottom': 540, 'left': 521},
    {'bottom': 525, 'left': 559},
    {'bottom': 510, 'left': 597},
    {'bottom': 495, 'left': 635},
    {'bottom': 480, 'left': 673},
    {'bottom': 465, 'left': 711},
    //Camping Position 12-16
    {'bottom': 480, 'left': 760},
    {'bottom': 465, 'left': 795},
    {'bottom': 450, 'left': 830},
    {'bottom': 435, 'left': 865},
    {'bottom': 415, 'left': 900},
    //Camping Position 32-17
    {'bottom': 660, 'left': 345},
    {'bottom': 645, 'left': 385},
    {'bottom': 630, 'left': 425},
    {'bottom': 615, 'left': 465},
    {'bottom': 600, 'left': 505},
    {'bottom': 585, 'left': 542},
    {'bottom': 570, 'left': 581},
    {'bottom': 555, 'left': 619},
    {'bottom': 560, 'left': 657},
    {'bottom': 555, 'left': 705},
    {'bottom': 550, 'left': 745},
    {'bottom': 545, 'left': 785},
    {'bottom': 530, 'left': 820},
    {'bottom': 510, 'left': 855},
    {'bottom': 485, 'left': 885},
    {'bottom': 460, 'left': 915},
    //Camping Position 33-45B
    {'bottom': 715, 'left': 365},
    {'bottom': 700, 'left': 405},
    {'bottom': 685, 'left': 445},
    {'bottom': 670, 'left': 485},
    {'bottom': 655, 'left': 525},
    {'bottom': 645, 'left': 565},
    {'bottom': 635, 'left': 605},
    {'bottom': 625, 'left': 645},
    {'bottom': 620, 'left': 685},
    {'bottom': 615, 'left': 725},
    {'bottom': 610, 'left': 765},
    {'bottom': 605, 'left': 805},
    {'bottom': 600, 'left': 845},
    {'bottom': 595, 'left': 885},
    //Camping Position 58-46B
    {'bottom': 770, 'left': 385},
    {'bottom': 755, 'left': 425},
    {'bottom': 740, 'left': 465},
    {'bottom': 725, 'left': 505},
    {'bottom': 710, 'left': 545},
    {'bottom': 700, 'left': 585},
    {'bottom': 690, 'left': 625},
    {'bottom': 680, 'left': 665},
    {'bottom': 675, 'left': 705},
    {'bottom': 670, 'left': 745},
    {'bottom': 665, 'left': 785},
    {'bottom': 660, 'left': 825},
    {'bottom': 655, 'left': 865},
    {'bottom': 650, 'left': 905},
    //Camping Position 59-73
    {'bottom': 830, 'left': 415},
    {'bottom': 815, 'left': 445},
    {'bottom': 800, 'left': 485},
    {'bottom': 785, 'left': 525},
    {'bottom': 770, 'left': 565},
    {'bottom': 760, 'left': 605},
    {'bottom': 750, 'left': 645},
    {'bottom': 740, 'left': 685},
    {'bottom': 735, 'left': 725},
    {'bottom': 730, 'left': 765},
    {'bottom': 725, 'left': 805},
    {'bottom': 720, 'left': 845},
    {'bottom': 715, 'left': 885},
    {'bottom': 710, 'left': 925},
    {'bottom': 705, 'left': 965},
    //Camping Position 88-74
    {'bottom': 875, 'left': 425},
    {'bottom': 860, 'left': 465},
    {'bottom': 845, 'left': 505},
    {'bottom': 830, 'left': 545},
    {'bottom': 815, 'left': 585},
    {'bottom': 805, 'left': 625},
    {'bottom': 795, 'left': 665},
    {'bottom': 785, 'left': 705},
    {'bottom': 775, 'left': 745},
    {'bottom': 775, 'left': 785},
    {'bottom': 775, 'left': 825},
    {'bottom': 770, 'left': 865},
    {'bottom': 765, 'left': 905},
    {'bottom': 760, 'left': 945},
    {'bottom': 755, 'left': 985},
    //Camping Position 89-105
    {'bottom': 935, 'left': 475},
    {'bottom': 923, 'left': 510},
    {'bottom': 910, 'left': 540},
    {'bottom': 898, 'left': 570},
    {'bottom': 885, 'left': 600},
    {'bottom': 873, 'left': 630},
    {'bottom': 860, 'left': 660},
    {'bottom': 855, 'left': 690},
    {'bottom': 850, 'left': 725},
    {'bottom': 845, 'left': 760},
    {'bottom': 840, 'left': 795},
    {'bottom': 835, 'left': 827},
    {'bottom': 830, 'left': 859},
    {'bottom': 825, 'left': 891},
    {'bottom': 825, 'left': 923},
    {'bottom': 825, 'left': 955},
    {'bottom': 825, 'left': 987},
    //Camping Position 133-144
    {'bottom': 710, 'right': 820},
    {'bottom': 710, 'right': 770},
    {'bottom': 720, 'right': 730},
    {'bottom': 720, 'right': 680},
    {'bottom': 730, 'right': 630},
    {'bottom': 730, 'right': 590},
    {'bottom': 730, 'right': 550},
    {'bottom': 730, 'right': 520},
    {'bottom': 740, 'right': 470},
    {'bottom': 740, 'right': 420},
    {'bottom': 740, 'right': 380},
    {'bottom': 750, 'right': 330},
    //Camping Position 156-145
    {'bottom': 650, 'right': 840},
    {'bottom': 650, 'right': 790},
    {'bottom': 650, 'right': 750},
    {'bottom': 650, 'right': 700},
    {'bottom': 660, 'right': 660},
    {'bottom': 660, 'right': 610},
    {'bottom': 670, 'right': 570},
    {'bottom': 670, 'right': 530},
    {'bottom': 670, 'right': 480},
    {'bottom': 670, 'right': 440},
    {'bottom': 670, 'right': 400},
    {'bottom': 670, 'right': 350},
    //Camping Position 157-166
    {'bottom': 600, 'right': 840},
    {'bottom': 600, 'right': 800},
    {'bottom': 600, 'right': 760},
    {'bottom': 600, 'right': 700},
    {'bottom': 610, 'right': 630},
    {'bottom': 610, 'right': 580},
    {'bottom': 610, 'right': 530},
    {'bottom': 610, 'right': 470},
    {'bottom': 610, 'right': 420},
    {'bottom': 610, 'right': 370},
    //Camping Position 177-167
    {'bottom': 530, 'right': 870},
    {'bottom': 530, 'right': 820},
    {'bottom': 530, 'right': 770},
    {'bottom': 530, 'right': 730},
    {'bottom': 540, 'right': 690},
    {'bottom': 550, 'right': 640},
    {'bottom': 550, 'right': 590},
    {'bottom': 550, 'right': 540},
    {'bottom': 540, 'right': 490},
    {'bottom': 540, 'right': 440},
    {'bottom': 540, 'right': 390},
    //Camping Position 178-187
    {'bottom': 480, 'right': 870},
    {'bottom': 480, 'right': 800},
    {'bottom': 480, 'right': 750},
    {'bottom': 490, 'right': 700},
    {'bottom': 490, 'right': 650},
    {'bottom': 500, 'right': 600},
    {'bottom': 500, 'right': 550},
    {'bottom': 500, 'right': 500},
    {'bottom': 490, 'right': 440},
    {'bottom': 490, 'right': 390},
    //Camping Position 188-197
    {'bottom': 380, 'right': 800},
    {'bottom': 415, 'right': 900},
    {'bottom': 415, 'right': 800},
    {'bottom': 415, 'right': 750},
    {'bottom': 415, 'right': 680},
    {'bottom': 420, 'right': 620},
    {'bottom': 420, 'right': 580},
    {'bottom': 430, 'right': 520},
    {'bottom': 415, 'right': 470},
    {'bottom': 415, 'right': 420},
    //Camping Position 198-204
    {'bottom': 380, 'right': 750},
    {'bottom': 370, 'right': 680},
    {'bottom': 370, 'right': 630},
    {'bottom': 370, 'right': 580},
    {'bottom': 370, 'right': 530},
    {'bottom': 360, 'right': 480},
    {'bottom': 360, 'right': 430},
    //Camping Position 205-208
    {'bottom': 290, 'right': 580},
    {'bottom': 290, 'right': 530},
    {'bottom': 280, 'right': 480},
    {'bottom': 280, 'right': 430},
    //Camping Position 209-212
    {'bottom': 240, 'right': 590},
    {'bottom': 230, 'right': 540},
    {'bottom': 220, 'right': 490},
    {'bottom': 220, 'right': 440},
    //Camping Position 216-213
    {'bottom': 240, 'right': 590},
    {'bottom': 230, 'right': 540},
    {'bottom': 220, 'right': 490},
    {'bottom': 220, 'right': 440},
    //Camping Position 217-220
    {'bottom': 110, 'right': 610},
    {'bottom': 100, 'right': 570},
    {'bottom': 90, 'right': 520},
    {'bottom': 80, 'right': 480},
  ];
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

            // 132
            Positioned(
                bottom: 760,
                right: 810,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 131
            Positioned(
                bottom: 760,
                right: 770,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 130
            Positioned(
                bottom: 770,
                right: 720,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 129
            Positioned(
                bottom: 770,
                right: 680,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 128
            Positioned(
                bottom: 770,
                right: 630,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 127
            Positioned(
                bottom: 770,
                right: 580,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 126
            Positioned(
                bottom: 770,
                right: 540,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 125
            Positioned(
                bottom: 790,
                right: 500,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 124
            Positioned(
                bottom: 790,
                right: 460,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 123
            Positioned(
                bottom: 790,
                right: 410,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 122
            Positioned(
                bottom: 800,
                right: 370,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 121
            Positioned(
                bottom: 800,
                right: 320,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 106
            Positioned(
                bottom: 830,
                right: 800,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 107
            Positioned(
                bottom: 830,
                right: 770,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 108
            Positioned(
                bottom: 830,
                right: 730,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 109
            Positioned(
                bottom: 830,
                right: 690,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 110
            Positioned(
                bottom: 840,
                right: 660,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 111
            Positioned(
                bottom: 840,
                right: 620,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 112
            Positioned(
                bottom: 850,
                right: 580,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 113
            Positioned(
                bottom: 850,
                right: 550,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 114
            Positioned(
                bottom: 850,
                right: 510,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 115
            Positioned(
                bottom: 860,
                right: 480,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 116
            Positioned(
                bottom: 860,
                right: 440,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 117
            Positioned(
                bottom: 860,
                right: 410,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 118
            Positioned(
                bottom: 870,
                right: 370,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 119
            Positioned(
                bottom: 870,
                right: 340,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 120
            Positioned(
                bottom: 870,
                right: 300,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 61
            Positioned(
                bottom: 230,
                right: 380,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 60
            Positioned(
                bottom: 270,
                right: 370,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 59
            Positioned(
                bottom: 310,
                right: 360,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 58
            Positioned(
                bottom: 350,
                right: 350,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 57
            Positioned(
                bottom: 400,
                right: 340,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 56
            Positioned(
                bottom: 430,
                right: 330,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 55
            Positioned(
                bottom: 480,
                right: 320,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 54
            Positioned(
                bottom: 510,
                right: 310,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 53
            Positioned(
                bottom: 550,
                right: 300,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 52
            Positioned(
                bottom: 600,
                right: 290,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 51
            Positioned(
                bottom: 640,
                right: 280,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 50
            Positioned(
                bottom: 680,
                right: 270,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 49
            Positioned(
                bottom: 720,
                right: 260,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 48
            Positioned(
                bottom: 760,
                right: 250,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 47
            Positioned(
                bottom: 800,
                right: 240,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 46
            Positioned(
                bottom: 850,
                right: 230,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 46 bis
            Positioned(
                bottom: 890,
                right: 220,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),
            // 30
            Positioned(
                bottom: 210,
                right: 310,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: Colors.red,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                )),

// 31
            Positioned(
              bottom: 250,
              right: 300,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 32
            Positioned(
              bottom: 290,
              right: 290,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 33
            Positioned(
              bottom: 330,
              right: 280,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 34
            Positioned(
              bottom: 370,
              right: 270,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 35
            Positioned(
              bottom: 410,
              right: 260,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 36
            Positioned(
              bottom: 450,
              right: 250,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 37
            Positioned(
              bottom: 500,
              right: 240,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 38
            Positioned(
              bottom: 540,
              right: 230,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 39
            Positioned(
              bottom: 580,
              right: 220,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 40
            Positioned(
              bottom: 630,
              right: 210,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 41
            Positioned(
              bottom: 680,
              right: 200,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 42
            Positioned(
              bottom: 720,
              right: 190,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 43
            Positioned(
              bottom: 760,
              right: 180,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 44
            Positioned(
              bottom: 810,
              right: 170,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 45
            Positioned(
              bottom: 850,
              right: 160,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 45
            Positioned(
              bottom: 900,
              right: 150,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
            // 29
            Positioned(
              bottom: 200,
              right: 250,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 28
            Positioned(
              bottom: 240,
              right: 240,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 27
            Positioned(
              bottom: 280,
              right: 230,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 26
            Positioned(
              bottom: 320,
              right: 220,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 25
            Positioned(
              bottom: 360,
              right: 210,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 24
            Positioned(
              bottom: 400,
              right: 200,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// 23
            Positioned(
              bottom: 440,
              right: 190,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// Button 22
            Positioned(
              bottom:
                  490, // Position von unten nach oben, in diesem Fall 480 Pixel von unten
              right:
                  190, // Position von rechts nach links, in diesem Fall 180 Pixel von rechts
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

// Button 21
            Positioned(
              bottom: 530,
              right: 180,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

// Button 20
            Positioned(
              bottom: 570,
              right: 170,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

// Button 19
            Positioned(
              bottom: 610,
              right: 160,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
// Button 18
            Positioned(
              bottom: 660,
              right: 150,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

// Button 17
            Positioned(
              bottom: 710,
              right: 140,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

// Button 16
            Positioned(
              bottom: 760,
              right: 130,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

// Button 15
            Positioned(
              bottom: 800,
              right: 120,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

// Button 14
            Positioned(
              bottom: 840,
              right: 110,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

// Button 13
            Positioned(
              bottom: 880,
              right: 100,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

// Button 13 bis
            Positioned(
              bottom: 920,
              right: 90,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

            // 1
            Positioned(
              bottom: 340,
              right: 140,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
            // 2
            Positioned(
              bottom: 370,
              right: 130,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
            // 3
            Positioned(
              bottom: 530,
              right: 100,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
            // 4
            Positioned(
              bottom: 568,
              right: 92,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

            // 5
            Positioned(
              bottom: 606,
              right: 84,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

            // 6
            Positioned(
              bottom: 644,
              right: 76,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

            // 7
            Positioned(
              bottom: 682,
              right: 68,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

            // 8
            Positioned(
              bottom: 720,
              right: 60,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

            // 9
            Positioned(
              bottom: 758,
              right: 52,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

            // 10
            Positioned(
              bottom: 796,
              right: 44,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

            // 11
            Positioned(
              bottom: 834,
              right: 36,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

            // 12
            Positioned(
              bottom: 872,
              right: 28,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),

            // 13
            Positioned(
              bottom: 910,
              right: 20,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.fiber_manual_record),
                color: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    ),
  ));
}
