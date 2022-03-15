import 'package:blink/Contents/Dashboard/Chat/chat.dart';
import 'package:blink/Contents/Dashboard/Student/Student-SubjectCard.dart';
import 'package:blink/Contents/Dashboard/Teacher/Teacher-Classroom/Teacher-Student-progress-page.dart';
import 'package:blink/Contents/Functions/const.dart';
import 'package:flutter/material.dart';

class ParentTab1 extends StatelessWidget {
  const ParentTab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Column(
      children: [
        SizedBox(
          height: 456,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowIndicator();
              return true;
            },
            child: ListView(
              children: [
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: StudentSubjectCard(
                        image: 'images/teachers-pic-2.png',
                        subtitle:
                            'Internal Exam will be held on unit 4 tomorrow at 2pm ',
                        teacher: 'Ashley Ind',
                        time: '09:20 AM',
                        title: 'Internal Exam',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 10),
                      child: StudentSubjectCard(
                        image: 'images/teachers-pic-2.png',
                        subtitle:
                            'Internal Exam will be held on unit 4 tomorrow at 2pm ',
                        teacher: 'Ashley Ind',
                        time: '09:20 AM',
                        title: 'Internal Exam',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 10),
                      child: StudentSubjectCard(
                        image: 'images/teachers-pic-2.png',
                        subtitle:
                            'Internal Exam will be held on unit 4 tomorrow at 2pm ',
                        teacher: 'Ashley Ind',
                        time: '09:20 AM',
                        title: 'Internal Exam',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 55),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              const StudentProgressPremium())));
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.insert_chart_outlined,
                      size: 30,
                      color: Color(0xff299A97),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Progress',
                      style: timetabletext,
                    )
                  ],
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.65),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 55),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => const Chat())));
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.chat,
                      size: 30,
                      color: Color(0xff299A97),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Chat',
                      style: timetabletext,
                    )
                  ],
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.65),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
