import 'package:blink/Contents/Dashboard/Parent/ParentSBLayout.dart';
import 'package:blink/Contents/Dashboard/Student/StudentSideBarLayout.dart';
import 'package:blink/Contents/Dashboard/Teacher/TeacherSideBarLayout.dart';
import 'package:blink/Contents/parent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  _getUserType() async {
    final user = _auth.currentUser;
    if (user != null) {
      final data = await _fireStore.collection("users").doc(user.uid).get();
      final userType = data.data()?['UserType'];

      switch (userType) {
        case 'Student':
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) => const StudentSBLayout())));
          break;
        case 'student':
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) => const StudentSBLayout())));
          //builder: ((context) => const TeacherSBLayout())));
          break;
        case 'Parent':
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) => const ParentSBLayout())));
          break;
        case 'parent':
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) => const ParentSBLayout())));
          break;
        case 'Teacher':
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) => const TeacherSBLayout())));
          //builder: ((context) => const Student1())));
          break;
        case 'teacher':
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: ((context) => const TeacherSBLayout())));
          //builder: ((context) => const Student1())));
          break;
      }
    }
  }

  @override
  void initState() {
    _getUserType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
