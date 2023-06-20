import 'package:flutter/material.dart';
import 'datenbankabfrage.dart';
import 'package:intl/intl.dart';
import 'gridBearbeiten.dart';

String benutzer = "";
String passwort = "";

bool isUserLoggedIn = false;

void resetInputs() {
  benutzer = "";
  passwort = "";
}

bool getIfUserIsLoggedIn() {
  if (isUserLoggedIn) {
    return true;
  } else {
    return false;
  }
}

void changeIfUserIsLoggedIn(newValueOfLogIn) {
  isUserLoggedIn = newValueOfLogIn;
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

Future<void> loginPopUp(BuildContext context) async {
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
                      child: const Text('Login:',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('Benutzername:')),
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'max.muster',
                      ),
                      controller: TextEditingController(text: ''),
                      onChanged: (value) {
                        benutzer = value;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('Passwort:')),
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'mein Passwort',
                      ),
                      controller: TextEditingController(text: ''),
                      onChanged: (value) {
                        passwort = value;
                      },
                    ),
                  ),
                ],
              ),

              Row(children: [
                Expanded(
                    child: TextButton(
                        onPressed: () async {
                          bool isLoggedIn =
                              await checkLogin(benutzer, passwort);
                          if (isLoggedIn) {
                            isUserLoggedIn = isLoggedIn;

                            showAlertDialog(context, "Login Success");
                            Future.delayed(const Duration(milliseconds: 1000),
                                () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            });
                          } else {
                            showAlertDialog(context,
                                "Benutzer und Passwort kombination falsch");
                          }
                          ;
                        },
                        child: Text('Einloggen'))),
              ]),
            ],
          ),
        ),
      ),
    ),
  );
}
