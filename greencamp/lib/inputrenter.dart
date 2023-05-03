import 'package:flutter/material.dart';
import 'datenbankabfrage.dart';
import 'gridInfoInsert.dart';

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

Future<void> inputRenter(BuildContext context, int campNr) async {
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
                        // Hier können Sie den eingegebenen Wert verarbeiten
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
                        hintText: '12.34.56',
                      ),
                      controller: TextEditingController(text: ''),
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
                            await insertData(
                                vorname,
                                nachname,
                                strasse,
                                kreditKarte,
                                mail,
                                telefon,
                                mietBeginn,
                                mietEnde,
                                campNr);
                            Navigator.of(context).pop();
                            gridInfoAfterInsert(context, campNr);
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
