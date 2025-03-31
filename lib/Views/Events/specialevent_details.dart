import 'package:dice_app/AdPlugin/Ads/Banner/BannerWrapper.dart';
import 'package:dice_app/AdPlugin/Ads/Native/NativeRN.dart';
import 'package:dice_app/res/common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Generated/assets.dart';
import 'Controller/events_controller.dart';

class SpecialEventScreen extends StatelessWidget {
  static const String routeName = '/SpecialEventScreen';

  SpecialEventScreen({super.key});
  final controller = Get.put(SpecialEventController());

  @override
  Widget build(BuildContext context) {
    return BannerWrapper(
      parentContext: context,
      child: Scaffold(
        body: Stack(
          children: [
            // Background Gradient
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.imagesBg), fit: BoxFit.fill),
              ),
            ),

            SafeArea(
              child: Column(
                children: [
                  // Header Section
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.r, horizontal: 15.r),
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
                          'Special Events',
                          style: TextStyle(
                            fontSize: 26.r,
                            fontFamily: 'VarelaRound',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),

                  // Event List Section
                  Expanded(
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return Center(
                          child: LoadingAnimationWidget.hexagonDots(
                            color: Colors.white,
                            size: 40.r,
                          ),
                        );
                      }
                      final specialevent = controller.event;

                      if (specialevent.isEmpty) {
                        return Center(
                          child: Text(
                            "No events available",
                            style: TextStyle(
                                fontSize: 20.r, color: Colors.black54),
                          ),
                        );
                      }
                      return ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: specialevent.length,
                        itemBuilder: (context, index) {
                          final eventItem = specialevent[index];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.r, horizontal: 10.r),
                                child: Text(
                                  'Description',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'VarelaRound',
                                    fontSize: 25.r,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Cards().descriptionCard(
                                title: eventItem.specialEvents[0]
                                    .description, // Or any other property from Tournament
                              ),
                              NativeRN(parentContext: context),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.r, horizontal: 10.r),
                                child: Text(
                                  'SpecialEvent Data',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'VarelaRound',
                                    fontSize: 25.r,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              for (var specialevent
                                  in eventItem.specialEvents[0].seData)
                                Cards().eventCard(
                                  images: specialevent.image,
                                  title: 'Name : ${specialevent.name}'
                                      "\n"
                                      'StartTime : ${specialevent.startTime}'
                                      "\n"
                                      'EndDate : ${specialevent.endDate}'
                                      "\n"
                                      'Duration : ${specialevent.duration}',
                                )
                            ],
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
