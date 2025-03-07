import 'package:dice_app/Generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../Api/api_calling.dart';
import '../Events/events_screen.dart';
import '../Faqs/faqs_Screen.dart';
import '../Origins/origins_screen.dart';
import '../Rewards/ddreward_screen.dart';
import '../Shield/shield_screen.dart';
import '../Stickers/stickers_screen.dart';
import '../Tokens/tokens_screen.dart';

class MenuScreen extends StatelessWidget {
  static const String routeName = '/MenuScreen';

  MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesBg), fit: BoxFit.fill),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.r, vertical: 15.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'VarelaRound',
                            fontWeight: FontWeight.bold,
                            fontSize: 28.r,
                          ),
                        ),
                        Icon(
                          Icons.account_circle,
                          size: 45,
                          color: Colors.white,
                        ),
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
                                      image: DecorationImage(
                                          image: AssetImage(Assets.imagesList),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(20.r),
                                      border: Border.all(
                                          width: 4.r, color: Colors.grey),
                                    ),
                                    margin: EdgeInsets.symmetric(vertical: 7.r),
                                    padding: EdgeInsets.all(8.r),
                                    child: ListTile(
                                      onTap: () {
                                        if (index == 0) {
                                          //Get.toNamed(DDrewardScreen.routeName);
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
                                        color: Colors.grey.shade800,
                                        menulist.icon,
                                      ),
                                      title: Text(
                                        menulist.name.toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'VarelaRound',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.r,
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
