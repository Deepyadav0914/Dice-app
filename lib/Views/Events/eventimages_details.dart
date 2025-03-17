import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Generated/assets.dart';
import 'Controller/events_controller.dart';

class EventImagesScreen extends StatelessWidget {
  static const String routeName = '/EventImagesScreen';

  EventImagesScreen({super.key});

  final controller = Get.put(EventImageController());

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
                        'Event Image',
                        style: TextStyle(
                          fontSize: 26.r,
                          fontFamily: 'VarelaRound',
                          fontWeight: FontWeight.bold,
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

                    var eventimage = controller.event[0].eventImages;

                    if (eventimage.isEmpty) {
                      return Center(
                        child: Text(
                          "No events available",
                          style:
                              TextStyle(fontSize: 20.r, color: Colors.black54),
                        ),
                      );
                    }
                    return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: eventimage.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.r, vertical: 8.r),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                eventimage[index].isEmpty
                                    ? SizedBox()
                                    : Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(19.r),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          child: CachedNetworkImage(
                                            imageUrl: eventimage[index],
                                            fit: BoxFit.fill,
                                            progressIndicatorBuilder:
                                                (context, url, progress) =>
                                                    CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                              ]),
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
    );
  }
}
