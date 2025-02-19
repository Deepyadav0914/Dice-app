import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Generated/assets.dart';
import '../../main.dart';
import 'Controller/ddreward_details_controller.dart';

class DDRewardDetailScreen extends StatefulWidget {
  const DDRewardDetailScreen({super.key});

  @override
  State<DDRewardDetailScreen> createState() => _DDRewardDetailScreenState();
}

class _DDRewardDetailScreenState extends State<DDRewardDetailScreen> {
  final DDRewardDetailController controller =
      Get.put(DDRewardDetailController());

  @override
  Widget build(BuildContext context) {
    final claimedRewards =
        box.read<Map<String, dynamic>>('claimedRewards') ?? {};
    String uniqueKey =
        "${controller.name}_${controller.date}_${controller.index}";
    bool isClaime = claimedRewards[uniqueKey] ?? false;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.blueGrey],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 15.r),
              child: Column(
                children: [
                  Row(
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
                          color: Colors.blueGrey[500],
                          fontWeight: FontWeight.w500,
                          fontSize: 30.r,
                          fontFamily: 'acme',
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                offset: Offset(1.r, 1.r),
                                blurRadius: 3.r)
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  10.verticalSpace,
                  Center(
                    child: Image.asset(
                      Assets.imagesReward,
                      height: 260.r,
                    ),
                  ),
                  Text(
                    controller.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'acme',
                      fontSize: 28.r,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            color: Colors.white,
                            offset: Offset(1.r, 1.r),
                            blurRadius: 3.r)
                      ],
                    ),
                  ),
                  10.verticalSpace,
                  Text(
                    controller.formattedDate,
                    style: TextStyle(
                      fontSize: 28.r,
                      fontFamily: 'acme',
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            color: Colors.white,
                            offset: Offset(1.r, 1.r),
                            blurRadius: 3.r)
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    controller.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.r,
                      fontFamily: 'acme',
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            color: Colors.white,
                            offset: Offset(1.r, 1.r),
                            blurRadius: 3.r)
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(
                        isClaime ? 'Claimed' : 'Claim',
                        isClaime
                            ? null
                            : () {
                                Get.dialog(
                                  AlertDialog(
                                    title: Text('Confirm Claim'),
                                    content: Text(
                                        'Are you sure you want to claim this reward?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Get.back(),
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            claimedRewards[uniqueKey] = true;
                                            box.write("claimedRewards",
                                                claimedRewards);
                                          });

                                          Get.back();
                                          Get.snackbar(
                                            "Success!",
                                            "You have collected ${controller.rewardCoins} coins!",
                                            snackPosition: SnackPosition.TOP,
                                            icon: Icon(Icons.done_outline,
                                                color: Colors.white),
                                            duration:
                                                const Duration(seconds: 3),
                                            backgroundColor: Colors.green,
                                            colorText: Colors.white,
                                          );
                                        },
                                        child: Text('Claim'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                      ),
                      15.horizontalSpace,
                      _buildActionButton('Share', () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, VoidCallback? onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown[400],
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(2.r, 6.r),
            blurRadius: 4.r,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 4.r),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(),
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 3.r)),
          margin: EdgeInsets.all(3.r),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 30.r),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 24.r,
                  fontFamily: 'acme',
                  color: onPressed == null ? Colors.grey : Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
