import 'package:blink/Contents/Dashboard/Parent/ParentSBLayout.dart';
import 'package:blink/Contents/parent-profile-edit.dart';
import 'package:blink/Contents/signup_controller.dart';
import 'package:blink/Contents/student-profile-edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:blink/Contents/functions/profileView.dart';

class ParentProfile extends StatefulWidget {
  const ParentProfile({Key? key}) : super(key: key);

  @override
  _ParentProfileState createState() => _ParentProfileState();
}

class _ParentProfileState extends State<ParentProfile> {
  String nameHolder = "name";
  String emailHolder = "Email";
  String fnameHolder = "Father Name";
  String imageUrl = "images/no-icon-image.png";
  String mnameHolder = "Mother Name";
  String mobileHolder = "Mobile number";
  String alternateMobileHolder = "Alternate Mobile number";
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
    print(user);
    if (loggedUser.length > 25) {
      final detail = await _fireStore.collection("users").doc(user).get();
      setState(() {
        nameHolder = detail.data()?['fullName'] ?? "Name";
        emailHolder = detail.data()?['Mail'] ?? "Email";
        imageUrl = detail.data()?['UserPicture'] ?? "images/no-icon-image.png";
        fnameHolder = detail.data()?['Father Name'] ?? "Father Name";
        mnameHolder = detail.data()?['Mother Name'] ?? "Mother Name";
        mobileHolder = detail.data()?['Mobile number'] ?? "Mobile number";
        alternateMobileHolder =
            detail.data()?['Alternate number'] ?? "Alternate number";
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

  SignUpController signUpController = Get.put(SignUpController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserID();
    getDetails(loggedUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffF9FFED), Color(0xffA4DADA)]),
          ),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 80,
                          ),
                          ClipOval(
                            child: Image.network(imageUrl),
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
                                text: emailHolder,
                              ),
                              ProfileView(
                                text: fnameHolder,
                              ),
                              ProfileView(
                                text: mnameHolder,
                              ),
                              ProfileView(
                                text: mobileHolder,
                              ),
                              ProfileView(
                                text: alternateMobileHolder,
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
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10, left: 25),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const ParentProfileEdit())));
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
                                            const ParentSBLayout())));
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
