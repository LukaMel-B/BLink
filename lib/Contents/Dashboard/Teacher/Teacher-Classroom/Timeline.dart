import 'package:flutter/material.dart';

import 'TeacherAttenceTabs.dart';
import 'TimeTableView.dart';

// import 'Teacher-Tab1.dart';
// import 'Teacher-Tab2.dart';

class Timeline extends StatefulWidget {
  const Timeline({Key? key}) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      height: 650,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Container(
              // height: 50,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xffE8F8E9), Color(0xffE2F5E8)]),
                  borderRadius: BorderRadius.circular(35)),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll) {
                  overScroll.disallowIndicator();
                  return true;
                },
                child: Center(
                  child: TabBar(
                    unselectedLabelColor: const Color(0xff4BA0A0),
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: const TextStyle(
                        fontFamily: 'Rockwell',
                        fontSize: 17,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600),
                    indicatorColor: Colors.white,
                    indicatorWeight: 2,
                    indicator: BoxDecoration(
                      color: const Color(0xff4FB4AD),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    controller: tabController,
                    tabs: const [
                      Tab(
                        text: 'Mon',
                      ),
                      Tab(
                        text: 'Tue',
                      ),
                      Tab(
                        text: 'Wed',
                      ),
                      Tab(
                        text: 'Thu',
                      ),
                      Tab(
                        text: 'Fri',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 10),
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    TimetableView(
                      subject: 'Java Programming',
                      subject2: 'Computer Networks',
                      subject3: 'Operating System',
                      subject4: 'Technical Writing',
                      subject5: 'Open Course',
                    ),
                    TimetableView(
                      subject: 'Java Programming',
                      subject2: 'Computer Networks',
                      subject3: 'Operating System',
                      subject4: 'Technical Writing',
                      subject5: 'Open Course',
                    ),
                    TimetableView(
                      subject: 'Java Programming',
                      subject2: 'Computer Networks',
                      subject3: 'Operating System',
                      subject4: 'Technical Writing',
                      subject5: 'Open Course',
                    ),
                    TimetableView(
                      subject: 'Java Programming',
                      subject2: 'Computer Networks',
                      subject3: 'Operating System',
                      subject4: 'Technical Writing',
                      subject5: 'Open Course',
                    ),
                    TimetableView(
                      subject: 'Java Programming',
                      subject2: 'Computer Networks',
                      subject3: 'Operating System',
                      subject4: 'Technical Writing',
                      subject5: 'Open Course',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
