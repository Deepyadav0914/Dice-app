import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Generated/assets.dart';
import 'Controller/origins_screen_controller.dart';
import 'origins_details_screen.dart';

class OriginsScreen extends StatefulWidget {
  static const String routeName = '/OriginsScreen';

  const OriginsScreen({super.key});

  @override
  State<OriginsScreen> createState() => _OriginsScreenState();
}

class _OriginsScreenState extends State<OriginsScreen> {
  final controller = Get.put((OriginsController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.imagesBg), fit: BoxFit.fill),
          ),
        ),
        SafeArea(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
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
                    'Origins',
                    style: TextStyle(
                      fontSize: 26.r,
                      fontFamily: 'VarelaRound',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
                final data = controller.originsData.value.origins;
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 6.r, horizontal: 15.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Assets.imagesList),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(20.r),
                              border:
                                  Border.all(width: 4.r, color: Colors.grey),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.r),
                              child: ListTile(
                                onTap: () {
                                  Get.to(() => OriginsDetailScreen(),
                                      arguments: {
                                        'item': item,
                                        'index': index
                                      })?.then(
                                    (_) {
                                      setState(() {});
                                    },
                                  );
                                },
                                //
                                leading: item.icon.isEmpty
                                    ? SizedBox()
                                    : CachedNetworkImage(
                                        imageUrl:
                                            item.icon + item.category + ".png",
                                        height: 45.r,
                                        placeholder: (context, url) =>
                                            LoadingAnimationWidget
                                                .threeArchedCircle(
                                          color: Colors.grey,
                                          size: 20.r,
                                        ),
                                      ),
                                title: Text(
                                  item.category.toString(),
                                  style: TextStyle(
                                    fontFamily: 'VarelaRound',
                                    fontSize: 19.r,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios,
                                    color: Colors.white, size: 25.r),
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
