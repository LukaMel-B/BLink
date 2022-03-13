import 'package:blink/Contents/Functions/const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StudentProgressPremium extends StatefulWidget {
  const StudentProgressPremium({Key? key}) : super(key: key);

  @override
  State<StudentProgressPremium> createState() => _StudentProgressPremiumState();
}

class _StudentProgressPremiumState extends State<StudentProgressPremium> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: kTextFieldDecoration,
          child: Expanded(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 6, bottom: 0, right: 15),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_rounded,
                              size: 35, color: Color(0xff34a3a3)),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      const Text(
                        'Progress',
                        style: TextStyle(
                            color: Colors.black87,
                            // color: Color(0xff388A75),
                            fontFamily: 'Rockwell',
                            fontSize: 33,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 600,
                  child: Center(
                    child: SizedBox(
                      width: 600,
                      height: 600,
                      child: Lottie.network(
                          'https://assets4.lottiefiles.com/packages/lf20_zfnsfbks.json',
                          animate: true),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
