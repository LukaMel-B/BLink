import 'package:blink/Contents/Dashboard/Teacher/Teacher-Classroom/Timeline.dart';
import 'package:blink/Contents/Functions/const.dart';
import 'package:flutter/material.dart';

class StudentTimeTable extends StatefulWidget {
  const StudentTimeTable({Key? key}) : super(key: key);

  @override
  State<StudentTimeTable> createState() => _StudentTimeTableState();
}

class _StudentTimeTableState extends State<StudentTimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: kTextFieldDecoration,
          child: Expanded(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_rounded,
                        size: 35, color: Color(0xff34a3a3)),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  const Text(
                    'Time Table',
                    style: TextStyle(
                        color: Colors.black87,
                        // color: Color(0xff388A75),
                        fontFamily: 'Rockwell',
                        fontSize: 33,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Timeline()
            ]),
          ),
        ),
      ),
    );
  }
}
