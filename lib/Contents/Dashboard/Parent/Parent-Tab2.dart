import 'package:blink/Contents/Dashboard/Chat/ChatUI.dart';
import 'package:blink/Contents/Dashboard/Chat/chat.dart';
import 'package:blink/Contents/Dashboard/Teacher/Teacher-Classroom/Teacher-Student-progress-page.dart';
import 'package:blink/Contents/Functions/const.dart';
import 'package:flutter/material.dart';

class ParentTab2 extends StatelessWidget {
  const ParentTab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 450,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const ChatUI())));
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
