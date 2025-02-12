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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blueGrey],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              16.verticalSpace,
              Image.asset(
                color: Colors.black87,
                Assets.imagesDice,
                height: 150.r,
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
