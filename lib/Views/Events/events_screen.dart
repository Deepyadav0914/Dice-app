import 'package:dice_app/AdPlugin/Ads/Banner/BannerWrapper.dart';
import 'package:dice_app/AdPlugin/Ads/FullScreen/Ads.dart';
import 'package:dice_app/AdPlugin/Ads/Native/NativeRN.dart';
import 'package:dice_app/Views/Events/specialevent_details.dart';
import 'package:dice_app/Views/Events/tournament_details.dart';
import 'package:dice_app/res/common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Generated/assets.dart';
import 'Controller/events_controller.dart';
import 'eventimages_details.dart';

class EventsScreen extends StatelessWidget {
  static const String routeName = '/EventsScreen';

  EventsScreen({super.key});

  final controller = Get.put(EventsController());

  @override
  Widget build(BuildContext context) {
    return BannerWrapper(
      parentContext: context,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.imagesBg), fit: BoxFit.fill),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
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
                          'Events',
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
                      final eventsList = controller.eventsData.value.eventData;
                      if (eventsList.isEmpty) {
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
                        itemCount: eventsList.length,
                        itemBuilder: (context, index) {
                          final event = eventsList[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              index == 1
                                  ? NativeRN(parentContext: context)
                                  : SizedBox(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.r, horizontal: 15.r),
                                child: Text(
                                  event.eventDate.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'VarelaRound',
                                    fontSize: 22.r,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Cards().buildEventCard(
                                  title: 'Tournaments',
                                  onTap: () => AdsRN().showFullScreen(
                                        context: context,
                                        onComplete: () {
                                          Get.to(() => TournamentScreen(),
                                              arguments: {
                                                'event': event,
                                                'index': index
                                              });
                                        },
                                      )),
                              event.eventImages[0].isEmpty
                                  ? SizedBox()
                                  : Cards().buildEventCard(
                                      title: 'Event Images',
                                      onTap: () => AdsRN().showFullScreen(
                                            context: context,
                                            onComplete: () {
                                              Get.to(() => EventImagesScreen(),
                                                  arguments: {
                                                    'event': event,
                                                    'index': index
                                                  });
                                            },
                                          )),
                              Cards().buildEventCard(
                                  title: 'Special Events',
                                  onTap: () => AdsRN().showFullScreen(
                                        context: context,
                                        onComplete: () {
                                          Get.to(() => SpecialEventScreen(),
                                              arguments: {
                                                'event': event,
                                                'index': index
                                              });
                                        },
                                      )),
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
