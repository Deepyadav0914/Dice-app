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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.blueGrey],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
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
                          color: Colors.blueGrey[500],
                          size: 30.r,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                offset: Offset(1.r, 1.r),
                                blurRadius: 3.r)
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Event Image',
                        style: TextStyle(
                          fontSize: 30.r,
                          fontFamily: 'acme',
                          fontWeight: FontWeight.w500,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                offset: Offset(1.r, 1.r),
                                blurRadius: 3.r)
                          ],
                          color: Colors.blueGrey[500],
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
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(19.r),
                                  border: Border.all(width: 4.r, color: Colors.white10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(7.r, 6.r),
                                      blurRadius: 8.r,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.r),
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
