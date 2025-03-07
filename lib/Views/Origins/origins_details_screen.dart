import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Generated/assets.dart';
import 'Controller/origins_screen_controller.dart';

class OriginsDetailScreen extends StatefulWidget {
  static const String routeName = '/OriginsDetailScreen';

  const OriginsDetailScreen({super.key});

  @override
  State<OriginsDetailScreen> createState() => _OriginsDetailScreenState();
}

class _OriginsDetailScreenState extends State<OriginsDetailScreen> {
  final controller = Get.put(OriginsDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  40.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(width: 3.r, color: Colors.white)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: CachedNetworkImage(
                        imageUrl: controller.sticker,
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
                    controller.category,
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
