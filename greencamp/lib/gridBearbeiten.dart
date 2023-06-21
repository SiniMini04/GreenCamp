import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'datenbankabfrage.dart';
import 'gridInfoInsert.dart';
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
          "Inserisci un indirizzo e-mail valido! \n(mario.rossi@esempio.it)");
    }
    if (!isTelefonValid) {
      showAlertDialog(
          context, "Inserisci un numero di telefono valido! \n(+39 0123456789)");
    }
    if (!isStrasseValid) {
      showAlertDialog(context,
          "Inserisci un indirizzo stradale valido! \n(Via Roma 10b)");
    }
    if (!isPlzOrtValid) {
      showAlertDialog(context,
          "Inserire un codice postale e una città validi! \n(00100 Rom)");
    }
    if (!isKreditKarteValid) {
      showAlertDialog(context,
          "Inserisci un numero di carta di credito valido! \n(1234 5678 1234 5678)");
    }
    if (!isMietBeginnValid) {
      showAlertDialog(
          context, "Inserire una data di inizio valida! \n(gg.mm.aaaa)");
    }
    if (!isMietEndeValid) {
      showAlertDialog(context, "Inserire una data di fine valida! \n(gg.mm.aaaa)");
    }
    validation = false;
  }

  return validation;
}

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

  List<dynamic> queryResult = await selectQuery(campNr, date);

  for (var row in queryResult) {
    String mieteBeginUebergang =
        row['KundBeginMiete'].toString().substring(0, 10);
    String mieteEndeUebergang =
        row['KundEndeMiete'].toString().substring(0, 10);

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
                      child: const Text('Persona:',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('Nome:')),
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'ad esempio Mario',
                      ),
                      controller: TextEditingController(text: vorname),
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
                  Expanded(child: const Text('Cognome:')),
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'ad esempio Rossi',
                      ),
                      controller: TextEditingController(text: nachname),
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
                        hintText: 'ad esempio mario.rossi@esempio.it',
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
                  Expanded(child: const Text('Telefono:')),
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'ad esempio +39 0123456789',
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
                      child: const Text('Indirizzo:',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('Via:')),
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'ad esempio Via Roma 10b',
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
                  Expanded(child: const Text('Codice postale/luogo:')),
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'ad esempio 00100 Rom',
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
                  Expanded(child: const Text('Paese:')),
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'ad esempio Italia',
                      ),
                      controller: TextEditingController(text: land),
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
                      child: const Text('Mezzi di pagamento:',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('Carta di credito:')),
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'ad esempio 1234 5678 9123 4567',
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
                      child: const Text('Affitto:',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('Inizio noleggio:')),
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
                  Expanded(child: const Text('Fine affitto:')),
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
                          onPressed: () {
                            Navigator.of(context).pop();
                            gridInfoAfterInsert(context, campNr, date);
                          },
                          child: Text('Annullamento'))),
                  Expanded(
                      child: TextButton(
                          onPressed: () async {
                            if (validateFields(context)) {
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
                            }
                          },
                          child: Text('Risparmiare')))
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
