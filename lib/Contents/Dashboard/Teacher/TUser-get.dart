import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TUserGet extends StatefulWidget {
  const TUserGet({Key? key}) : super(key: key);

  @override
  _TUserGetState createState() => _TUserGetState();
}

class _TUserGetState extends State<TUserGet> {
  String name = "fullname";
  String userType = "UserType";
  String imageUrl = 'images/no-icon-image.png';
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  String loggedUser = "no uid";

  dynamic getDetails(String user) async {
    if (loggedUser.length > 25) {
      final detail = await _fireStore.collection("users").doc(user).get();
      setState(() {
        name = detail.data()?['fullName'] ?? "Full Name";
        userType = detail.data()?['UserType'] ?? "User Type";
        imageUrl = detail.data()?['UserPicture'] ?? 'images/no-icon-image.png';
      });
    }
  }

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

  @override
  void initState() {
    super.initState();
    getUserID();
    getDetails(loggedUser);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 85,
          width: 85,
          child: ClipOval(
            child: Image.network(imageUrl),
            // foregroundImage: NetworkImage(imageUrl),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontFamily: 'Rockwell',
                fontSize: 21,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              userType,
              style: const TextStyle(
                fontSize: 19,
                color: Color(0xff716A6A),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
