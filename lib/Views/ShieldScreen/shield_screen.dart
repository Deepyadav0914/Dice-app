import 'package:dice_app/Views/ShieldScreen/Controller/shield_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ShieldScreen extends StatefulWidget {
  const ShieldScreen({super.key});

  @override
  State<ShieldScreen> createState() => _ShieldScreenState();
}

class _ShieldScreenState extends State<ShieldScreen> {
  final controller = Get.put((ShieldController()));

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
                    'Shield',
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
                final data = controller.ShieldData.value.shieldData;
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final name = data[index].name;
                    final description = data[index].description;
                    final image = data[index].image;
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.r, horizontal: 15.r),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
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
                                // onTap: () {
                                //   // Get.to(() => OriginsDetailScreen(),
                                //   //     arguments: {
                                //   //       'item': item,
                                //   //       'index': index
                                //   //     })?.then(
                                //   //       (_) {
                                //   //     setState(() {});
                                //   //   },
                                //   // );
                                // },
                                leading: Image.asset(
                                  image,
                                  height: 30.r,
                                ),
                                title: Text(
                                  name.toString(),
                                  style: TextStyle(
                                    fontFamily: 'acme',
                                    fontSize: 15.r,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black87,
                                  ),
                                ),
                                subtitle: Text(
                                  description.toString(),
                                  style: TextStyle(
                                    fontFamily: 'acme',
                                    fontSize: 12.r,
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

//
// SafeArea(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: GridView(
// physics: AlwaysScrollableScrollPhysics(),
// children: [
// Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20),
// ),
// elevation: 8,
// child: Container(
// width: 180,
// height: 250,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// color: Colors.grey[200],
// image: DecorationImage(
// image: NetworkImage(
// controller.shieldData.value.shieldData[index].image),
// fit: BoxFit.cover,
// colorFilter: ColorFilter.mode(
// Colors.blueGrey.withOpacity(0.5), BlendMode.darken),
// ),
// ),
// child: Stack(
// children: [
// Positioned(
// top: 10,
// left: 10,
// child: Text(
// controller.shieldData.value.shieldData[index].name,
// style: const TextStyle(
// fontSize: 20,
// color: Colors.white,
// fontWeight: FontWeight.bold),
// ),
// ),
// Positioned(
// top: 10,
// right: 10,
// child: CircleAvatar(
// backgroundColor: Colors.white,
// radius: 20,
// child: Text(
// "$index",
// style: const TextStyle(
// fontSize: 16, fontWeight: FontWeight.bold),
// ),
// ),
// ),
// Positioned(
// bottom: 10,
// left: 10,
// right: 10,
// child: Container(
// padding: EdgeInsets.all(8),
// decoration: BoxDecoration(
// color: Colors.grey.withOpacity(0.9),
// borderRadius: BorderRadius.circular(10),
// ),
// child: Text(
// controller.shieldData.value.shieldData[index].description,
// style: TextStyle(fontSize: 14, color: Colors.white),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// gridDelegate:
// SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
// ),
// ),
