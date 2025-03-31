import 'package:cached_network_image/cached_network_image.dart';
import 'package:dice_app/AdPlugin/Ads/Banner/BannerWrapper.dart';
import 'package:dice_app/AdPlugin/Ads/Native/NativeRN.dart';
import 'package:dice_app/AdPlugin/AdsGridView/ads_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Generated/assets.dart';
import 'Controller/origins_screen_controller.dart';

class OriginsDetailScreen extends StatelessWidget {
  static const String routeName = '/OriginsDetailScreen';

  OriginsDetailScreen({super.key});
  final controller = Get.put(OriginsDetailController());

  @override
  Widget build(BuildContext context) {
    return BannerWrapper(
      parentContext: context,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.imagesBg), fit: BoxFit.fill),
              ),
            ),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.r, horizontal: 15.r),
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
                            'Origins Details',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26.r,
                              fontFamily: 'VarelaRound',
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
                        final data = controller.item[0].stickers;
                        return AdsGridView(
                          crossAxisCount:3,
                          itemCount: data.length,
                          adsIndex: 1,
                          adsWidget: NativeRN(parentContext: context),
                          itemPadding: EdgeInsets.all(0.r),
                          itemMainAspectRatio: 1.5,
                          itemWidget: (context, index) {
                            return CachedNetworkImage(
                              imageUrl: data[index].image,
                              fit: BoxFit.fill,

                              placeholder: (context, url) =>
                                  LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.grey,
                                size: 20.r,
                              ),
                            );
                          },
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
