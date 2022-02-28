import 'package:blink/Contents/parent.dart';
import 'package:blink/Contents/student.dart';
import 'package:blink/Contents/teacher.dart';
import 'package:flutter/material.dart';
import 'package:blink/Contents/Functions/HomeButton.dart';
import 'package:blink/Contents/Functions/const.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kTextFieldDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 70,
            ),
            const Text(
              'BLink',
              style: TextStyle(
                  color: Colors.black87,
                  // color: Color(0xff388A75),
                  fontFamily: 'LuckiestGuy',
                  fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/Landing-page.png',
                  height: 320.0,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  HomeButton(
                    path1: 'Student',
                    path2: Student1(),
                  ),
                  HomeButton(
                    path1: 'Teacher',
                    path2: Teacher1(),
                  ),
                  HomeButton(
                    path1: 'Parent ',
                    path2: Parent1(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
