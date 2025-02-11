import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../repository/background_layout.dart';

class MainMenu extends StatelessWidget {
  String Acme = 'acme';

  final List<Map<String, dynamic>> menuItems = [
    {
      "icon": LucideIcons.gift,
      "label": "MM Rewards",
      "action": () => print("MM Rewards clicked!")
    },
    {
      "icon": LucideIcons.star,
      "label": "Top GIFs",
      "action": () => print("Top GIFs clicked!")
    },
    {
      "icon": LucideIcons.book,
      "label": "Tips & Tricks",
      "action": () => print("Tips & Tricks clicked!")
    },
    {
      "icon": LucideIcons.helpCircle,
      "label": "Latest FAQs",
      "action": () => print("Latest FAQs clicked!")
    },
    {
      "icon": LucideIcons.barChart2,
      "label": "Statistics",
      "action": () => print("Statistics clicked!")
    },
    {
      "icon": LucideIcons.barChart2,
      "label": "Statistics",
      "action": () => print("Statistics clicked!")
    },
    {
      "icon": LucideIcons.barChart2,
      "label": "Statistics",
      "action": () => print("Statistics clicked!")
    },
    {
      "icon": LucideIcons.barChart2,
      "label": "Statistics",
      "action": () => print("Statistics clicked!")
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF8EC5FC), Color(0xFFE0C3FC)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: CustomPaint(
            size: MediaQuery.of(context).size,
            painter: CheckeredPainter(),
          ),
        ),

        SafeArea(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                10.verticalSpace,
                Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'acme',
                    fontSize: 35.r,
                    shadows: [
                      Shadow(
                          color: Colors.white,
                          offset: Offset(2.r, 1.r),
                          blurRadius: 3.r)
                    ],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.verticalSpace,
                ...menuItems.map((item) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: GestureDetector(
                        onTap: item['action'],
                        child: Container(
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black87,
                                blurRadius: 5,
                                offset: Offset(4, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(item['icon'],
                                      color: Colors.blueGrey, size: 40),
                                  SizedBox(width: 16.0),
                                  Text(
                                    item['label'],
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'acme',
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  color: Colors.blueGrey, size: 25),
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
