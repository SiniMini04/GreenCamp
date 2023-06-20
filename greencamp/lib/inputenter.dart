import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:intl/intl.dart';
import 'datenbankabfrage.dart';

class InputRenter extends StatefulWidget {
  @override
  _InputRenterState createState() => _InputRenterState();
}

class _InputRenterState extends State<InputRenter> {
  String vorname = "";
  String nachname = "";
  String mail = "";
  String telefon = "";
  String strasse = "";
  String plzOrt = "";
  String land = "";
  String kreditKarte = "";
  String mietBeginn = "";
  String mietEnde = "";

  DatePeriod _selectedPeriod = DatePeriod(
    DateTime.now(),
    DateTime.now(),
  );

  TextEditingController _mietBeginnController = TextEditingController();
  TextEditingController _mietEndeController = TextEditingController();

  void showRangePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Camping Time'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return RangePicker(
                initiallyShowDate: DateTime.now(),
                selectedPeriod: _selectedPeriod,
                onChanged: (newPeriod) {
                  setState(() {
                    _selectedPeriod = newPeriod;
                  });
                  // Retrieve the start and end dates
                  mietBeginn = DateFormat('dd.MM.yyyy')
                      .format(_selectedPeriod.start)
                      .toString();
                  mietEnde = DateFormat('dd.MM.yyyy')
                      .format(_selectedPeriod.end)
                      .toString();
                },
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _mietBeginnController.text = mietBeginn;
                _mietEndeController.text = mietEnde;
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }

  void _onSelectedDateChanged(DatePeriod newPeriod) {
    setState(() {
      _selectedPeriod = newPeriod;
      mietBeginn = _selectedPeriod.start.toString();
      mietEnde = _selectedPeriod.end.toString();
    });
  }

  Future<void> showAlertDialog(BuildContext context, String message) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool validateFields(BuildContext context) {
    bool validation = true;
    bool isMailValid = RegExp(r'^.+@[^\.].*\.[a-z]{2,3}$').hasMatch(mail);
    bool isTelefonValid = RegExp(
            r'^\+\d{1,3}\s?\(?\d{1,4}\)?[\s.-]?\d{1,9}[\s.-]?\d{1,9}[\s.-]?\d{1,9}$')
        .hasMatch(telefon);
    bool isStrasseValid =
        RegExp(r'^[a-zA-Z0-9]+\s\d+[a-zA-ZäöüÄÖÜ]?$').hasMatch(strasse);
    bool isPlzOrtValid = RegExp(r'^\d{4,5}\s[a-zA-ZäöüÄÖÜ]+$').hasMatch(plzOrt);
    bool isKreditKarteValid =
        RegExp(r'^\d{4}(\s?\d{4}){3}$').hasMatch(kreditKarte);
    bool isMietBeginnValid =
        RegExp(r'^\d{2}\.\d{2}\.\d{4}$').hasMatch(mietBeginn);
    bool isMietEndeValid = RegExp(r'^\d{2}\.\d{2}\.\d{4}$').hasMatch(mietEnde);

    if (!isMailValid ||
        !isTelefonValid ||
        !isStrasseValid ||
        !isPlzOrtValid ||
        !isKreditKarteValid ||
        !isMietBeginnValid ||
        !isMietEndeValid) {
      if (!isMailValid) {
        showAlertDialog(context,
            "Please enter a valid E-mail address! \n(max.musterman@mustermail.ch)");
      }
      if (!isTelefonValid) {
        showAlertDialog(
            context, "Please enter a valid phone number! \n(+41 12 345 67 89)");
      }
      if (!isStrasseValid) {
        showAlertDialog(context,
            "Please enter a valid street address! \n(Maxmusterstrasse 5b)");
      }
      if (!isPlzOrtValid) {
        showAlertDialog(context,
            "Please enter a valid postal code and city! \n(8500 Frauenfeld)");
      }
      if (!isKreditKarteValid) {
        showAlertDialog(context,
            "Please enter a valid credit card number! \n(1234 5678 1234 5678)");
      }
      if (!isMietBeginnValid) {
        showAlertDialog(
            context, "Please enter a valid start date! \n(dd.mm.yyyy)");
      }
      if (!isMietEndeValid) {
        showAlertDialog(
            context, "Please enter a valid end date! \n(dd.mm.yyyy)");
      }
      validation = false;
    }

    return validation;
  }

  Future<void> inputRenter(
      BuildContext context, int campNr, String date) async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                    ),
                  ],
                ),
                // Person
                Row(
                  children: [
                    Expanded(
                        child: const Text('Person:',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: const Text('Vorname:')),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'z.B. Peter',
                        ),
                        controller: TextEditingController(text: ''),
                        onChanged: (value) {
                          vorname = value;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-ZäöüÄÖÜ\- ]')),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: const Text('Nachname:')),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'z.b. Müller',
                        ),
                        controller: TextEditingController(text: ''),
                        onChanged: (value) {
                          nachname = value;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-ZäöüÄÖÜ\- ]')),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: const Text('E-Mail:')),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'max.musterman@mustermail.ch',
                        ),
                        controller: TextEditingController(text: ''),
                        onChanged: (value) {
                          mail = value;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: const Text('Telefon:')),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'z.b. +41 12 345 67 89',
                        ),
                        controller: TextEditingController(text: ''),
                        onChanged: (value) {
                          telefon = value;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Adresse
                Row(
                  children: [
                    Expanded(
                        child: const Text('Adresse:',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: const Text('Strasse:')),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'z.B. Maxmusterstrasse 5b',
                        ),
                        controller: TextEditingController(text: ''),
                        onChanged: (value) {
                          strasse = value;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: const Text('PLZ/Ort:')),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'z.b. 8500 Frauenfeld',
                        ),
                        controller: TextEditingController(text: ''),
                        onChanged: (value) {
                          plzOrt = value;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: const Text('Land:')),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'z.b. Schweiz',
                        ),
                        controller: TextEditingController(text: ''),
                        onChanged: (value) {
                          land = value;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-ZäöüÄÖÜ\- ]')),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Zahlungsmittel
                Row(
                  children: [
                    Expanded(
                        child: const Text('Zahlungsmittel:',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: const Text('Kreditkarte:')),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'z.b. 1234 5678 9123 4567',
                        ),
                        controller: TextEditingController(text: ''),
                        onChanged: (value) {
                          kreditKarte = value;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Miete
                Row(
                  children: [
                    Expanded(
                        child: const Text('Miete:',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: const Text('Miet Beginn:')),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'dd.mm.yyyy',
                        ),
                        controller: _mietBeginnController,
                        onTap: () {
                          showRangePicker(context);
                        },
                        onChanged: (value) {
                          mietBeginn = value;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: const Text('Miete Ende:')),
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'dd.mm.yyyy',
                        ),
                        controller: _mietEndeController,
                        onTap: () {
                          showRangePicker(context);
                        },
                        onChanged: (value) {
                          mietEnde = value;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    if (validateFields(context)) {
                      insertData(
                          vorname,
                          nachname,
                          strasse,
                          plzOrt,
                          land,
                          kreditKarte,
                          mail,
                          telefon,
                          mietBeginn,
                          mietEnde,
                          campNr);
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Speichern'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            inputRenter(context, 123, "2023-06-07");
          },
          child: Text('Open Input Dialog'),
        ),
      ),
    );
  }
}
