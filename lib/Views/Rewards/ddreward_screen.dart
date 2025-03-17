import 'package:dice_app/Generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../main.dart';
import 'Controller/ddreward_controller.dart';
import 'ddreward_details_screen.dart';

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
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesBg), fit: BoxFit.fill),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 15.r),
            child: Column(
              children: [
                Row(
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
                    const Spacer(),
                    Text(
                      'Daily Rewards',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26.r,
                        fontFamily: 'VarelaRound',
                      ),
                    ),
                    const Spacer(),
                  ],
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
                    } else if (controller.rewardData.value == null ||
                        controller.rewardData.value.diceCode.isEmpty) {
                      return Center(
                        child: Text(
                          "No rewards available.",
                          style:
                              TextStyle(fontSize: 18.r, color: Colors.black54),
                        ),
                      );
                    }

                    final groupedData = <String, List>{};
                    for (var item in controller.rewardData.value.diceCode) {
                      final date = controller.formatDate(int.parse(item.date));
                      groupedData.putIfAbsent(date, () => []).add(item);
                    }

                    final claimedRewards =
                        box.read<Map<String, dynamic>>('claimedRewards') ?? {};

                    return ListView.builder(
                      padding:
                          EdgeInsets.symmetric(vertical: 7.r, horizontal: 10.r),
                      itemCount: groupedData.keys.length,
                      itemBuilder: (context, index) {
                        final date = groupedData.keys.elementAt(index);
                        final data = groupedData[date]!;
                        //  print(data);

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.r),
                              child: Text(
                                date,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.r,
                                  fontFamily: 'VarelaRound',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ...data.asMap().entries.map((entry) {
                              final reward = entry.value;

                              final rewardKey =
                                  "${reward.name}_${date}_${entry.key}";
                              final isClaimed =
                                  claimedRewards[rewardKey] ?? false;

                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(Assets.imagesList),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(20.r),
                                  border: Border.all(
                                      width: 4.r, color: Colors.grey),
                                ),
                                margin: EdgeInsets.symmetric(vertical: 8.r),
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(8.r),
                                  leading: Image.asset(
                                    Assets.imagesLogo,
                                    fit: BoxFit.fill,
                                  ),
                                  title: Text(
                                    reward.name,
                                    style: TextStyle(
                                      fontFamily: 'VarelaRound',
                                      fontSize: 18.r,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  trailing: Container(
                                    width: 100.r,
                                    height: 35.r,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade700,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      isClaimed ? 'Claimed' : 'Claim',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.r,
                                        fontFamily: 'VarelaRound',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Get.to(() => const DDRewardDetailScreen(),
                                        arguments: {
                                          'data': reward,
                                          'date': date,
                                          'index': entry.key
                                        })?.then((_) {
                                      setState(() {});
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          ],
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
