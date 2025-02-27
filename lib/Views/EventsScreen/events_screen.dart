import 'package:dice_app/Views/EventsScreen/specialevent_details.dart';
import 'package:dice_app/Views/EventsScreen/tournament_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'Controller/events_controller.dart';
import 'eventimages_details.dart';


class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final controller = Get.put(EventsController());

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
                        'Events',
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
                    final eventsList = controller.eventsData.value.eventData;
                    if (eventsList.isEmpty) {
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
                      itemCount: eventsList.length,
                      itemBuilder: (context, index) {
                        final event = eventsList[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.r, horizontal: 15.r),
                              child: Text(
                                event.eventDate.toString(),
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
                            _buildEventCard(
                              title: 'Tournaments',
                              onTap: () => Get.to(() => TournamentScreen(),
                                  arguments: {'event': event, 'index': index}),
                            ),
                            _buildEventCard(
                              title: 'Event Images',
                              onTap: () => Get.to(() => EventImagesScreen(),
                                  arguments: {'event': event, 'index': index}),
                            ),
                            _buildEventCard(
                              title: 'Special Events',
                              onTap: () => Get.to(() => SpecialEventScreen(),
                                  arguments: {'event': event, 'index': index}),
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

  Widget _buildEventCard({required String title, required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(width: 3.r, color: Colors.blueGrey),
          boxShadow: [
            BoxShadow(
                color: Colors.black, offset: Offset(6.r, 6.r), blurRadius: 10.r)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: ListTile(
            onTap: onTap,
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'acme',
                fontSize: 22.r,
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
