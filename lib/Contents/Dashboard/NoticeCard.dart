import 'package:flutter/material.dart';

class NoticeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String teacher;
  final String sub;
  final String image;
  final String time;
  const NoticeCard(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.teacher,
      required this.sub,
      required this.image,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Container(
          height: 180,
          width: 136,
          decoration: BoxDecoration(
            color: const Color(0xffECF5F3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'Rockwell',
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Color(0xff716A6A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 17,
                      fontFamily: 'Rockwell',
                      color: Color(0xff716A6A),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 0,
                thickness: 1.1,
                color: Color(0xff4D907F),
              ),
              Image.asset(
                image,
                height: 102,
                width: 106,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    teacher,
                    style: const TextStyle(
                      fontSize: 17,
                      fontFamily: 'Rockwell',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
