import 'package:flutter/material.dart';
import 'datenbankabfrage.dart';
import 'gridInfoInsert.dart';
import 'package:mysql1/src/single_connection.dart';
import 'package:intl/intl.dart';

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

void resetInputs() {
  vorname = "-";
  nachname = "-";
  mail = "-";
  telefon = "-";
  strasse = "-";
  plzOrt = "-";
  land = "-";
  kreditKarte = "-";
  mietBeginn = "-";
  mietEnde = "-";
}

Future<List<Map<String, dynamic>>> getLendStatus(
    int campNr, String date) async {
  resetInputs();
  List<Map<String, dynamic>> resultList = [];

  Results queryResult = await selectQuery(campNr, date);

  for (var row in queryResult) {
    String mieteBeginUebergang =
        row['KundBeginMiete'].toString().substring(0, 11);
    String mieteEndeUebergang =
        row['KundEndeMiete'].toString().substring(0, 11);

    DateTime beginDate = DateFormat("yyyy-MM-dd").parse(mieteBeginUebergang);
    String fixedBegin = DateFormat("dd.MM.yyyy").format(beginDate);

    DateTime endeDate = DateFormat("yyyy-MM-dd").parse(mieteEndeUebergang);
    String fixedEnde = DateFormat("dd.MM.yyyy").format(endeDate);

    if (queryResult.isNotEmpty) {
      vorname = row['KundVorname'];
      nachname = row['KundName'];
      mail = row['KundEMail'];
      telefon = row['KundTelefonNr'].toString();
      strasse = row['KundStrasse'];
      plzOrt = row['KundPlzOrt'];
      land = row['KundLand'];
      kreditKarte = row['KundKreditkartenNr'].toString();
      mietBeginn = fixedBegin;
      mietEnde = fixedEnde;
    }
  }

  return resultList;
}

Future<void> changeUser(BuildContext context, int campNr, String date) async {
  await getLendStatus(campNr, date);
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
                      controller: TextEditingController(text: vorname),
                      onChanged: (value) {
                        vorname = value;
                      },
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
                      controller: TextEditingController(text: nachname),
                      onChanged: (value) {
                        nachname = value;
                      },
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
                      controller: TextEditingController(text: mail),
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
                      controller: TextEditingController(text: telefon),
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
                      controller: TextEditingController(text: strasse),
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
                      controller: TextEditingController(text: plzOrt),
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
                      controller: TextEditingController(text: land),
                      onChanged: (value) {
                        land = value;
                      },
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
                      controller: TextEditingController(text: kreditKarte),
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
                        hintText: '12.34.56',
                      ),
                      controller: TextEditingController(text: mietBeginn),
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
                        hintText: '12.34.56',
                      ),
                      controller: TextEditingController(text: mietEnde),
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
                            await updateData(
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
                          },
                          child: Text('Speichern'))),
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            gridInfoAfterInsert(context, campNr, date);
                          },
                          child: Text('Abbrechen')))
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
