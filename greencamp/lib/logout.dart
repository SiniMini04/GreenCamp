import 'package:flutter/material.dart';
import 'login.dart';

Future<void> logUserOut(BuildContext context) async {
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
                      child: const Text(
                          'Sind Sie sicher, dass Sie sich ausloggen wollen?',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () async {
                            changeIfUserIsLoggedIn(false);
                            Navigator.of(context).pop();
                          },
                          child: Text('Ausloggen'))),
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
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
