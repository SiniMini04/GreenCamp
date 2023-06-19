import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

List<CalendarResource> kalenderDataRecources() {
  List<CalendarResource> resourceColl = <CalendarResource>[];
  resourceColl.add(CalendarResource(
    displayName: 'John',
    id: '0001',
  ));

  return resourceColl;
}

List<Appointment> kalenderDataAppointments() {
  List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
      startTime: DateTime(2023, 06, 19), endTime: DateTime(2023, 08, 25)));

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
              view: CalendarView.timelineWeek,
              showNavigationArrow: true,
              dataSource: MeetingDataSource(
                  kalenderDataAppointments(), kalenderDataRecources()),
              resourceViewSettings: const ResourceViewSettings(
                  displayNameTextStyle: TextStyle(color: Colors.white),
                  showAvatar: false,
                  size: 120,
                  visibleResourceCount: 5),
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
    resources = resources;
  }
}
