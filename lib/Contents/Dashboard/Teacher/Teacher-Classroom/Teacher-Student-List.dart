import 'package:blink/Contents/Functions/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Teacher-Student-Details-Page.dart';
import 'StudentCard.dart';

class TeacherStudentList extends StatefulWidget {
  const TeacherStudentList({Key? key}) : super(key: key);

  @override
  State<TeacherStudentList> createState() => _TeacherStudentListState();
}

class _TeacherStudentListState extends State<TeacherStudentList> {
  List<Map<String, dynamic>> studentsDB = [];
  bool _loading = false;

  _getAllStudents() async {
    setState(() {
      _loading = true;
    });
    var temp = await FirebaseFirestore.instance
        .collection('users')
        .where('UserType', isEqualTo: 'Student')
        .orderBy('fullName')
        .get();
    List<Map<String, dynamic>> list = [];
    list = temp.docs.map((e) {
      return e.data();
    }).toList();
    setState(() {
      studentsDB = list;
      _loading = false;
    });
  }

  @override
  void initState() {
    _getAllStudents();
    super.initState();
  }

  List roll = [
    'Roll no: 61',
    'Roll no: 62',
    'Roll no: 63',
    'Roll no: 64',
    'Roll no: 65',
    'Roll no: 66',
    'Roll no: 67',
    'Roll no: 68',
    'Roll no: 69',
    'Roll no: 70',
    'Roll no: 71',
    'Roll no: 72'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: kTextFieldDecoration,
      child: Expanded(
        child: Column(children: <Widget>[
          const SizedBox(height: 30),
          Center(
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 0, right: 15),
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
            child: SizedBox(
              height: 650,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll) {
                  overScroll.disallowIndicator();
                  return true;
                },
                child: ListView.builder(
                  itemCount: studentsDB.length,
                  itemBuilder: (context, index) {
                    return StudentListCard(
                      dept: studentsDB[index]['Department'].toString(),
                      image: studentsDB[index]['UserPicture'].toString(),
                      name: studentsDB[index]['fullName'].toString(),
                      path: TeacherStudentDetailsPage(
                        name: studentsDB[index]['fullName'].toString(),
                        adno: studentsDB[index]['AdmissionNumber'].toString(),
                        dep: studentsDB[index]['Department'].toString(),
                        mail: studentsDB[index]['email'].toString(),
                        parent: studentsDB[index]['GuardianName'].toString(),
                        pmail: 'marcues01@gmai.com',
                        pno: '97184523985',
                        yr: studentsDB[index]['fullName'].toString(),
                        image: studentsDB[index]['UserPicture'].toString(),
                      ),
                      rollNo: roll[index],
                    );
                  },
                ),
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
//ListView(
                //   children: const [
                //     StudentListCard(
                //       dept: 'Mathematics',
                //       image: 'images/student-1.jpg',
                //       name: 'Louis Barell',
                //       rollNo: 'Roll no: 61',
                //       path: TeacherStudentDetailsPage(
                //         name: 'Luois Barell',
                //         adno: '9748',
                //         dep: 'Computer Science',
                //         mail: 'loui@gmail.com',
                //         parent: 'Marcues',
                //         pmail: 'marcues01@gmai.com',
                //         pno: '97184523985',
                //         yr: '3',
                //       ),
                //     ),
                //     StudentListCard(
                //       dept: 'Mathematics',
                //       image: 'images/student-4.jpg',
                //       name: 'Jane Lovey',
                //       rollNo: 'Roll no: 62',
                //       path: TeacherStudentDetailsPage(
                //         name: 'Luois Barell',
                //         adno: 'Luois',
                //         dep: 'Luois',
                //         mail: 'Luois',
                //         parent: 'Luois',
                //         pmail: 'Luois',
                //         pno: 'Luois',
                //         yr: 'Luois',
                //       ),
                //     ),
                //     StudentListCard(
                //       dept: 'Mathematics',
                //       image: 'images/student-5.jpg',
                //       name: 'John Lind',
                //       rollNo: 'Roll no: 63',
                //       path: TeacherStudentDetailsPage(
                //         name: 'Luois Barell',
                //         adno: 'Luois',
                //         dep: 'Luois',
                //         mail: 'Luois',
                //         parent: 'Luois',
                //         pmail: 'Luois',
                //         pno: 'Luois',
                //         yr: 'Luois',
                //       ),
                //     ),
                //     StudentListCard(
                //       dept: 'Mathematics',
                //       image: 'images/student-3.jpg',
                //       name: 'Amy Admas',
                //       rollNo: 'Roll no: 64',
                //       path: TeacherStudentDetailsPage(
                //         name: 'Luois Barell',
                //         adno: 'Luois',
                //         dep: 'Luois',
                //         mail: 'Luois',
                //         parent: 'Luois',
                //         pmail: 'Luois',
                //         pno: 'Luois',
                //         yr: 'Luois',
                //       ),
                //     ),
                //     StudentListCard(
                //       dept: 'Mathematics',
                //       image: 'images/student-2.jpg',
                //       name: 'Jack Daniel',
                //       rollNo: 'Roll no: 65',
                //       path: TeacherStudentDetailsPage(
                //         name: 'Luois Barell',
                //         adno: 'Luois',
                //         dep: 'Luois',
                //         mail: 'Luois',
                //         parent: 'Luois',
                //         pmail: 'Luois',
                //         pno: 'Luois',
                //         yr: 'Luois',
                //       ),
                //     ),
                //     StudentListCard(
                //       dept: 'Mathematics',
                //       image: 'images/student-6.jpg',
                //       name: 'Natasha',
                //       rollNo: 'Roll no: 65',
                //       path: TeacherStudentDetailsPage(
                //         name: 'Luois Barell',
                //         adno: 'Luois',
                //         dep: 'Luois',
                //         mail: 'Luois',
                //         parent: 'Luois',
                //         pmail: 'Luois',
                //         pno: 'Luois',
                //         yr: 'Luois',
                //       ),
                //     ),
                //   ],
                // ),