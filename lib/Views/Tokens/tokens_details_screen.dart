import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Controller/tokens_details_controller.dart';

class TokensDetailScreen extends StatefulWidget {
  const TokensDetailScreen({super.key});

  @override
  State<TokensDetailScreen> createState() => _TokensDetailScreenState();
}

class _TokensDetailScreenState extends State<TokensDetailScreen> {
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
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0F2027),
                  Color(0xFF203A43),
                  Color(0xFF2C5364)
                ],
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(19.r),
                            border:
                                Border.all(width: 4.r, color: Colors.grey),

                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: Image.network(
                              controller.image,
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
                      fontSize: 26.r,
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
