import 'package:dice_app/Views/TokenScreen/tokens_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'Controller/tokens_controller.dart';

class TokensScreen extends StatefulWidget {
  static const String routeName = '/TokensScreen';

  const TokensScreen({super.key});

  @override
  State<TokensScreen> createState() => _TokensScreenState();
}

class _TokensScreenState extends State<TokensScreen> {
  final controller = Get.put((TokensController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.blueGrey],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        SafeArea(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 15.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.blueGrey[500],
                      size: 30.r,
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(1.r, 1.r),
                            blurRadius: 3.r)
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Tokens',
                    style: TextStyle(
                      fontSize: 30.r,
                      fontFamily: 'acme',
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(1.r, 1.r),
                            blurRadius: 3.r)
                      ],
                      color: Colors.blueGrey[500],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: LoadingAnimationWidget.hexagonDots(
                      color: Colors.white,
                      size: 40.sp,
                    ),
                  );
                }
                final data = controller.tokenData.value.tokensData;
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.r, horizontal: 15.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22.r),
                              border: Border.all(
                                  width: 3.r, color: Colors.blueGrey),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(6.r, 6.r),
                                  blurRadius: 10.r,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: ListTile(
                                onTap: () {
                                  Get.to(() => TokensDetailScreen(),
                                      arguments: {
                                        'item': item,
                                        'index': index
                                      })?.then(
                                    (_) {
                                      setState(() {});
                                    },
                                  );
                                },
                                title: Text(
                                  item.name.toString(),
                                  style: TextStyle(
                                    fontFamily: 'acme',
                                    fontSize: 22.r,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87,
                                  ),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios,
                                    color: Colors.blueGrey, size: 25.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            )
          ]),
        ),
      ]),
    );
  }
}
