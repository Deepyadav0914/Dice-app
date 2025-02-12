import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Generated/assets.dart';
import '../../Model/stickers_model.dart';
import '../../main.dart';
import 'Controller/stickers_controller.dart';

class StickersScreen extends StatefulWidget {
  static const String routeName = '/StickersScreen';

  const StickersScreen({super.key});

  @override
  State<StickersScreen> createState() => _StickersScreenState();
}

class _StickersScreenState extends State<StickersScreen> {
  final controller = Get.put(StickersController());

  @override
  Widget build(BuildContext context) {
    final unlockGifs = box.read<Map<String, dynamic>>('unlockGifs') ?? {};
    print("unlockGifs == ${unlockGifs.length}");

    return GetBuilder<StickersController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back, color: Colors.white),
            ),
            backgroundColor: Colors.blue,
            title: Text(
              'Stickers',
              style: TextStyle(
                color: Colors.white,
                fontSize: 27.r,
                shadows: [
                  Shadow(
                      color: Colors.black,
                      offset: Offset(1.r, 1.r),
                      blurRadius: 3.r)
                ],
                fontFamily: 'acme',
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            // actions: [
            //   Padding(
            //     padding: EdgeInsets.only(right: 10.r),
            //     child: Container(
            //       height: 36.r,
            //       width: 100.r,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(25),
            //         border: Border.all(width: 3, color: Colors.white),
            //         color: Colors.blue,
            //       ),
            //       // child: Row(
            //       //   mainAxisAlignment: MainAxisAlignment.center,
            //       //   children: [
            //       //     Image.asset(
            //       //       Assets.imagesDice,
            //       //       height: 25.r,
            //       //     ),
            //       //     5.horizontalSpace,
            //       //     Obx(() => Text(
            //       //       '${controller.totalCoins.value}',
            //       //       style: TextStyle(
            //       //         color: Colors.white,
            //       //         fontFamily: 'acme',
            //       //         fontSize: 20.r,
            //       //         fontWeight: FontWeight.bold,
            //       //       ),
            //       //     )),
            //       //   ],
            //       // ),
            //     ),
            //   ),
            // ],
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.blue],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Obx(() {
              return FutureBuilder<StickersModel>(
                future: controller.StickersData.value,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: LoadingAnimationWidget.hexagonDots(
                        color: Colors.white,
                        size: 40.sp,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Failed to load data. Please try again.',
                            style: TextStyle(
                              fontSize: 16.r,
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          10.verticalSpace,
                          ElevatedButton(
                            onPressed: () => controller.retry(),
                            child: const Text("Retry"),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasData) {
                    final allgifs = snapshot.data!.stickers;
                    print(allgifs.length);
                    box.write('totalgif', allgifs.length);

                    return SafeArea(
                      child: SizedBox(
                        height: (allgifs.length / 2).ceil() * 200.r,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: allgifs.length,
                          itemBuilder: (BuildContext context, int index) {
                            String uniqueKey = "$index";
                            print("uniqueKey == $uniqueKey");
                            bool isLocked = unlockGifs[uniqueKey] ?? false;

                            return Padding(
                              padding: EdgeInsets.only(
                                  right: 10.r, left: 10.r, top: 10.r),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(22.r),
                                  border: Border.all(
                                      width: 3.r, color: Colors.black),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(6.r, 6.r),
                                      blurRadius: 10.r,
                                    ),
                                  ],
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    // Get.to(() => GifsDetailScreen(),
                                    //     arguments: {
                                    //       'Gifs': allgifs[index]
                                    //     });
                                  },
                                  child: Stack(children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(18.r),
                                        border: Border.all(
                                            width: 3.r, color: Colors.black),
                                      ),
                                      margin: EdgeInsets.all(4.r),
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.r),
                                          child: CachedNetworkImage(
                                            placeholder: (context, url) =>
                                                LoadingAnimationWidget
                                                    .threeArchedCircle(
                                              color: Colors.black45,
                                              size: 20.sp,
                                            ),
                                            imageUrl: allgifs[index].toString(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    isLocked
                                        ? SizedBox()
                                        : Positioned(
                                          left: 8,
                                           top: 5,
                                           bottom: 5,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.snackbar(
                                                "Not Enough dices",
                                                "You need at dices to unlock this Sticker.",
                                                snackPosition:
                                                    SnackPosition.TOP,
                                                duration: const Duration(
                                                    seconds: 3),
                                                icon: Icon(
                                                    Icons.cancel_outlined,
                                                    color: Colors.white),
                                                padding:
                                                    EdgeInsets.all(10.r),
                                                margin:
                                                    EdgeInsets.all(10.r),
                                                forwardAnimationCurve:
                                                    Curves.easeOutBack,
                                                backgroundColor:
                                                    Colors.red,
                                                colorText: Colors.white,
                                              );

                                              setState(() {
                                                unlockGifs[uniqueKey] =
                                                    true;
                                                box.write("unlockGifs",
                                                    unlockGifs);
                                              });

                                              // final gifsController =
                                              // Get.put(GifsController());
                                              // gifsController.unlockedGifs(
                                              //     controller.rewardCoins);
                                            },
                                            child: Container(
                                              height: 160.r,
                                              width: 140.r,
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.8),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.r),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                children: [
                                                  Image.asset(
                                                    Assets.imagesDice,
                                                    color: Colors.white,
                                                    height: 60.r,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                  ]),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              );
            }),
          ),
        );
      },
    );
  }
}
