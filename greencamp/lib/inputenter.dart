import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'datenbankabfrage.dart';
import 'gridInfoInsert.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;

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

void buildWeekDatePicker(
  BuildContext context,
  DateTime selectedDate,
  DateTime firstAllowedDate,
  DateTime lastAllowedDate,
  ValueChanged<dp.DatePeriod> onNewSelected,
) {
  dp.showWeekPicker(
    context: context,
    initialDate: selectedDate,
    firstDate: firstAllowedDate,
    lastDate: lastAllowedDate,
    selectedPeriod: dp.DatePeriod(selectedDate, selectedDate),
    onChanged: onNewSelected,
    datePickerStyles: dp.DatePickerRangeStyles(
      selectedPeriodLastDecoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadiusDirectional.only(
          topEnd: Radius.circular(10.0),
          bottomEnd: Radius.circular(10.0),
        ),
      ),
      selectedPeriodStartDecoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(10.0),
          bottomStart: Radius.circular(10.0),
        ),
      ),
      selectedPeriodMiddleDecoration: BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.rectangle,
      ),
    ),
  );
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
  bool isTelefonValid =
      RegExp(r'^\+\d{2}\s\d{2}\s\d{3}\s\d{2}\s\d{2}$').hasMatch(telefon);
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
      showAlertDialog(context, "Please enter a valid end date! \n(dd.mm.yyyy)");
    }
    validation = false;
  }

  return validation;
}

Future<void> inputRenter(BuildContext context, int campNr, String date) async {
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
                      controller: TextEditingController(text: ''),
                      onTap: buildWeekDatePicker(
                          DateTime.now(), DateTime.now(), DateTime(2100)),
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
                      controller: TextEditingController(text: ''),
                      onChanged: (value) {
                        mietEnde = value;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () async {
                            if (validateFields(context)) {
                              await insertData(
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
                              gridInfoAfterInsert(context, campNr, date);
                            }
                          },
                          child: Text('Speichern')))
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
