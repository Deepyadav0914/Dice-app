import 'package:dice_app/Views/FaqsScreen/Controller/faqs_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  final controller = Get.put(FaqsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFFFAF6E9),
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
                          color: Colors.black,
                          size: 30.r,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Faqs',
                        style: TextStyle(
                          fontSize: 30.r,
                          fontFamily: 'ReemKufi',
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
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

                    final data = controller.FaqsData.value.data;

                    if (data.isEmpty) {
                      return Center(
                        child: Text(
                          "No events available",
                          style:
                              TextStyle(fontSize: 20.r, color: Colors.black54),
                        ),
                      );
                    }
                    return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final eventItem = data[index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7.r, horizontal: 15.r),
                            ),
                            _buildTDataCard(
                              title: 'Question : ${eventItem.question}  ',
                              subtitle: 'Answer : ${eventItem.answer} ',
                              onTap: () {},
                            ),
                          ],
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTDataCard(
      {required String title,
      required String subtitle,
      required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 15.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(width: 4.r, color: Colors.grey),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: ListTile(
            onTap: onTap,
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 24.r,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 20.r,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
