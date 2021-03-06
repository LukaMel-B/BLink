import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeacherAttendanceChechlistCard extends StatefulWidget {
  const TeacherAttendanceChechlistCard(this.markattendance);
  final void Function() markattendance;
  @override
  State<TeacherAttendanceChechlistCard> createState() =>
      _TeacherAttendanceChechlistCardState();
}

int attends = 0;

class _TeacherAttendanceChechlistCardState
    extends State<TeacherAttendanceChechlistCard> {
  bool _checkbox = false;

  void add() {
    if (_checkbox == true) {
      attends = attends + 1;
      print(attends);
    } else {
      attends = attends - 1;
      print(attends);
    }
  }

  _addAttendance() {
    FirebaseFirestore.instance
        .collection('Attendance')
        .doc(DateTime.now().toString())
        .set({
      'date': DateTime.now(),
      'present': attends,
    });
  }

  @override
  void initState() {
    setState(() {
      attends = 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Checkbox(
        focusColor: const Color(0xff4FB4AD),
        activeColor: const Color(0xff4FB4AD),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        value: _checkbox,
        onChanged: (value) {
          setState(() {
            _checkbox = !_checkbox;
            add();
          });
        },
      ),
    );
  }
}
