import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class TeacgerToggleBar extends StatefulWidget {
  const TeacgerToggleBar({Key? key}) : super(key: key);

  @override
  _TeacgerToggleBarState createState() => _TeacgerToggleBarState();
}

class _TeacgerToggleBarState extends State<TeacgerToggleBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<String> labels = ['Computer Science', 'Mathematics'];
  int counter = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 175.0,
      minHeight: 50,
      cornerRadius: 40.0,
      activeBgColors: const [
        [Color(0xff4FB4AD)],
        [Color(0xff4FB4AD)]
      ],
      activeFgColor: Colors.white,
      inactiveBgColor: const Color(0xffD8F0E5),
      inactiveFgColor: const Color(0xff4BA0A0),
      initialLabelIndex: 1,
      totalSwitches: 2,
      labels: labels,
      fontSize: 18.5,
      radiusStyle: true,
      onToggle: (index) {
        // print('switched to: $index');
      },
    );
  }
}
