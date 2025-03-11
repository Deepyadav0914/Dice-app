import 'package:dice_app/Generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Events/events_screen.dart';
import '../Faqs/faqs_Screen.dart';
import '../Origins/origins_screen.dart';
import '../Rewards/ddreward_screen.dart';
import '../Shield/shield_screen.dart';
import '../Stickers/stickers_screen.dart';
import '../Tokens/tokens_screen.dart';

class MenuScreen extends StatelessWidget {
  static const String routeName = '/MenuScreen';

  const MenuScreen({super.key});

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
                  Expanded(
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
                                border:
                                    Border.all(width: 4.r, color: Colors.grey),
                              ),
                              margin: EdgeInsets.symmetric(vertical: 7.r),
                              padding: EdgeInsets.all(8.r),
                              child: ListTile(
                                onTap: () {
                                  if (index == 0) {
                                    Get.toNamed(DDrewardScreen.routeName);
                                  } else if (index == 1) {
                                    Get.toNamed(StickersScreen.routeName);
                                  } else if (index == 2) {
                                    Get.toNamed(OriginsScreen.routeName);
                                  } else if (index == 3) {
                                    Get.toNamed(ShieldScreen.routeName);
                                  } else if (index == 4) {
                                    Get.toNamed(EventsScreen.routeName);
                                  } else if (index == 5) {
                                    Get.toNamed(TokensScreen.routeName);
                                  } else if (index == 6) {
                                    Get.toNamed(FaqsScreen.routeName);
                                  } else if (index == 7) {}
                                },
                                leading: Image(
                                  image: AssetImage(menulist.image),
                                  height: 50.r,
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
  final String image;
  final String name;

  AddListtile({required this.image, required this.name});
}

class MenuList {
  static final menuList = [
    AddListtile(name: 'DD Rewards', image: Assets.imagesRewards),
    AddListtile(name: 'Stickers', image: Assets.imagesStickers),
    AddListtile(name: 'Origins', image: Assets.imagesOrigins),
    AddListtile(name: 'Shield', image: Assets.imagesShield),
    AddListtile(name: 'Events', image: Assets.imagesEvents),
    AddListtile(name: 'Tokens', image: Assets.imagesTokens),
    AddListtile(name: 'Latest FAQs', image: Assets.imagesFaq),
    AddListtile(name: 'Settings', image: Assets.imagesSetting),
  ];
}
