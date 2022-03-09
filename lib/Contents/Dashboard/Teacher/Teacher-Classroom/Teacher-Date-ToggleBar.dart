import 'package:flutter/material.dart';

class AttendanceToggleBar extends StatefulWidget {
  const AttendanceToggleBar({Key? key}) : super(key: key);

  @override
  State<AttendanceToggleBar> createState() => _AttendanceToggleBarState();
}

class _AttendanceToggleBarState extends State<AttendanceToggleBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 10, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
