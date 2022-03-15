import 'package:blink/Contents/Dashboard/Student/Student-Assignment-ViewCard.dart';
import 'package:blink/Contents/Functions/const.dart';
import 'package:flutter/material.dart';

class StudentAssignmentView extends StatefulWidget {
  const StudentAssignmentView({Key? key}) : super(key: key);

  @override
  State<StudentAssignmentView> createState() => _StudentAssignmentViewState();
}

class _StudentAssignmentViewState extends State<StudentAssignmentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: kTextFieldDecoration,
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0, right: 0),
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
                      width: 35,
                    ),
                    const Text(
                      'Assignments',
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
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: Container(
                  height: 650,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowIndicator();
                      return true;
                    },
                    child: ListView(
                      children: const [
                        StudentAssignmentViewCard(
                          date: '02/02/2022',
                          subtitle: 'Creation',
                          title: 'Resume',
                        ),
                        StudentAssignmentViewCard(
                          date: '06/02/2022',
                          subtitle: 'Report',
                          title: 'Essay',
                        ),
                        StudentAssignmentViewCard(
                          date: '15/02/2022',
                          subtitle: 'Writing',
                          title: 'Letter',
                        ),
                        StudentAssignmentViewCard(
                          date: '25/02/2022',
                          subtitle: 'Report',
                          title: 'Thesis',
                        ),
                        StudentAssignmentViewCard(
                          date: '02/03/2022',
                          subtitle: 'Format',
                          title: 'Notice',
                        ),
                      ],
                    ),
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
