import 'package:flutter/material.dart';
import 'datenbankabfrage.dart';

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
                      child: const Text('Accesso:',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('Nome utente:')),
                  Flexible(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'mario.rossi',
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
                  Expanded(child: const Text('Password:')),
                  Flexible(
                    child: TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'la mia password',
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

                            showAlertDialog(context, "Accesso riuscito");
                            Future.delayed(const Duration(milliseconds: 1000),
                                () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            });
                          } else {
                            showAlertDialog(context,
                                "Combinazione di utente e password errata");
                          }
                          ;
                        },
                        child: Text('Accedi'))),
              ]),
            ],
          ),
        ),
      ),
    ),
  );
}
