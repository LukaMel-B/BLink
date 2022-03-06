import 'package:blink/Contents/Functions/const.dart';
import 'package:flutter/material.dart';

import 'Teacher-ToggleBar.dart';

class TeacherDashboard extends StatefulWidget {
  const TeacherDashboard({Key? key}) : super(key: key);

  @override
  _TeacherDashboardState createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: kTextFieldDecoration,
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 33, top: 100),
                    child: Text(
                      'Dashboard',
                      style: TextStyle(fontFamily: 'Rockwell', fontSize: 32),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 29, right: 29),
                    child: TeacgerToggleBar(),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
