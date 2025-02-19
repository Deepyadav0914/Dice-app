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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.blueGrey],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Text(
                    "Home",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontFamily: 'acme',
                      fontSize: 30.r,
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(1.r, 1.r),
                            blurRadius: 3.r)
                      ],
                      fontWeight: FontWeight.w500,
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
                                          width: 3.r, color: Colors.blueGrey),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: Offset(6.r, 6.r),
                                          blurRadius: 10.r,
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.symmetric(vertical: 8.r),
                                    padding: EdgeInsets.all(12.r),
                                    child: ListTile(
                                      onTap: () {
                                        if (index == 0) {
                                          Get.to(() => DDrewardScreen());
                                        } else if (index == 1) {
                                          Get.to(() => StickersScreen());

                                        } else if (index == 2) {
                                          Get.to(() => OriginsScreen());
                                        } else if (index == 3) {
                                          Get.to(() =>
                                              ShieldScreen());
                                        } else if (index == 4) {
                                          Get.to(() =>
                                              EventsScreen());
                                        } else if (index == 5) {
                                          Get.to(() =>
                                              TokensScreen());
                                        } else if (index == 6) {
                                          Get.to(() =>
                                              FaqsScreen());
                                        } else if (index == 7) {
                                          // Get.to(() => DataScreen(),
                                          //     arguments: {
                                          //       'data':
                                          //       alldata![index - 7]
                                          //           .data,
                                          //       'name': alldata[index - 7]
                                          //           .name
                                          //     });
                                        }
                                      },
                                      leading: Icon(
                                        size: 35.r,
                                        color: Colors.blueGrey,
                                        menulist.icon,
                                      ),
                                      title: Text(
                                        menulist.name.toString(),
                                        style: TextStyle(
                                          fontFamily: 'acme',
                                          fontSize: 25.r,
                                          shadows: [
                                            Shadow(
                                                color: Colors.white,
                                                offset: Offset(2.r, 1.r),
                                                blurRadius: 3.r)
                                          ],
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      trailing: Icon(Icons.arrow_forward_ios,
                                          color: Colors.blueGrey, size: 25.r),
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
