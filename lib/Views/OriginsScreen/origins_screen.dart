// import 'package:dice_app/Generated/assets.dart';
// import 'package:flutter/material.dart';
//
// class OriginsScreen extends StatefulWidget {
//   const OriginsScreen({super.key});
//
//   @override
//   State<OriginsScreen> createState() => _OriginsScreenState();
// }
//
// class _OriginsScreenState extends State<OriginsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GridView(
//                   physics: AlwaysScrollableScrollPhysics(),
//                   children: [
//                     buildCard("Queen", Assets.imagesDice, 4, 0),
//                     buildCard("Queen", Assets.imagesDice, 4, 0),
//                     buildCard("Queen", Assets.imagesDice, 4, 0),
//                   ],
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2)),
//             ),
//             // Main card
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildCard(String title, String imagePath, int number, int index) {
//     return Transform.translate(
//       offset: Offset(index * 10, index * 10), // Layer effect
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         elevation: 8,
//         child: Container(
//           width: 180,
//           height: 250,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.grey[200],
//             image: DecorationImage(
//               image: AssetImage(imagePath),
//               fit: BoxFit.cover,
//               colorFilter: ColorFilter.mode(
//                   Colors.blueGrey.withOpacity(0.5), BlendMode.darken),
//             ),
//           ),
//           child: Stack(
//             children: [
//               Positioned(
//                 top: 10,
//                 left: 10,
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Positioned(
//                 top: 10,
//                 right: 10,
//                 child: CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 20,
//                   child: Text(
//                     "$number",
//                     style: const TextStyle(
//                         fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 10,
//                 left: 10,
//                 right: 10,
//                 child: Container(
//                   padding: EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.withOpacity(0.9),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const Text(
//                     "Lorem ipsum dolor sit amet, consectetur",
//                     style: TextStyle(fontSize: 14, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//

import 'package:dice_app/Views/OriginsScreen/Controller/origins_screen_controller.dart';
import 'package:dice_app/Views/OriginsScreen/origins_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
                    'Origins',
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
                final data = controller.originsData.value.origins;
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
                                title: Text(
                                  item.category.toString(),
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
