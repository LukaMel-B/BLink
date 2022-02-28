import 'package:blink/Contents/Dashboard/Student-NavBar.dart';
import 'package:blink/Contents/Dashboard/Student/Student-dashboard.dart';
import 'package:flutter/material.dart';

class StudentSBLayout extends StatelessWidget {
  const StudentSBLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [StudentDashboard(), StudentNavBar()],
    );
  }
}
