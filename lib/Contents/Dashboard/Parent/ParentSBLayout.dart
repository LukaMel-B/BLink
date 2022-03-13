import 'package:flutter/material.dart';
import 'Parent-NavBar.dart';
import 'Parent-dashboard.dart';

class ParentSBLayout extends StatelessWidget {
  const ParentSBLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [ParentDashboard(), ParentNavBar()],
    );
  }
}
