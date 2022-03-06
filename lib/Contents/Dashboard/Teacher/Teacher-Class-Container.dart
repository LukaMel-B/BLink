import 'package:flutter/material.dart';

class ClassContainer extends StatelessWidget {
  final String image;
  final String title;
  const ClassContainer({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 146,
        width: 136,
        decoration: BoxDecoration(
          color: const Color(0xffECF5F3),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 103.59,
              width: 103.59,
            ),
            const Divider(
              height: 0,
              thickness: 1.5,
              color: Color(0xff74AA9C),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13),
              child: Text(
                title,
                style: const TextStyle(
                    fontFamily: 'Rockwell',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
