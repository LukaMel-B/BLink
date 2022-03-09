import 'package:flutter/material.dart';

const kTextFieldDecoration = BoxDecoration(
  gradient:
      LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
          // colors: [Color(0xffF6F9F0), Color(0xffB8D9D9)]),
          colors: [Color(0xffF9FFED), Color(0xffA4DADA)]),
);
const kTextFieldDecoration2 = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xffFAFFE8), Color(0xff94DFDF)]),
);
const kTextStyle = TextStyle(
// color: Colors.black87,
    color: Color(0xff282828),
    fontFamily: 'Roboto',
    fontSize: 45,
    fontWeight: FontWeight.w600);

final login = Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: const [
    Text(
      'Login',
      style: TextStyle(
          color: Color(0xffABAAAA),
          // color: Color(0xff388A75),
          fontFamily: 'Roboto',
          fontSize: 20),
    ),
    SizedBox(
      width: 40,
    )
  ],
);