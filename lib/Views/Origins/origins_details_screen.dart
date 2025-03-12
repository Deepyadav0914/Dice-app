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
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.r, horizontal: 15.r),
                  child: Row(
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
                ),
                Expanded(
                  child: Obx(() {
                    if (controller.isLoading.value) {
                      return Center(
                        child: LoadingAnimationWidget.hexagonDots(
                          color: Colors.white,
                          size: 40.r,
                        ),
                      );
                    }
                    final data = controller.item[0].stickers;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Adjust as needed
                          crossAxisSpacing: 8.r,
                          mainAxisSpacing: 8.r,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: CachedNetworkImage(
                              imageUrl: data[index].image,
                              fit: BoxFit.fill,
                              height: 150.r,
                              placeholder: (context, url) =>
                                  LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.grey,
                                size: 20.r,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
