import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'Controller/events_controller.dart';

class SpecialEventScreen extends StatefulWidget {
  static const String routeName = '/SpecialEventScreen';

  const SpecialEventScreen({super.key});

  @override
  State<SpecialEventScreen> createState() => _SpecialEventScreenState();
}

class _SpecialEventScreenState extends State<SpecialEventScreen> {
  final controller = Get.put(SpecialEventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0F2027),
                  Color(0xFF203A43),
                  Color(0xFF2C5364)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
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
                          size: 40.sp,
                        ),
                      );
                    }
                    final specialevent = controller.event;

                    if (specialevent.isEmpty) {
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
                            _buildDescriptionCard(
                              title: eventItem.specialEvents[0]
                                  .description, // Or any other property from Tournament
                            ),
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
                              _buildEventCard(
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
    );
  }

  Widget _buildEventCard({required String title, required String images}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 10.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(width: 4.r, color: Colors.grey),
        ),
        child: ListTile(
          leading: images.isEmpty
              ? SizedBox()
              : CachedNetworkImage(
                  imageUrl: images,
                  placeholder: (context, url) =>
                      LoadingAnimationWidget.threeArchedCircle(
                    color: Colors.grey,
                    size: 20.r,
                  ),
                ),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'VarelaRound',
              fontSize: 16.r,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDescriptionCard({required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(width: 4.r, color: Colors.grey),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 18.r,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
