import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'Controller/eventimages_controller.dart';

class EventImagesScreen extends StatefulWidget {
  static const String routeName = '/EventImagesScreen';
  const EventImagesScreen({super.key});

  @override
  State<EventImagesScreen> createState() => _EventImagesScreenState();
}

class _EventImagesScreenState extends State<EventImagesScreen> {
  final controller = Get.put(EventImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFFFAF6E9),
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
                          color: Colors.black,
                          size: 30.r,

                        ),
                      ),
                      Spacer(),
                      Text(
                        'Event Image',
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

                    final eventimage = controller.event;

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
                        final eventItem = eventimage[index];

                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              20.verticalSpace,
                              controller.eventImages.isEmpty
                                  ? SizedBox()
                                  : Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(19.r),
                                        border: Border.all(
                                            width: 4.r, color: Colors.grey),

                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        child: Image.network(
                                          controller.eventImages,
                                          height: 320.r,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                            ]);
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
