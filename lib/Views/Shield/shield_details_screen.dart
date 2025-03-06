// import 'package:dice_app/Generated/assets.dart';
// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import 'Controller/shield_details_controller.dart';
//
// class ShieldsDetailScreen extends StatefulWidget {
//   const ShieldsDetailScreen({super.key});
//
//   @override
//   State<ShieldsDetailScreen> createState() => _ShieldsDetailScreenState();
// }
//
// class _ShieldsDetailScreenState extends State<ShieldsDetailScreen> {
//   final controller = Get.put(ShieldsController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             color: Color(0xFFFAF6E9),
//           ),
//           SafeArea(
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 15.r),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       IconButton(
//                         onPressed: () => Get.back(),
//                         icon: Icon(
//                           Icons.arrow_back_ios,
//                           color: Colors.black,
//                           size: 30.r,
//                           shadows: [
//                             Shadow(
//                                 color: Colors.black,
//                                 offset: Offset(1.r, 1.r),
//                                 blurRadius: 3.r)
//                           ],
//                         ),
//                       ),
//                       Spacer(),
//                       Text(
//                         'Shield',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 30.r,
//                           fontFamily: 'ReemKufi',
//                         ),
//                       ),
//                       Spacer(),
//                     ],
//                   ),
//                   10.verticalSpace,
//                   FlipCard(
//                     direction: FlipDirection.HORIZONTAL,
//                     front: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.grey,
//                         borderRadius: BorderRadius.circular(20.r),
//                         border: Border.all(width: 4.r, color: Colors.grey),
//                       ),
//                       height: 380.r,
//                       alignment: Alignment.center,
//                       width: 200.r,
//                       child: Image.asset(
//                         Assets.imagesShield,
//                       ),
//                     ),
//                     back: Container(
//                       height: 380.r,
//                       decoration: BoxDecoration(
//                         color: Colors.grey,
//                         borderRadius: BorderRadius.circular(20.r),
//                         border: Border.all(width: 4.r, color: Colors.grey),
//                       ),
//                       alignment: Alignment.center,
//                       width: 220.r,
//                       child: Image.network(
//                         controller.image,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                   30.verticalSpace,
//                   Text(
//                     controller.name,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 25.r,
//                       fontFamily: 'VarelaRound',
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600,
//                       shadows: [
//                         Shadow(
//                             color: Colors.white,
//                             offset: Offset(1.r, 1.r),
//                             blurRadius: 3.r)
//                       ],
//                     ),
//                   ),
//                   20.verticalSpace,
//                   Text(
//                     controller.description,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 22.r,
//                       fontFamily: 'VarelaRound',
//                       color: Colors.black87,
//                       fontWeight: FontWeight.w600,
//                       shadows: [
//                         Shadow(
//                             color: Colors.white,
//                             offset: Offset(1.r, 1.r),
//                             blurRadius: 3.r)
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:dice_app/Generated/assets.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Controller/shield_details_controller.dart';

class ShieldsDetailScreen extends StatefulWidget {
  const ShieldsDetailScreen({super.key});

  @override
  State<ShieldsDetailScreen> createState() => _ShieldsDetailScreenState();
}

class _ShieldsDetailScreenState extends State<ShieldsDetailScreen> {
  final controller = Get.put(ShieldsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
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
                  SizedBox(height: 20.r),
                  FlipCard(
                    direction: FlipDirection.HORIZONTAL,
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
                      child: Center(
                        child: Image.asset(
                          Assets.imagesShield,
                          fit: BoxFit.contain,
                        ),
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
                  SizedBox(height: 30.r),
                  Text(
                    controller.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26.r,
                      color: Colors.white,
                      fontFamily: 'VarelaRound',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15.r),
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