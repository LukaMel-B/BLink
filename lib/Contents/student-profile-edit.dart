import 'dart:io';
import 'package:blink/Contents/signup_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:blink/Contents/student-profile-view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blink/Contents/functions/sform.dart';
import 'functions/const.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentProfileEdit extends StatefulWidget {
  const StudentProfileEdit(
      {required this.name,
      required this.parent,
      required this.email,
      required this.dept});

  final String name;
  final String parent;
  final String email;
  final String dept;
  @override
  _StudentProfileEditState createState() => _StudentProfileEditState();
}

class _StudentProfileEditState extends State<StudentProfileEdit> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  String? loggedUser;

  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  SignUpController signUpController = Get.find();

  final name = TextEditingController();
  final gMail = TextEditingController();
  final emails = TextEditingController();
  final yr = TextEditingController();
  final adNo = TextEditingController();
  final dept = TextEditingController();
  getItemAndNavigate(BuildContext context) async {
    print(
        "-----------------------------------------------------------------$pickedFile");
    String imageUrl = "";
    if (pickedFile != null) {
      print(
          "-----------------------------------------------------------------$pickedFile");
      final ref = FirebaseStorage.instance
          .ref()
          .child('users')
          .child('$loggedUser.jpg');
      await ref.putFile(pickedFile!);
      imageUrl = await ref.getDownloadURL();
    }
    print(
        "-----------------------------------------------------------------$loggedUser");
    final details = _fireStore.collection("users").doc(loggedUser).update({
      "fullName": name.text,
      "GuardianMail": gMail.text,
      "Department": dept.text,
      "Year": yr.text,
      "AdmissionNumber": adNo.text,
      "UserPicture": imageUrl,
    });

    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => const StudentProfile())));
  }

  void getUserID() async {
    try {
      final users = await _auth.currentUser;
      if (users != null) {
        loggedUser = users.uid;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserID();
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
                    Center(
                      child: Stack(
                        children: [
                          const SizedBox(
                            width: 115,
                            height: 100,
                          ),
                          Obx(() => CircleAvatar(
                                radius: 55,
                                backgroundImage:
                                    signUpController.isProficPicPathSet.value ==
                                            true
                                        ? FileImage(File(signUpController
                                            .profilePicPath
                                            .value)) as ImageProvider
                                        : const AssetImage(
                                            'images/student-profile.png'),
                              )),
                          Positioned(
                            bottom: 6,
                            right: 3,
                            child: ClipOval(
                              child: Container(
                                height: 35,
                                width: 35,
                                color: const Color(0xff00B8B8),
                                child: InkWell(
                                  child: const Icon(
                                    Icons.camera_alt_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        backgroundColor:
                                            const Color(0xffF7FFE8),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(30),
                                          ),
                                        ),
                                        builder: (context) =>
                                            bottomSheet(context));
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 50, bottom: 10, left: 50, right: 50),
                      child: Formfield(
                        controllers: name,
                        hintText: "full name",
                        type: TextInputType.name,
                        initialValue: widget.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 10, left: 50, right: 50),
                      child: Formfield(
                        controllers: gMail,
                        hintText: "Guardian Email(Parent email)",
                        type: TextInputType.emailAddress,
                        initialValue: widget.email,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 50, right: 50),
                      child: Formfield(
                        controllers: emails,
                        hintText: "Email",
                        type: TextInputType.emailAddress,
                        initialValue: '',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Formfield(
                              initialValue: widget.dept,
                              controllers: dept,
                              hintText: "Department",
                              type: TextInputType.name,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Formfield(
                                controllers: yr,
                                hintText: "Year",
                                type: TextInputType.number,
                                initialValue: '',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 50, right: 50),
                      child: Formfield(
                        controllers: adNo,
                        hintText: "Admission number",
                        type: TextInputType.number,
                        initialValue: '',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, bottom: 15, right: 20),
                          child: TextButton(
                            onPressed: () => getItemAndNavigate(context),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          const Text(
            'Choose Profile Photo',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.image, size: 35),
                    ),
                    Text(
                      'Gallery',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  ],
                ),
                onTap: () {
                  takephoto(ImageSource.gallery);
                },
              ),
              const SizedBox(
                width: 70,
              ),
              InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.camera_alt, size: 35),
                    ),
                    Text(
                      'Camera',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )
                  ],
                ),
                onTap: () {
                  takephoto(ImageSource.camera);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> takephoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 20);
    pickedFile = File(pickedImage!.path);
    signUpController.setProfileImagePath(pickedFile!.path);
  }
}
