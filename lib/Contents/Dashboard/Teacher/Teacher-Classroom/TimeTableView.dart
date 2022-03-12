import 'package:blink/Contents/Functions/const.dart';
import 'package:flutter/material.dart';

class TimetableView extends StatelessWidget {
  final String subject;
  final String subject2;
  final String subject3;
  final String subject4;
  final String subject5;
  const TimetableView(
      {Key? key,
      required this.subject,
      required this.subject2,
      required this.subject3,
      required this.subject4,
      required this.subject5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '1',
                  style: timetablenum,
                ),
                Container(
                  width: 240,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      subject,
                      style: timetabletext,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '2',
                  style: timetablenum,
                ),
                Container(
                  width: 240,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      subject2,
                      style: timetabletext,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '3',
                  style: timetablenum,
                ),
                Container(
                  width: 240,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      subject3,
                      style: timetabletext,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '4',
                  style: timetablenum,
                ),
                Container(
                  width: 240,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      subject4,
                      style: timetabletext,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '5',
                  style: timetablenum,
                ),
                Container(
                  width: 240,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      subject5,
                      style: timetabletext,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
