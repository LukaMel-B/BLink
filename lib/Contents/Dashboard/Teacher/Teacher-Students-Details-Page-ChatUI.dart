import 'package:blink/Contents/Dashboard/Chat/chat.dart';
import 'package:blink/Contents/Functions/ProfileView.dart';
import 'package:blink/Contents/Functions/const.dart';
import 'package:flutter/material.dart';

import 'Teacher-Classroom/Teacher-Student-progress-page.dart';

class TeacherStudentDetailsPageChat extends StatefulWidget {
  final String name;
  final String parent;
  final String mail;
  final String pmail;
  final String dep;
  final String yr;
  final String adno;
  final String pno;
  final String image;

  const TeacherStudentDetailsPageChat({
    Key? key,
    required this.name,
    required this.parent,
    required this.mail,
    required this.pmail,
    required this.dep,
    required this.image,
    required this.yr,
    required this.adno,
    required this.pno,
  }) : super(key: key);

  @override
  State<TeacherStudentDetailsPageChat> createState() =>
      _TeacherStudentDetailsPageChatState();
}

class _TeacherStudentDetailsPageChatState
    extends State<TeacherStudentDetailsPageChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: kTextFieldDecoration,
          child: Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 49,
                ),
                Center(
                  child: Text(
                    widget.name,
                    style: const TextStyle(
                        color: Colors.black87,
                        // color: Color(0xff388A75),
                        fontFamily: 'Rockwell',
                        fontSize: 30,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      ClipOval(
                        child: Image.network(widget.image),
                        // foregroundImage: NetworkImage(imageUrl),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffFDF9F9).withOpacity(0.39),
                        borderRadius: BorderRadius.circular(30.0)),
                    height: 380,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 55, 40, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const ProfileView(
                                text: 'Parent:  ',
                              ),
                              ProfileView(
                                text: widget.parent,
                              ),
                            ],
                          ),
                          ProfileView(
                            text: widget.pmail,
                          ),
                          ProfileView(
                            text: widget.mail,
                          ),
                          ProfileView(
                            text: widget.dep,
                          ),
                          Row(
                            children: [
                              const ProfileView(
                                text: 'Year:  ',
                              ),
                              ProfileView(
                                text: widget.yr,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const ProfileView(
                                text: 'Admission:  ',
                              ),
                              ProfileView(
                                text: widget.adno,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, left: 55),
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
                      padding: const EdgeInsets.only(bottom: 10, right: 55),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const Chat())));
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
            ),
          ),
        ),
      ),
    );
  }
}
