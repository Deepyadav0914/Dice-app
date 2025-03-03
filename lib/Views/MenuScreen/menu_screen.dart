import 'package:dice_app/Views/DDRewardsScreen/ddreward_screen.dart';
import 'package:dice_app/Views/EventsScreen/events_screen.dart';
import 'package:dice_app/Views/FaqsScreen/faqs_Screen.dart';
import 'package:dice_app/Views/OriginsScreen/origins_screen.dart';
import 'package:dice_app/Views/ShieldScreen/shield_screen.dart';
import 'package:dice_app/Views/StickersScreen/Controller/stickers_controller.dart';
import 'package:dice_app/Views/StickersScreen/stickers_screen.dart';
import 'package:dice_app/Views/TokenScreen/tokens_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../Api/api_calling.dart';
import 'Controller/menu_controller.dart';

class MenuScreen extends StatelessWidget {
  // static const String routeName = '/MenuScreen';

  MenuScreen({super.key});

  final controller = Get.put(MainMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFFFAF6E9),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Welcome',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold)),
                        Icon(Icons.account_circle, size: 35),
                      ],
                    ),
                  ),
                  FutureBuilder(
                    future: ApiCall().diceData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: MenuList.menuList.length,
                            padding: EdgeInsets.symmetric(
                                vertical: 15.r, horizontal: 15.r),
                            itemBuilder: (context, index) {
                              var menulist = MenuList.menuList[index];
                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.r),
                                      border: Border.all(
                                          width: 4.r, color: Colors.grey),
                                    ),
                                    margin: EdgeInsets.symmetric(vertical: 7.r),
                                    padding: EdgeInsets.all(8.r),
                                    child: ListTile(
                                      onTap: () {
                                        if (index == 0) {
                                          Get.to(() => DDrewardScreen());
                                        } else if (index == 1) {
                                          Get.to(() => StickersScreen());
                                        } else if (index == 2) {
                                          Get.to(() => OriginsScreen());
                                        } else if (index == 3) {
                                          Get.to(() => ShieldScreen());
                                        } else if (index == 4) {
                                          Get.to(() => EventsScreen());
                                        } else if (index == 5) {
                                          Get.to(() => TokensScreen());
                                        } else if (index == 6) {
                                          Get.to(() => FaqsScreen());
                                        } else if (index == 7) {}
                                      },
                                      leading: Icon(
                                        size: 32.r,
                                        color: Colors.grey.shade600,
                                        menulist.icon,
                                      ),
                                      title: Text(
                                        menulist.name.toString(),
                                        style: TextStyle(
                                          fontFamily: 'acme',
                                          fontSize: 23.r,
                                          shadows: [
                                            Shadow(
                                                color: Colors.white,
                                                offset: Offset(2.r, 1.r),
                                                blurRadius: 3.r)
                                          ],
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddListtile {
  final IconData icon;
  final String name;

  AddListtile({required this.icon, required this.name});
}

class MenuList {
  static final menuList = [
    AddListtile(icon: LucideIcons.gift, name: 'DD Rewards'),
    AddListtile(icon: LucideIcons.star, name: 'Stickers'),
    AddListtile(icon: LucideIcons.book, name: 'Origins'),
    AddListtile(icon: LucideIcons.shield, name: 'Shield'),
    AddListtile(icon: LucideIcons.hotel, name: 'Events'),
    AddListtile(icon: LucideIcons.coins, name: 'Tokens'),
    AddListtile(icon: LucideIcons.helpCircle, name: 'Latest FAQs'),
    AddListtile(icon: LucideIcons.settings, name: 'Settings'),
  ];
}
