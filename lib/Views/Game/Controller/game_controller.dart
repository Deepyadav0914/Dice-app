import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Generated/assets.dart';
import '../dialog.dart';
import '../flare.dart';

class GameController extends GetxController {
  RxInt randomNo = 1.obs;
  RxBool toAnimate = false.obs;
  RxInt ply1 = 0.obs;
  RxInt ply2 = 0.obs;
  RxBool plyturn = true.obs;
  RxBool isComputer = false.obs;
  String name = 'assets/images/board.png';
  RxBool snakeBite = false.obs;

  @override
  void onInit() {
    con.initializeDices();
    super.onInit();
  }

  int order(int n) {
    if (n <= 10) {
      return 11 - n;
    } else if (n <= 30 && n > 20) {
      return 31 - n + 20;
    } else if (n <= 50 && n > 40) {
      return 51 - n + 40;
    } else if (n <= 70 && n > 60) {
      return 71 - n + 60;
    } else if (n <= 90 && n > 80) {
      return 91 - n + 80;
    } else {
      return n;
    }
  }

  Container player2(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.asset(Assets.imagesYellow, height: 50),
          ),
          Expanded(
            child: Text(
              'Player 2',
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
            child: Obx(
              () => InkWell(
                onTap: () {
                  controller.player2onTap(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2, color: Colors.grey),
                    ),
                    child: controller.toAnimate.value
                        ? Flare(
                            animation: '1',
                          )
                        : Image.asset(
                            'assets/images/${controller.randomNo}.png'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container player1(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.asset(Assets.imagesRed, height: 50),
          ),
          Expanded(
            child: Text(
              controller.isComputer.value ? 'Computer' : 'Player 1',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'VarelaRound',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Obx(
                () => InkWell(
                  onTap: () {
                    controller.player1onTap(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2, color: Colors.grey),
                    ),
                    height: 100,
                    child: controller.toAnimate.value
                        ? Flare(
                            animation: '1',
                          )
                        : Image.asset(
                            'assets/images/${controller.randomNo}.png'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> player2onTap(BuildContext context) async {
    var randomizer = Random(); // can get a seed as a parameter

    toAnimate.value = true;
    Future.delayed(Duration(seconds: 1)).whenComplete(() {
      randomNo.value = randomizer.nextInt(6) + 1;
      print(randomNo);
      toAnimate.value = false;
      ply2.value == 0
          ? randomNo.value == 1
              ? ply2.value = order(randomNo.value)
              : ply2.value = 0
          : ply2.value + randomNo.value > 100
              ? ply2.value = ply2.value
              : ply2.value = order(order(ply2.value) + randomNo.value);
      Future.delayed(Duration(seconds: 1)).whenComplete(() async {
        ply2.value = await snakeLadderCmd(ply2.value, context);
      });
      if (ply2.value == 100) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  backgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.white)),
                  title: Container(
                    height: 40.r,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: Colors.grey.shade700),
                    child: Center(
                      child: Text('Snakes & Ladders',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'VarelaRound',
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  content: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      "Player 2 WON !!!\nDo you want to Restart ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.r,
                          fontFamily: 'VarelaRound',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white, fontSize: 16.r),
                      ),
                      onPressed: () {
                        ply1.value = 0;
                        ply2.value = 0;

                        Get.back();
                      },
                    ),
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.white, fontSize: 16.r),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ));
      }
    });
    Future.delayed(Duration(milliseconds: 1500)).whenComplete(() {
      plyturn.value = !plyturn.value;
      if (isComputer.value) {
        toAnimate.value = true;
        Future.delayed(Duration(seconds: 1)).whenComplete(() {
          randomNo.value = randomizer.nextInt(6) + 1;
          print(randomNo);
          toAnimate.value = false;
          ply1.value == 0
              ? randomNo.value == 1
                  ? ply1.value = order(randomNo.value)
                  : ply1.value = 0
              : ply1.value + randomNo.value > 100
                  ? ply1.value = ply1.value
                  : ply1.value = order(order(ply1.value) + randomNo.value);
          Future.delayed(Duration(seconds: 1)).whenComplete(() async {
            ply1.value = await snakeLadderCmd(ply1.value, context);
          });
          if (ply1 == 100) {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      backgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.white)),
                      title: Container(
                        height: 40.r,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.r),
                            color: Colors.grey.shade700),
                        child: Center(
                          child: Text('Snakes & Ladders',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'VarelaRound',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      content: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          "Computer WON !!!\nDo you want to Restart ?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.r,
                              fontFamily: 'VarelaRound',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Yes',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.r),
                          ),
                          onPressed: () {
                            ply1.value = 0;
                            ply2.value = 0;

                            Get.back();
                          },
                        ),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.grey.shade700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'No',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.r),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    ));
          }

          Future.delayed(Duration(milliseconds: 1500)).whenComplete(() {
            plyturn.value = !plyturn.value;
          });
        });
      }
    });
  }

  Future<void> player1onTap(BuildContext context) async {
    var randomizer = Random();

    toAnimate.value = true;
    Future.delayed(Duration(seconds: 1)).whenComplete(() {
      randomNo.value = randomizer.nextInt(6) + 1;
      print(randomNo);
      toAnimate.value = false;
      ply1.value == 0
          ? randomNo.value == 1
              ? ply1.value = order(randomNo.value)
              : ply1.value = 0
          : ply1.value + randomNo.value > 100
              ? ply1.value = ply1.value
              : ply1.value = order(order(ply1.value) + randomNo.value);
      Future.delayed(Duration(seconds: 1)).whenComplete(() async {
        ply1.value = await snakeLadderCmd(ply1.value, context);
      });
      if (ply1.value == 100) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            backgroundColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.white)),
            title: Container(
              height: 40.r,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: Colors.grey.shade700),
              child: Center(
                child: Text('Snakes & Ladders',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'VarelaRound',
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            content: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                "Player 1 WON !!!\nDo you want to Restart ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.r,
                    fontFamily: 'VarelaRound',
                    fontWeight: FontWeight.w600),
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.white, fontSize: 16.r),
                ),
                onPressed: () {
                  ply1.value = 0;
                  ply2.value = 0;

                  Get.back();
                },
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'No',
                  style: TextStyle(color: Colors.white, fontSize: 16.r),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          ),
        );
      }

      Future.delayed(Duration(milliseconds: 1500)).whenComplete(() {
        plyturn.value = !plyturn.value;
      });
    });
  }

  Row buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Snakes & Ladders',
          style: TextStyle(
              fontFamily: 'VarelaRound',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22),
        ),
        IconButton(
            icon: Icon(
              !isComputer.value
                  ? Icons.computer_outlined
                  : Icons.people_outline,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        backgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: Colors.white)),
                        title: Container(
                          height: 40.r,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              color: Colors.grey.shade700),
                          child: Center(
                            child: Text('Snakes & Ladders',
                                style: TextStyle(
                                    fontFamily: 'VarelaRound',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        content: Text(
                          isComputer.value
                              ? "Would you like to change Player1 to mannual"
                              : "Would you like to convert Player 1 to Computer",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.r,
                              fontFamily: 'VarelaRound',
                              fontWeight: FontWeight.w600),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.r),
                            ),
                            onPressed: () {
                              isComputer.value = !isComputer.value;
                              plyturn.value = true;
                              print('isComputer = $isComputer');

                              ply1.value = 0;
                              ply2.value = 0;
                              Get.back();
                            },
                          ),
                          ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey.shade700,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'No',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.r),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      ));
            }),
        IconButton(
            icon: Icon(Icons.refresh, size: 30, color: Colors.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  backgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.white)),
                  title: Container(
                    height: 40.r,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.r),
                        color: Colors.grey.shade700),
                    child: Center(
                      child: Text('Snakes & Ladders',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'VarelaRound',
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  content: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      "Would you like Restart Game?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.r,
                          fontFamily: 'VarelaRound',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(color: Colors.white, fontSize: 16.r),
                      ),
                      onPressed: () {
                        ply1.value = 0;
                        ply2.value = 0;

                        Get.back();
                      },
                    ),

                    ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(color: Colors.white, fontSize: 16.r),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    )
                  ],
                ),
              );
            }),
        Container(
          height: 36.r,
          width: 78.r,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(width: 2.r, color: Colors.grey),
          ),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.imagesLogo, height: 50),
                Text(
                  '${con.totalDices.value}',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'VarelaRound',
                    fontWeight: FontWeight.bold,
                    fontSize: 18.r,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<int> snakeLadderCmd(int ply, BuildContext context) async {
    switch (ply) {
      // Snakes
      case 17:
        return await handleSnakeBite(ply, 6, context);
      case 33:
        return await handleSnakeBite(ply, 14, context);
      case 39:
        return await handleSnakeBite(ply, 28, context);
      case 54:
        return await handleSnakeBite(ply, 46, context);
      case 81:
        return await handleSnakeBite(ply, 43, context);
      case 99:
        return await handleSnakeBite(ply, 18, context);

      // Ladders
      case 84:
        return 95;
      case 47:
        return 86;
      case 50:
        return 59;
      case 2:
        return 43;
      default:
        return ply;
    }
  }

  /// Handles snake bite decision based on user's response.
  Future<int> handleSnakeBite(
      int currentPos, int newPos, BuildContext context) async {
    bool? userResponse = await ShowDialog().dicesDialog(context);

    if (userResponse == true) {
      // Reduce dice roll (for example, decrement by 1)
      randomNo.value = (randomNo.value > 1) ? randomNo.value - 1 : 1;
      return currentPos; // Stay at the same position
    } else {
      // Apply the snake bite
      return newPos;
    }
  }
}
