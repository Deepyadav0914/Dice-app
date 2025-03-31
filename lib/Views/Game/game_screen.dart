import 'package:dice_app/AdPlugin/Ads/Banner/BannerWrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Generated/assets.dart';
import 'Controller/game_controller.dart';
import 'dialog.dart';
import 'flare.dart';

class GameScreen extends StatelessWidget {
  static const String routeName = '/GameScreen';

  GameScreen({super.key});

  final GameController controller = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    return BannerWrapper(
      parentContext: context,
      child: Scaffold(
        body: GetBuilder<GameController>(
          builder: (controller) {
            return Obx(
              () => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.imagesBg), fit: BoxFit.fill),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          controller.buildAppBar(context),
                          controller.plyturn.value
                              ? Container(
                                  height: 90,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Image.asset(Assets.imagesRed, height: 50),
                                      Text(
                                        controller.isComputer.value
                                            ? 'Computer'
                                            : 'Player 1',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'VarelaRound',
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              : controller.isComputer.value
                                  ? Container(
                                      height: 90,
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Image.asset(Assets.imagesRed,
                                                height: 50),
                                          ),
                                          Expanded(
                                            child: Text(
                                              controller.isComputer.value
                                                  ? 'Computer'
                                                  : 'Player 1',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: 'VarelaRound',
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                      width: 2,
                                                      color: Colors.grey),
                                                ),
                                                child: controller
                                                        .toAnimate.value
                                                    ? Flare(
                                                        animation: '1',
                                                      )
                                                    : Image.asset(
                                                        'assets/images/${controller.randomNo}.png'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : controller.player1(context),
                          Container(
                            height: 410,
                            width: 500,
                            child: Stack(
                              children: [
                                Container(
                                  child: GridView.count(
                                    crossAxisCount: 10,
                                    padding: EdgeInsets.all(2),
                                    // Generate 100 widgets that display their index in the List.
                                    children: List.generate(100, (index) {
                                      return Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        margin: EdgeInsets.all(0),
                                        borderOnForeground: true,
                                        color: controller.ply1 == 100 - index ||
                                                controller.ply2 == 100 - index
                                            ? Color.fromRGBO(255, 255, 255, 1)
                                            : (10 <= index && index <= 19) ||
                                                    (30 <= index &&
                                                        index <= 39) ||
                                                    (50 <= index &&
                                                        index <= 59) ||
                                                    (70 <= index &&
                                                        index <= 79) ||
                                                    (90 <= index && index <= 99)
                                                ? index.isOdd
                                                    ? Color.fromRGBO(
                                                        220, 200, 109, 1)
                                                    : Color.fromRGBO(
                                                        39, 25, 60, 1)
                                                : index.isEven
                                                    ? Color.fromRGBO(
                                                        220, 200, 109, 1)
                                                    : Color.fromRGBO(
                                                        39, 25, 60, 1),
                                        child: Text(
                                          ' ${controller.order(100 - index)}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                                Container(
                                  child: Image.asset(
                                    controller.name,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  child: GridView.count(
                                    crossAxisCount: 10,
                                    padding: EdgeInsets.all(2),
                                    children: List.generate(100, (index) {
                                      return Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        margin: EdgeInsets.all(0),
                                        borderOnForeground: true,
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.0),
                                        child: controller.ply1 == 100 - index
                                            ? controller.ply1 == controller.ply2
                                                ? Center(
                                                    child: Icon(
                                                    Icons.people_alt,
                                                    color: Colors.black,
                                                    size: 30,
                                                  ))
                                                : Center(
                                                    child: Image.asset(
                                                        Assets.imagesRed,
                                                        height: 30),
                                                  )
                                            : controller.ply2 == 100 - index
                                                ? controller.ply1 ==
                                                        controller.ply2
                                                    ? Center(
                                                        child: Icon(
                                                        Icons.people_alt,
                                                        color: Colors.black,
                                                        size: 30,
                                                      ))
                                                    : Center(
                                                        child: Image.asset(
                                                            Assets.imagesYellow,
                                                            height: 30),
                                                      )
                                                : SizedBox(),
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          !controller.plyturn.value
                              ? Container(
                                  height: 90,
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(Assets.imagesYellow,
                                          height: 50),
                                      Text(
                                        'Player 2',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'VarelaRound',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                )
                              : controller.player2(context),
                          Center(
                            child: Text(
                              '-> Get 1 to start the game for a players <-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'VarelaRound',
                                  color: Colors.white),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              ShowDialog().exitDialog(context);
                            },
                            child: Container(
                              height: 40.r,
                              width: 150.r,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(20.r),
                                border:
                                    Border.all(width: 3.r, color: Colors.grey),
                              ),
                              child: Center(
                                child: Text(
                                  'Exit Game',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'VarelaRound',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.r,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
