import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'Controller/tournament_controller.dart';

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
                        'Tournaments',
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
          border: Border.all(width: 3.r, color: Colors.blueGrey),
          boxShadow: [
            BoxShadow(
                color: Colors.black, offset: Offset(6.r, 6.r), blurRadius: 10.r)
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: ListTile(
            onTap: onTap,
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'acme',
                fontSize: 21.r,
                fontWeight: FontWeight.w400,
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
                fontSize: 19.r,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            subtitle: Text(
              subtitle,
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
