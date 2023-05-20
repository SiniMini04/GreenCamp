import 'package:flutter/material.dart';
import 'package:greencamp/datenbankabfrage.dart';
import 'gridinfos.dart';
import 'gridInfoInsert.dart';

Future<void> deleteUser(BuildContext context, int campNr, String date) async {
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
                          'Sind Sie sicher, dass Sie die Reservation löschen wollen?:',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () async {
                            await deleteReservation(campNr);
                            Navigator.of(context).pop();
                            positioninfos(context, campNr, date);
                          },
                          child: Text('Löschen'))),
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
