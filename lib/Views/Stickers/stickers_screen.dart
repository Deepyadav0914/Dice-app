import 'package:cached_network_image/cached_network_image.dart';
import 'package:dice_app/AdPlugin/Ads/Banner/BannerWrapper.dart';
import 'package:dice_app/AdPlugin/Ads/FullScreen/Ads.dart';
import 'package:dice_app/AdPlugin/Ads/Native/NativeRN.dart';
import 'package:dice_app/AdPlugin/AdsGridView/ads_gridview.dart';
import 'package:dice_app/Views/Stickers/stickers_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Generated/assets.dart';
import '../../Model/stickers_model.dart';
import 'Controller/stickers_controller.dart';

class StickersScreen extends StatelessWidget {
  static const String routeName = '/StickersScreen';

  StickersScreen({super.key});
  final controller = Get.put(StickersController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StickersController>(
      builder: (controller) {
        return BannerWrapper(
          parentContext: context,
          child: Scaffold(
            body: Stack(children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.imagesBg), fit: BoxFit.fill),
                ),
              ),
              SafeArea(
                child: Column(children: [
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
                          'Stickers',
                          style: TextStyle(
                            fontSize: 26.r,
                            fontFamily: 'VarelaRound',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Obx(() {
                      return FutureBuilder<StickersModel>(
                        future: controller.StickersData.value,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: LoadingAnimationWidget.hexagonDots(
                                color: Colors.white,
                                size: 40.r,
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
                            final allstickers = snapshot.data!.stickers;
                            // print(allstickers.length);
                            // box.write('totalstickers', allstickers.length);

                            return SafeArea(
                              child: SizedBox(
                                height: (allstickers.length / 2).ceil() * 200.r,
                                child: AdsGridView(
                                  crossAxisCount: 2,
                                  itemCount: allstickers.length,
                                  adsIndex: 1,
                                  adsWidget: NativeRN(parentContext: context),
                                  itemPadding: EdgeInsets.all(4.r),
                                  itemWidget:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6.r, horizontal: 10.r),
                                      child: GestureDetector(
                                        onTap: () {
                                          AdsRN().showFullScreen(
                                            context: context,
                                            onComplete: () {
                                              Get.to(
                                                  () => StickerDetailsScreen(),
                                                  arguments: {
                                                    'Stickers':
                                                        allstickers[index]
                                                  });
                                            },
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    Assets.imagesList),
                                                fit: BoxFit.fill),
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            border: Border.all(
                                                width: 4.r, color: Colors.grey),
                                          ),
                                          child: CachedNetworkImage(
                                            placeholder: (context, url) =>
                                                LoadingAnimationWidget
                                                    .threeArchedCircle(
                                              color: Colors.black45,
                                              size: 25.r,
                                            ),
                                            imageUrl:
                                                allstickers[index].toString(),
                                          ),
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
                ]),
              ),
            ]),
          ),
        );
      },
    );
  }
}
