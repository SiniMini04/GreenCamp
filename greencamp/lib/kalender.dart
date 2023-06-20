import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'datenbankabfrage.dart';

List<CalendarResource> kalenderDataRecources() {
  List<CalendarResource> resourceColl = <CalendarResource>[];

  for (int i = 1; i <= 220; i++) {
    int id = i;
    String displayName = id.toString();

    if (i == 45 || i == 46) {
      resourceColl.add(CalendarResource(
        displayName: displayName,
        id: id,
      ));

      resourceColl.add(CalendarResource(
        displayName: '$displayName B',
        id: id.toString() + 'B',
      ));
    } else {
      resourceColl.add(CalendarResource(
        displayName: displayName,
        id: id,
      ));
    }
  }

  return resourceColl;
}

Future<List<Appointment>> kalenderDataAppointments() async {
  List<Appointment> appointments = <Appointment>[];

  var results = await getAppointments();

  print(results);

  for (var row in results) {
    //print(row['KundBeginMiete']);
    var campNr = row['CampNr'] + 1;
    DateTime kundBeginMiete =
        DateFormat('yyyy-MM-dd').parse(row['KundBeginMiete'].toString());
    DateTime kundEndeMiete =
        DateFormat('yyyy-MM-dd').parse(row['KundEndeMiete'].toString());

    if (campNr == 46) {
      campNr = "45B";
    }
    if (campNr == 47) {
      campNr = "46";
    }
    if (campNr == 48) {
      campNr = "46B";
    }
    if (campNr > 48) {
      campNr = campNr - 2;
    }

    appointments.add(Appointment(
      startTime: kundBeginMiete,
      endTime: kundEndeMiete,
      resourceIds: <Object>[campNr],
      isAllDay: true,
    ));
  }

  return appointments;
}

Future<void> showCalendar(BuildContext context, data) async {
  List<Appointment> appointments = await kalenderDataAppointments();
  await showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: SfCalendar(
              view: CalendarView.timelineMonth,
              showNavigationArrow: true,
              dataSource: MeetingDataSource(
                appointments,
                kalenderDataRecources(),
              ),
              resourceViewSettings: const ResourceViewSettings(
                displayNameTextStyle: TextStyle(color: Colors.white),
                showAvatar: false,
                size: 30,
              ),
            ),
          ),
          Positioned(
            top: 8.0,
            right: 8.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: CloseButton(),
            ),
          ),
        ],
      ),
    ),
  );
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(
      List<Appointment> source, List<CalendarResource> resources) {
    appointments = source;
    this.resources = resources;
  }
}
