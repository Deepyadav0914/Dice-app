import 'package:dice_app/Views/Shield/shield_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Generated/assets.dart';
import 'Controller/shield_screen_controller.dart';

class ShieldScreen extends StatefulWidget {
  static const String routeName = '/ShieldScreen';
  const ShieldScreen({super.key});

  @override
  State<ShieldScreen> createState() => _ShieldScreenState();
}

class _ShieldScreenState extends State<ShieldScreen> {
  final controller = Get.put((ShieldController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesBg), fit: BoxFit.fill),
          ),
        ),
        SafeArea(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 15.r),
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
                    'Shield',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'VarelaRound',
                      fontWeight: FontWeight.bold,
                      fontSize: 26.r,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: LoadingAnimationWidget.hexagonDots(
                      color: Colors.white,
                      size: 40.sp,
                    ),
                  );
                }
                final data = controller.ShieldData.value.shieldData;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.r, horizontal: 15.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Assets.imagesList), fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(20.r),
                              border:
                                  Border.all(width: 4.r, color: Colors.grey),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(7.r),
                              child: ListTile(
                                onTap: () {
                                  Get.to(() => ShieldsDetailScreen(),
                                      arguments: {
                                        'item': item,
                                        'index': index
                                      })?.then(
                                    (_) {
                                      setState(() {});
                                    },
                                  );
                                },
                                title: Text(
                                  item.name.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'VarelaRound',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.r,
                                  ),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios,
                                    color: Colors.white, size: 25.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            )
          ]),
        ),
      ]),
    );
  }
}
