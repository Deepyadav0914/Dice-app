import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Controller/origins_details_controller.dart';

class OriginsDetailScreen extends StatefulWidget {
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
            height: double.infinity,
            width: double.infinity,
            color: Color(0xFFFAF6E9),
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
                          color: Colors.black,
                          size: 30.r,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Origins',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 30.r,
                          fontFamily: 'ReemKufi',
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  20.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(19.r),
                      border: Border.all(width: 4.r, color: Colors.grey),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: Image.network(
                        controller.sticker,
                        height: 300.r,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  30.verticalSpace,
                  Text(
                    controller.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.r,
                      fontFamily: 'VarelaRound',
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                            color: Colors.white,
                            offset: Offset(1.r, 1.r),
                            blurRadius: 3.r)
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    controller.category,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.r,
                      fontFamily: 'VarelaRound',
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                            color: Colors.white,
                            offset: Offset(1.r, 1.r),
                            blurRadius: 3.r)
                      ],
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
