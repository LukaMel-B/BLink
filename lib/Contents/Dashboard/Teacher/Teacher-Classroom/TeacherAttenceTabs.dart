import 'package:blink/Contents/Dashboard/Teacher/Teacher-Classroom/AttendenceCard.dart';
import 'package:flutter/material.dart';

class TeacherAttendanceTabs extends StatefulWidget {
  const TeacherAttendanceTabs({Key? key}) : super(key: key);

  @override
  State<TeacherAttendanceTabs> createState() => _TeacherAttendanceTabsState();
}

class _TeacherAttendanceTabsState extends State<TeacherAttendanceTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Column(
                children: const [
                  AttendanceCard(
                    title: '1st Period',
                    subtitle: '09:30 AM',
                    date: '08',
                    time: '25',
                    day: 'Mon',
                  ),
                  AttendanceCard(
                      title: '5th Period',
                      subtitle: '09:30 AM',
                      day: 'Fri',
                      date: '05',
                      time: '29'),
                  AttendanceCard(
                      title: '3rd Period',
                      day: 'Thu',
                      subtitle: '09:30 AM',
                      date: '04',
                      time: '22'),
                  AttendanceCard(
                      title: '1st Period',
                      day: 'Wed',
                      subtitle: '09:30 AM',
                      date: '03',
                      time: '24'),
                  AttendanceCard(
                      title: '2nd Period',
                      day: 'Tue',
                      subtitle: '09:30 AM',
                      date: '02',
                      time: '27')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
