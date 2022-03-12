import 'package:blink/Contents/Dashboard/Teacher/Teacher-Classroom/Timeline.dart';
import 'package:blink/Contents/Functions/const.dart';
import 'package:flutter/material.dart';

class TeacherTimeTable extends StatefulWidget {
  const TeacherTimeTable({Key? key}) : super(key: key);

  @override
  State<TeacherTimeTable> createState() => _TeacherTimeTableState();
}

class _TeacherTimeTableState extends State<TeacherTimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: kTextFieldDecoration,
          child: Expanded(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(height: 30),
              Center(
                child: Row(
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
                      width: 30,
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
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: ((context) =>
                        //             const TeacherAttendanceCreate())));
                      },
                      child: const Icon(Icons.add,
                          size: 45, color: Color(0xff299A97)),
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w800)),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                  ],
                ),
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
