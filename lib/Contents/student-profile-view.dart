import 'package:blink/Contents/Dashboard/Student/Student-dashboard.dart';
import 'package:blink/Contents/student-profile-edit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'functions/const.dart';
import 'package:blink/Contents/functions/profileView.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  String nameHolder = "name";
  String imageUrl = 'images/student-profile.png';
  String parentHolder = "parent name";
  String deptHolder = "department";
  String emailHolder = "email";
  String yearHolder = "year";
  String adHolder = "adno";
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  String loggedUser = "no uid";

  void getUserID() {
    try {
      final users = _auth.currentUser;
      if (users != null) {
        loggedUser = users.uid;
      }
    } catch (e) {
      print(e);
    }
  }

  dynamic getDetails(String user) async {
    if (loggedUser.length > 25) {
      final detail = await _fireStore.collection("users").doc(user).get();
      setState(() {
        nameHolder = detail.data()?['fullName'] ?? "name";
        parentHolder = detail.data()?['GuardianMail'] ?? "Parent Mail";
        deptHolder = detail.data()?['Department'] ?? "department";
        emailHolder = detail.data()?['email'] ?? "email";
        yearHolder = detail.data()?['Year'] ?? "year";
        adHolder = detail.data()?['AdmissionNumber'] ?? "admission number";
        imageUrl =
            detail.data()?['UserPicture'] ?? 'images/student-profile.png';
        print(
            "-----------------------------------------------------------------$imageUrl");
      });
    } else {
      var message = 'Not loggedIn';
      final snackBar = SnackBar(
        content: Text(
          message,
          style: const TextStyle(
              color: Color(0xffABAAAA),
              // color: Color(0xff388A75),y
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 15),
        ),
        backgroundColor: const Color(0xffF9FFED),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    super.initState();
    getUserID();
    getDetails(loggedUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: kTextFieldDecoration,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 49,
                    ),
                    const Center(
                      child: Text(
                        'Profile',
                        style: TextStyle(
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
                      width: 120,
                      child: ClipOval(
                        child: Image.network(imageUrl),
                        // foregroundImage: NetworkImage(imageUrl),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffFDF9F9).withOpacity(0.39),
                            borderRadius: BorderRadius.circular(30.0)),
                        height: 345,
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProfileView(
                                text: nameHolder,
                              ),
                              ProfileView(
                                text: parentHolder,
                              ),
                              ProfileView(
                                text: emailHolder,
                              ),
                              ProfileView(
                                text: deptHolder,
                              ),
                              Row(
                                children: [
                                  const ProfileView(
                                    text: 'Year: ',
                                  ),
                                  ProfileView(
                                    text: yearHolder,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const ProfileView(
                                    text: 'Admission no: ',
                                  ),
                                  ProfileView(
                                    text: adHolder,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10, left: 25),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                ' Edit Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  textStyle: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w800)),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10, right: 15),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const StudentDashboard())));
                              },
                              child: const Icon(Icons.arrow_forward_rounded,
                                  size: 30, color: Colors.white),
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
