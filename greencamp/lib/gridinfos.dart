import 'package:flutter/material.dart';
import 'package:greencamp/datenbankabfrage.dart';
import 'package:mysql1/src/single_connection.dart';
import 'inputenter.dart';

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

bool isUserInserted = false;

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

bool getIfUserIsInserted() {
  if (isUserInserted) {
    return true;
  } else {
    return false;
  }
}

void changeIfUserIsInserted(bool newValueIfUserIsInserted) {
  isUserInserted = newValueIfUserIsInserted;
}

Future<List<Map<String, dynamic>>> getLendStatus(
    int campNr, String date) async {
  resetInputs();

  List<Map<String, dynamic>> resultList = [];

  Results queryResult = await selectQuery(campNr, date);

  for (var row in queryResult) {
    if (queryResult.isNotEmpty) {
      vorname = row['KundVorname'];
      nachname = row['KundName'];
      mail = row['KundEMail'];
      telefon = row['KundTelefonNr'];
      strasse = row['KundAdresse'];
      plzOrt = row['KundVorname'];
      kreditKarte = row['KundKreditkartenNr'];
      mietBeginn = row['KundBeginMiete'];
      mietEnde = row['KundEndeMiete'];
    }
  }

  return resultList;
}

Future<void> positioninfos(
    BuildContext context, int campNr, String date) async {
  await getLendStatus(campNr, date);
  await showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog(
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
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
                  Flexible(child: Text(vorname)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('Nachname:')),
                  Flexible(child: Text(nachname)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('E-Mail:')),
                  Flexible(child: Text(mail)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('Telefon:')),
                  Flexible(child: Text(telefon)),
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
                  Flexible(child: Text(strasse)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('PLZ/Ort:')),
                  Flexible(child: Text(plzOrt)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('Land:')),
                  Flexible(child: Text(land)),
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
                  Flexible(child: Text(kreditKarte)),
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
                  Expanded(child: const Text('Mietdauer:')),
                  Flexible(child: Text(mietBeginn + ' - ' + mietEnde)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () {}, child: Text('Bearbeiten'))),
                  Expanded(
                      child: TextButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            InputRenter inputRenterWidget = InputRenter();
                            await inputRenterWidget
                                .createState()
                                .inputRenter(context, campNr, date);
                            Navigator.of(context).pop();
                          },
                          child: Text('Hinzufügen')))
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
