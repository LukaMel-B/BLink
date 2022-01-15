import 'package:flutter/material.dart';
import 'Contents//home.dart';
import 'Contents//student.dart';
import 'Contents//teacher.dart';
import 'Contents//parent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => landing(),
          '/student': (context) => const student1(),
          '/teacher': (context) => const teacher1(),
          '/parent': (context) => const parent1(),

        });
  }
}
