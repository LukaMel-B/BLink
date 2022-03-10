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
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 35, bottom: 20),
              child: Column(
                children: [Container()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
