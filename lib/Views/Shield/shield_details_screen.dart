import 'package:dice_app/Generated/assets.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'Controller/shield_screen_controller.dart';

class ShieldsDetailScreen extends StatelessWidget {
  static const String routeName = '/ShieldsDetailScreen';

  ShieldsDetailScreen({super.key});

  final controller = Get.put(ShieldsController());

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
                        'Shield Details',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'VarelaRound',
                          fontWeight: FontWeight.bold,
                          fontSize: 26.r,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  20.verticalSpace,
                  FlipCard(
                    direction: FlipDirection.VERTICAL,
                    front: GlassmorphicContainer(
                      width: 220.r,
                      height: 380.r,
                      borderRadius: 20.r,
                      linearGradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.05)
                        ],
                      ),
                      border: 2.r,
                      blur: 15,
                      borderGradient: LinearGradient(
                        colors: [Colors.white54, Colors.white10],
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              Assets.imagesLogo,
                              fit: BoxFit.contain,
                            ),
                          ),
                          25.verticalSpace,
                          Text(
                            'Tap Here',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.r,
                              color: Colors.white,
                              fontFamily: 'VarelaRound',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    back: GlassmorphicContainer(
                      width: 220.r,
                      height: 380.r,
                      borderRadius: 20.r,
                      linearGradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.05)
                        ],
                      ),
                      border: 2.r,
                      blur: 15,
                      borderGradient: LinearGradient(
                        colors: [Colors.white54, Colors.white10],
                      ),
                      child: Center(
                        child: Image.network(
                          controller.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  30.verticalSpace,
                  Text(
                    controller.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.r,
                      color: Colors.white,
                      fontFamily: 'VarelaRound',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  15.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.r),
                    child: Text(
                      controller.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.r,
                        fontFamily: 'VarelaRound',
                        color: Colors.white70,
                      ),
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
