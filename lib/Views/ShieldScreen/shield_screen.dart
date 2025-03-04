import 'package:dice_app/Views/ShieldScreen/Controller/shield_screen_controller.dart';
import 'package:dice_app/Views/ShieldScreen/shield_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ShieldScreen extends StatefulWidget {
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
          color: Color(0xFFFAF6E9),
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
                      color: Colors.black,
                      size: 30.r,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Shield',
                    style: TextStyle(
                      fontSize: 30.r,
                      fontFamily: 'ReemKufi',
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
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
                              color: Colors.white,
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
                                    fontFamily: 'VarelaRound',
                                    fontSize: 21.r,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios,
                                    color: Colors.black, size: 25.r),
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
