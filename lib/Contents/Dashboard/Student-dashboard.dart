import 'package:blink/Contents/Dashboard/Student-NavBar.dart';
import 'package:flutter/material.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const StudentNavBar(),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
