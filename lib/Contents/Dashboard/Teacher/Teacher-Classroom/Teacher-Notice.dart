import 'package:blink/Contents/Dashboard/NoticeCard.dart';
import 'package:blink/Contents/Functions/const.dart';
import 'package:flutter/material.dart';

class TeacherNotice extends StatefulWidget {
  const TeacherNotice({Key? key}) : super(key: key);

  @override
  State<TeacherNotice> createState() => _TeacherNoticeState();
}

class _TeacherNoticeState extends State<TeacherNotice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: kTextFieldDecoration,
        child: Expanded(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 6, bottom: 0, right: 15),
                      child: TextButton(
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
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    const Text(
                      'Students',
                      style: TextStyle(
                          color: Colors.black87,
                          // color: Color(0xff388A75),
                          fontFamily: 'Rockwell',
                          fontSize: 33,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: 580,
                  child: ListView(
                    children: const [
                      NoticeCard(
                          title: 'Internal Exam',
                          subtitle: 'Tomorrow',
                          teacher: 'Ashley Ind',
                          sub: 'sub',
                          image: 'images/teachers-pic-1.png',
                          time: '12:35 AM')
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
