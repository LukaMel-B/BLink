import 'package:flutter/material.dart';

import 'Parent-Tab1.dart';
import 'Parent-Tab2.dart';
import 'Parent-Tab3.dart';
import 'Parent-Tab4.dart';

class ParentToggleBar extends StatefulWidget {
  const ParentToggleBar({Key? key}) : super(key: key);

  @override
  State<ParentToggleBar> createState() => _ParentToggleBarState();
}

class _ParentToggleBarState extends State<ParentToggleBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
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
      child: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            // height: 50,
            width: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffE8F8E9), Color(0xffE2F5E8)]),
                borderRadius: BorderRadius.circular(35)),
            child: Column(
              children: [
                TabBar(
                  unselectedLabelColor: const Color(0xff4BA0A0),
                  labelColor: Colors.white,
                  labelStyle: const TextStyle(
                      fontFamily: 'Rockwell',
                      fontSize: 13.5,
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
                      text: 'English',
                    ),
                    Tab(
                      text: 'Java',
                    ),
                    Tab(
                      text: 'Android',
                    ),
                    Tab(
                      text: 'PHP',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                ParentTab1(),
                ParentTab2(),
                ParentTab3(),
                ParentTab4(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
