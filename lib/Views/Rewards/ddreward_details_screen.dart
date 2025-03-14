import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../Generated/assets.dart';
import '../../main.dart';
import 'Controller/ddreward_controller.dart';

class DDRewardDetailScreen extends StatefulWidget {
  static const String routeName = '/DDRewardDetailScreen';

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
              image: DecorationImage(
                  image: AssetImage(Assets.imagesBg), fit: BoxFit.fill),
            ),
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
                          color: Colors.white,
                          size: 28.r,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Reward Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 26.r,
                          fontFamily: 'VarelaRound',
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Center(
                    child: Image.asset(
                      Assets.imagesLogo,
                      height: 220.r,
                    ),
                  ),
                  Center(
                    child: Text(
                      controller.name,
                      style: TextStyle(
                        fontSize: 22.r,
                        fontFamily: 'VarelaRound',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
                                fontSize: 20.r,
                                fontFamily: 'VarelaRound',
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
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
                              fontSize: 18.r,
                              fontFamily: 'VarelaRound',
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                  10.verticalSpace,
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
                                    backgroundColor: Colors.grey.shade300,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(color: Colors.white)),
                                    title: Container(
                                      height: 32.r,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25.r),
                                          color: Colors.grey[600]),
                                      child: Text('REWARD',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'VarelaRound',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              Assets.imagesLogo,
                                              height: 50.r,
                                              fit: BoxFit.cover,
                                            ),
                                            8.horizontalSpace,
                                            Text(controller.name,
                                                style: TextStyle(
                                                    fontSize: 18.r,
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
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16.r,
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
                                              backgroundColor: Colors.grey[600],
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                            ),
                                            child: Text(
                                              "CLOSE",
                                              style: TextStyle(
                                                  color: Colors.white,
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
                                                    color: Colors.black87),
                                                duration:
                                                    const Duration(seconds: 3),
                                                backgroundColor:
                                                    Colors.grey[500],
                                                colorText: Colors.black87,
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
                      Builder(
                        builder: (BuildContext context) {
                          return _buildActionButton('Share', () {
                            controller._onShareWithResult(context);
                          });
                        },
                      ),
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
                fontFamily: 'VarelaRound',
                color: onPressed == null ? Colors.grey[800] : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension on DDRewardDetailController {
  Future<void> _onShareWithResult(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;

    final scaffoldMessenger = ScaffoldMessenger.of(context);
    ShareResult shareResult;
    if (reward[0].url.isNotEmpty) {
      shareResult = await Share.shareUri(
        Uri.parse(reward[0].url),
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
    } else {
      shareResult = await Share.share(
        reward[0].url,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
    }
    scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
  }
}

SnackBar getResultSnackBar(ShareResult result) {
  return SnackBar(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Share result: ${result.status}",
          style: TextStyle(
            fontSize: 14.r,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        if (result.status == ShareResultStatus.success)
          Text("Shared to: ${result.raw}")
      ],
    ),
    padding: EdgeInsets.all(15),
    duration: Duration(seconds: 3),
  );
}
