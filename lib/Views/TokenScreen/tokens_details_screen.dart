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
                        'Tokens',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 30.r,
                          fontFamily: 'acme',


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
                      fontFamily: 'acme',
                      color: Colors.blueGrey[1000],
                      fontWeight: FontWeight.w500,
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
                    controller.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.r,
                      fontFamily: 'acme',
                      color: Colors.blueGrey[900],
                      fontWeight: FontWeight.w500,
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
