import 'package:dice_app/Generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../repository/background_layout.dart';
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
      Get.off(() =>  MainMenu());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF8EC5FC), Color(0xFFE0C3FC)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: CustomPaint(
            size: MediaQuery.of(context).size,
            painter: CheckeredPainter(),
          ),
        ),

        Center(
          child: Transform.rotate(
            angle: 0.3, // Simulating slight 3D rotation
            child: Image.asset(
              color: Colors.black87,
             Assets.imagesDice,
              height: 150.r,
            ),
          ),
        ),
        // Paper plane
        Align(
          alignment: const Alignment(0, 0.8),
          child: LoadingAnimationWidget.threeArchedCircle(
            color: Colors.black87,
            size: 40.r,
          ),
        ),
      ],
    );
  }
}
