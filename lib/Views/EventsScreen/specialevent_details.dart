import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'Controller/specialevent_controller.dart';

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
            color: Color(0xFFFAF6E9),
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
                          color: Colors.black,
                          size: 30.r,

                        ),
                      ),
                      Spacer(),
                      Text(
                        'Special Events',
                        style: TextStyle(
                          fontSize: 30.r,
                          fontFamily: 'acme',
                          fontWeight: FontWeight.w500,

                          color: Colors.black,
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
                                  vertical: 10.r, horizontal: 15.r),
                              child: Text(
                                'Description',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'acme',
                                  fontSize: 25.r,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                        color: Colors.white,
                                        offset: Offset(2.r, 1.r),
                                        blurRadius: 3.r)
                                  ],
                                ),
                              ),
                            ),
                            _buildDescriptionCard(
                              title: eventItem.specialEvents[0]
                                  .description, // Or any other property from Tournament
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.r, horizontal: 15.r),
                              child: Text(
                                'SpecialEvent Data',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'acme',
                                  fontSize: 25.r,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                        color: Colors.white,
                                        offset: Offset(2.r, 1.r),
                                        blurRadius: 3.r)
                                  ],
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
                              ),
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
      padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(width: 4.r, color: Colors.grey),

        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 32.r,
            child: Image.network(
              images,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'acme',
              fontSize: 19.r,
              fontWeight: FontWeight.w400,
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
                fontFamily: 'acme',
                fontSize: 19.r,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
