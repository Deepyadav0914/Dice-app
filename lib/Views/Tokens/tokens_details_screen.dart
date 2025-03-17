import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Generated/assets.dart';
import 'Controller/tokens_controller.dart';

class TokensDetailScreen extends StatelessWidget {
  static const String routeName = '/TokensDetailScreen';

  TokensDetailScreen({super.key});

  final controller = Get.put(TokensDetailController());

  @override
  Widget build(BuildContext context) {
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
                          color: Colors.white,
                          size: 28.r,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Tokens Details',
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
                  20.verticalSpace,
                  controller.image.isEmpty
                      ? SizedBox()
                      : Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              border:
                                  Border.all(width: 3.r, color: Colors.white)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: CachedNetworkImage(
                              imageUrl: controller.image,
                              placeholder: (context, url) =>
                                  LoadingAnimationWidget.bouncingBall(
                                      color: Colors.white, size: 40.r),
                            ),
                          ),
                        ),
                  30.verticalSpace,
                  Text(
                    controller.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.r,
                      fontFamily: 'VarelaRound',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    controller.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.r,
                      fontFamily: 'VarelaRound',
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
