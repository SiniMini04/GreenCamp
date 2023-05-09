import 'package:flutter/material.dart';

Future<void> inputRenter(BuildContext context) async {
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
                        // Hier können Sie den eingegebenen Wert verarbeiten
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
                        // Hier können Sie den eingegebenen Wert verarbeiten
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
                        // Hier können Sie den eingegebenen Wert verarbeiten
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
                        // Hier können Sie den eingegebenen Wert verarbeiten
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
                        // Hier können Sie den eingegebenen Wert verarbeiten
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
                        // Hier können Sie den eingegebenen Wert verarbeiten
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
                        // Hier können Sie den eingegebenen Wert verarbeiten
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
                        // Hier können Sie den eingegebenen Wert verarbeiten
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
                        // Hier können Sie den eingegebenen Wert verarbeiten
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
                          onPressed: () {}, child: Text('Bearbeiten'))),
                  Expanded(
                      child: TextButton(
                          onPressed: () {}, child: Text('Hinzufügen')))
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
