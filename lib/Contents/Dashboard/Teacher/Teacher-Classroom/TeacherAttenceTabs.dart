import 'package:blink/Contents/Dashboard/Teacher/Teacher-Classroom/AttendenceCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeacherAttendanceTabs extends StatefulWidget {
  const TeacherAttendanceTabs({Key? key}) : super(key: key);

  @override
  State<TeacherAttendanceTabs> createState() => _TeacherAttendanceTabsState();
}

class _TeacherAttendanceTabsState extends State<TeacherAttendanceTabs> {
  List<Map<String, dynamic>> addentanceDB = [];
  bool _loading = false;

  _getAllAttendances() async {
    setState(() {
      _loading = true;
    });
    var temp = await FirebaseFirestore.instance.collection('Attendance').get();
    List<Map<String, dynamic>> list = [];
    list = temp.docs.map((e) {
      return e.data();
    }).toList();
    setState(() {
      addentanceDB = list;
      _loading = false;
    });
  }

  @override
  void initState() {
    _getAllAttendances();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: ListView.builder(
          itemCount: addentanceDB.length,
          itemBuilder: (context, index) {
            return AttendanceCard(
              title: addentanceDB[index]['period'].toString(),
              subtitle: addentanceDB[index]['time'].toString(),
              date: addentanceDB[index]['date'].toString(),
              attendees: addentanceDB[index]['present'].toString(),
              day: addentanceDB[index]['day'].toString(),
              totalStudents: addentanceDB[index]['total'].toString(),
            );
          },
        ),
        // child: ListView(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        //       child: Column(
        //         children: const [
        //           AttendanceCard(
        //             title: '1st Period',
        //             subtitle: '09:30 AM',
        //             date: '08',
        //             time: '8',
        //             day: 'Mon',
        //           ),
        //           AttendanceCard(
        //               title: '5th Period',
        //               subtitle: '09:30 AM',
        //               day: 'Fri',
        //               date: '05',
        //               time: '7'),
        //           AttendanceCard(
        //               title: '3rd Period',
        //               day: 'Thu',
        //               subtitle: '09:30 AM',
        //               date: '04',
        //               time: '5'),
        //           AttendanceCard(
        //               title: '1st Period',
        //               day: 'Wed',
        //               subtitle: '09:30 AM',
        //               date: '03',
        //               time: '9'),
        //           AttendanceCard(
        //               title: '2nd Period',
        //               day: 'Tue',
        //               subtitle: '09:30 AM',
        //               date: '6',
        //               time: '27'),
        //           AttendanceCard(
        //               title: '2nd Period',
        //               day: 'Tue',
        //               subtitle: '09:30 AM',
        //               date: '6',
        //               time: '8'),
        //           AttendanceCard(
        //               title: '2nd Period',
        //               day: 'Tue',
        //               subtitle: '09:30 AM',
        //               date: '6',
        //               time: '9'),
        //           AttendanceCard(
        //               title: '2nd Period',
        //               day: 'Tue',
        //               subtitle: '09:30 AM',
        //               date: '6',
        //               time: '6'),
        //           AttendanceCard(
        //               title: '2nd Period',
        //               day: 'Tue',
        //               subtitle: '09:30 AM',
        //               date: '6',
        //               time: '7'),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
