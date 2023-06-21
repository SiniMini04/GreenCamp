import 'package:flutter/material.dart';
import 'package:greencamp/datenbankabfrage.dart';
import 'package:intl/intl.dart';
import 'delete.dart';
import 'gridBearbeiten.dart';

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

Future<void> gridInfoAfterInsert(
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
              const Row(
                children: [
                  Expanded(

                      child: const Text('Persona:',

                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
              Row(
                children: [

                  Expanded(child: const Text('Nome:')),

                  Flexible(child: Text(vorname)),
                ],
              ),
              Row(
                children: [

                  Expanded(child: const Text('Cognome:')),

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
                  Expanded(child: const Text('Telefono:')),
                  Flexible(child: Text(telefon)),
                ],
              ),
              const SizedBox(height: 8),
              // Adresse
              const Row(
                children: [
                  Expanded(

                      child: const Text('Indirizzo:',

                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('Via:')),
                  Flexible(child: Text(strasse)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('Codice postale/luogo:')),
                  Flexible(child: Text(plzOrt)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('Paese:')),
                  Flexible(child: Text(land)),
                ],
              ),
              const SizedBox(height: 8),
              // Zahlungsmittel
              const Row(
                children: [
                  Expanded(

                      child: const Text('Mezzi di pagamento:',

                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('Carta di credito:')),
                  Flexible(child: Text(kreditKarte)),
                ],
              ),
              const SizedBox(height: 8),
              // Miete
              const Row(
                children: [
                  Expanded(

                      child: const Text('Affitto:',

                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
              Row(
                children: [
                  Expanded(child: const Text('Periodo di noleggio:')),
                  Flexible(child: Text(mietBeginn + ' - ' + mietEnde)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            deleteUser(context, campNr, date);
                          },
                          child: Text('Cancellare'))),
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            gridBearbeiten gridBearbeitenWidget =
                                gridBearbeiten();
                            gridBearbeitenWidget
                                .createState()
                                .changeUser(context, campNr, date);
                          },
                          child: Text('Modifica')))
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
