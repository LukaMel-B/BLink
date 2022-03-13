import 'package:blink/Contents/Dashboard/Student/Student-Timetable.dart';
import 'package:blink/Contents/Functions/const.dart';
import 'package:flutter/material.dart';

import 'Parent-ToggleBar.dart';

class ParentDashboard extends StatefulWidget {
  const ParentDashboard({Key? key}) : super(key: key);

  @override
  _ParentDashboardState createState() => _ParentDashboardState();
}

class _ParentDashboardState extends State<ParentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: kTextFieldDecoration,
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35, right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Time Table',
                        style: TextStyle(
                            fontSize: 14,
                            //fontFamily: 'Poppins',
                            color: Color(0xff716A6A),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const StudentTimeTable())));
                          },
                          child: Image.asset(
                            'images/calenderIcon.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 33, top: 29),
                  child: Text(
                    'Dashboard',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: 'Rockwell', fontSize: 35),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: ParentToggleBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
