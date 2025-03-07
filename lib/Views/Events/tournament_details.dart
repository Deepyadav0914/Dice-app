import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'Controller/events_controller.dart';

class TournamentScreen extends StatefulWidget {
  const TournamentScreen({super.key});

  @override
  State<TournamentScreen> createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  final controller = Get.put(TournamentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                        'Tournaments',
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
                          size: 40.sp,
                        ),
                      );
                    }

                    final tournaments = controller.event;

                    if (tournaments.isEmpty) {
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
                      itemCount: tournaments.length,
                      itemBuilder: (context, index) {
                        final eventItem = tournaments[index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7.r, horizontal: 15.r),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.r, horizontal: 15.r),
                              child: Text(
                                'Description',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'VarelaRound',
                                  fontSize: 24.r,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            _buildEventCard(
                              title: eventItem.tournaments[0]
                                  .description, // Or any other property from Tournament
                              onTap: () {},
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.r, horizontal: 15.r),
                              child: Text(
                                'Tournament Data',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'VarelaRound',
                                  fontSize: 24.r,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            for (var tournament
                                in eventItem.tournaments[0].tData)
                              _buildTDataCard(
                                title: 'Name : ${tournament.name}  ',
                                subtitle: 'Time : ${tournament.time} ',
                                onTap: () {},
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
          border: Border.all(width: 4.r, color: Colors.grey),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: ListTile(
            onTap: onTap,
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

  Widget _buildTDataCard(
      {required String title,
      required String subtitle,
      required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.r),
          border: Border.all(width: 4.r, color: Colors.grey),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: ListTile(
            onTap: onTap,
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 18.r,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            subtitle: Text(
              subtitle,
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
