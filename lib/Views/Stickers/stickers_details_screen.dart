import 'package:cached_network_image/cached_network_image.dart';
import 'package:dice_app/AdPlugin/Ads/Banner/BannerWrapper.dart';
import 'package:dice_app/AdPlugin/Ads/FullScreen/Ads.dart';
import 'package:dice_app/AdPlugin/Ads/Native/NativeRN.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Generated/assets.dart';
import 'Controller/stickers_controller.dart';

class StickerDetailsScreen extends StatelessWidget {
  static const String routeName = '/StickerDetailsScreen';

  StickerDetailsScreen({super.key});
  final controller = Get.put(StickerDetailsController());

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 15.r),
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
                      'Sticker Download',
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
              Spacer(),
              Center(
                child: CachedNetworkImage(
                  placeholder: (context, url) {
                    return LoadingAnimationWidget.threeArchedCircle(
                      color: Colors.black45,
                      size: 40.r,
                    );
                  },
                  imageUrl: controller.stricker,
                  height: 200.r,
                  fit: BoxFit.cover,
                ),
              ),
              NativeRN(parentContext: context),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.r),
                child: GestureDetector(
                  onTap: () => AdsRN().showFullScreen(
                      context: context,
                      onComplete: () {
                        controller.saveSticker();
                      }),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(width: 3.r, color: Colors.white),
                    ),
                    margin: EdgeInsets.all(20.r),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.download,
                              size: 30.r,
                              color: Colors.white,
                            ),
                            10.horizontalSpace,
                            Text(
                              'Download',
                              style: TextStyle(
                                fontSize: 25.r,
                                fontFamily: 'VarelaRound',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
