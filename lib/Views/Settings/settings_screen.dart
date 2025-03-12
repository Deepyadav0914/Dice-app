import 'package:dice_app/Generated/assets.dart';
import 'package:dice_app/Views/Settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';

class SettingScreen extends StatelessWidget {
  static const String routeName = '/SettingScreen';

  SettingScreen({super.key});

  final SettingsController controller = Get.put(SettingsController());

  // rate us method
  Future<void> requestReview() async {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 28.r,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 26.r,
                            fontFamily: 'VarelaRound',
                          ),
                        ),
                        Spacer(),
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
                                onTap: () async {
                                  if (index == 0) {
                                    controller.launchURL(
                                        context, controller.url);
                                  } else if (index == 1) {
                                    controller.launchURL(
                                        context, controller.url);
                                  } else if (index == 2) {
                                  } else if (index == 3) {
                                    requestReview();
                                  }
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
    AddListtile(name: 'Privacy Policy', image: Assets.imagesPrivacy),
    AddListtile(name: 'Contact Us', image: Assets.imagesContact),
    AddListtile(name: 'Share', image: Assets.imagesShare),
    AddListtile(name: 'Rate Us', image: Assets.imagesRate),
  ];
}
