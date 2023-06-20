import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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

List<Appointment> kalenderDataAppointments() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime(2023, 06, 19),
    endTime: DateTime(2023, 06, 25),
    resourceIds: <Object>[1],
    isAllDay: true,
  ));

  return appointments;
}

Future<void> showCalendar(BuildContext context) async {
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
                  kalenderDataAppointments(), kalenderDataRecources()),
              resourceViewSettings: const ResourceViewSettings(
                  displayNameTextStyle: TextStyle(color: Colors.white),
                  showAvatar: false,
                  size: 30),
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
