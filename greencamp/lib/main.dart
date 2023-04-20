import 'package:flutter/material.dart';
import 'datenbankabfrage.dart';

void main() {
  selectQuery();

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
  ];
  int campingPlaceKey = 0;

  runApp();
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    MaterialApp(
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
                  key: ValueKey(campingPlaceKey++),
                  onPressed: () {},
                  icon: const Icon(Icons.fiber_manual_record),
                  color: changeColorFromButton(campingPlaceKey)
                      ? Colors.red
                      : Colors.green,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                ),
              ),
          ],
        ),
      ),
    ),
  )

    return Container();
  }
}
