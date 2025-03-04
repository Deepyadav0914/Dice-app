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
            color: Color(0xFFFAF6E9),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
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
                        'DD Reward',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 30.r,
                          fontFamily: 'ReemKufi',
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Center(
                    child: Image.asset(
                      Assets.imagesDice,
                      color: Colors.grey[700],
                      height: 150.r,
                    ),
                  ),
                  Center(
                    child: Text(
                      controller.name,
                      style: TextStyle(
                        fontSize: 25.r,
                        fontFamily: 'VarelaRound',
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
                  ),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(width: 4.r, color: Colors.grey),
                      ),
                      margin: EdgeInsets.all(4.r),
                      padding: EdgeInsets.all(12.r),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              controller.formattedDate,
                              style: TextStyle(
                                fontSize: 23.r,
                                fontFamily: 'VarelaRound',
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
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 3.r,
                          ),
                          Text(
                            controller.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20.r,
                              fontFamily: 'VarelaRound',
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
                        ],
                      )),
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
                                    backgroundColor: Colors.yellow.shade50,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                            color: Colors.white, width: 10.r)),
                                    title: Center(
                                        child: Text('REWARD',
                                            style: TextStyle(
                                              fontFamily: 'ReemKufi',
                                                fontWeight: FontWeight.bold))),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              Assets.imagesDice,
                                              height: 35.r,
                                              color: Colors.black,
                                              fit: BoxFit.cover,
                                            ),
                                            8.horizontalSpace,
                                            Text(controller.name,
                                                style: TextStyle(
                                                    fontSize: 20.r,
                                                    fontFamily: 'VarelaRound',
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        15.verticalSpace,
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          child: Center(
                                              child: Text(
                                            "Are you sure you want to claim this reward?",
                                            style: TextStyle(
                                                fontSize: 14.r,
                                                fontFamily: 'VarelaRound',
                                                fontWeight: FontWeight.w600),
                                          )),
                                        )
                                      ],
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                            onPressed: () => Get.back(),
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors.grey,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                            ),
                                            child: Text(
                                              "CLOSE",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'VarelaRound',
                                                  fontSize: 16.r),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                claimedRewards[uniqueKey] =
                                                    true;
                                                box.write("claimedRewards",
                                                    claimedRewards);
                                              });

                                              Get.back();
                                              Get.snackbar(
                                                "Success!",
                                                "You have collected ${controller.name}!",
                                                snackPosition:
                                                    SnackPosition.TOP,
                                                icon: Icon(Icons.done_outline,
                                                    color: Colors.white),
                                                duration:
                                                    const Duration(seconds: 3),
                                                backgroundColor:
                                                    Colors.grey[600],
                                                colorText: Colors.white,
                                              );
                                            },
                                            style: TextButton.styleFrom(
                                              backgroundColor: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            child: Text(
                                              "CLAIM",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'VarelaRound',
                                                  fontSize: 16.r),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                                // Get.dialog(showDialogs(context));
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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 4.r)),
        margin: EdgeInsets.all(4.r),
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
    );
  }
}
