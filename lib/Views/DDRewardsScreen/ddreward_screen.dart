import 'package:dice_app/Generated/assets.dart';
import 'package:dice_app/Views/DDRewardsScreen/ddreward_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'Controller/ddreward_controller.dart';

class DDrewardScreen extends StatefulWidget {
   static const String routeName = '/DDrewardScreen';

  const DDrewardScreen({super.key});

  @override
  State<DDrewardScreen> createState() => _DDrewardScreenState();
}

class _DDrewardScreenState extends State<DDrewardScreen> {
  final controller = Get.put(DDrewardController());

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
                        'DD Reward',
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
                    } else {
                      final groupedData = <String, List>{};
                      for (var item in controller.rewardData.value.diceCode) {
                        final date =
                            controller.formatDate(int.parse(item.date));
                        if (groupedData.containsKey(date)) {
                          groupedData[date]!.add(item);
                        } else {
                          groupedData[date] = [item];
                        }
                      }

                      return ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: groupedData.keys.length,
                        itemBuilder: (context, index) {
                          final date = groupedData.keys.elementAt(index);
                          final data = groupedData.values.elementAt(index);

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.r, horizontal: 15.r),
                                child: Text(
                                  date,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'acme',
                                    fontSize: 25.r,
                                    shadows: [
                                      Shadow(
                                          color: Colors.white,
                                          offset: Offset(2.r, 1.r),
                                          blurRadius: 3.r)
                                    ],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ...data.map((reward) => Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.r, horizontal: 15.r),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(22.r),
                                        border: Border.all(
                                            width: 3.r, color: Colors.blueGrey),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black,
                                            offset: Offset(6.r, 6.r),
                                            blurRadius: 10.r,
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.r),
                                        child: ListTile(
                                          onTap: () {
                                            Get.to(() => DDRewardDetailScreen(),
                                                arguments: {
                                                  'data': reward,
                                                  'date': date,
                                                  'index': index
                                                })?.then(
                                              (_) {
                                                setState(() {});
                                              },
                                            );
                                          },
                                          leading: Image.asset(
                                            Assets.imagesDice,
                                            height: 36.r,
                                            color: Colors.blueGrey[800],

                                          ),
                                          title: Text(
                                            reward.name.toString(),
                                            style: TextStyle(
                                              fontFamily: 'acme',
                                              fontSize: 25.r,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.blueGrey,
                                              size: 25.r),
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          );
                        },
                      );
                    }
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
