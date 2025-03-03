import 'package:dice_app/Generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../MenuScreen/menu_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to MenuScreen after 4 seconds using GetX
    Future.delayed(const Duration(seconds: 4), () {
      Get.off(() => MenuScreen());
    });
  }

  @override
  Widget build(BuildContext context) {

    return Stack(

      children: [
        Container(
        color: Color(0xFFFAF6E9),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              16.verticalSpace,
              Image.asset(
                Assets.imagesSplash,

              ),
              LoadingAnimationWidget.threeArchedCircle(
                color: Colors.black87,
                size: 40.r,
              ),
            ],
          )),
        ),
      ],
    );
  }
}

