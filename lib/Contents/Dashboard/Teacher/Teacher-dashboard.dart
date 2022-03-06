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
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 85, top: 48),
                    child: Text(
                      'Dashboard',
                      style: TextStyle(fontFamily: 'Rockwell', fontSize: 30),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 29, right: 29, top: 50),
                    child: TeacgerToggleBar(),
                  ),
                  Divider(
                    height: 57,
                    thickness: 0.5,
                    color: Colors.teal.withOpacity(0.2),
                    indent: 32,
                    endIndent: 32,
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
