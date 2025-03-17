import 'package:dice_app/res/common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Generated/assets.dart';
import 'Controller/events_controller.dart';

class TournamentScreen extends StatelessWidget {
  static const String routeName = '/TournamentScreen';

  TournamentScreen({super.key});

  final controller = Get.put(TournamentController());

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
                          size: 40.r,
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
                            Cards().tEventCard(
                              title: eventItem.tournaments[0]
                                  .description, // Or any other property from Tournament
                              onTap: () {},
                            ),
                            eventItem.tournaments[0].tData[0].name.isEmpty
                                ? SizedBox()
                                : Padding(
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
                              eventItem.tournaments[0].tData[0].name.isEmpty
                                  ? SizedBox()
                                  : Cards().tDataCard(
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
}
