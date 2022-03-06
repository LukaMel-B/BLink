import 'package:blink/Contents/Dashboard/Teacher/Teacher-Class-Container.dart';
import 'package:flutter/material.dart';

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Row(
                  children: const [
                    ClassContainer(
                      image: 'images/Sem-1.png',
                      title: '1st Semester',
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    ClassContainer(
                      image: 'images/Sem-2.png',
                      title: '2nd Semester',
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
