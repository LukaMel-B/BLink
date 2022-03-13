import 'package:flutter/material.dart';

class ParentTab4 extends StatelessWidget {
  const ParentTab4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 450,
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: ((context) => const StudentAssignmentView())));
              },
              child: Row(
                children: const [
                  Icon(Icons.chat, size: 35, color: Color(0xff299A97)),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Chat',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Rockwell',
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.67),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w800)),
            ),
            const SizedBox(
              width: 25,
            )
          ],
        )
      ],
    );
  }
}
