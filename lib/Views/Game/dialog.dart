import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Menu/Controller/menu_controller.dart';
import '../Menu/menu_screen.dart';
import 'Controller/game_controller.dart';

final GameController controller = Get.put(GameController());
final MainmenuControlller con = Get.put(MainmenuControlller());

class ShowDialog {
  Future<bool> exitDialog(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
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
              "Are you sure you want to exit the game?",
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
                onPressed: () {
                  Get.toNamed(MenuScreen.routeName);

                  controller.ply1.value = 0;
                  controller.ply2.value = 0;
                },
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.white, fontSize: 16.r),
                ),
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: TextStyle(color: Colors.white, fontSize: 16.r),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  Future<bool> dicesDialog(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
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
              "Are you sure you give 25 dices and continue the game?",
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
                onPressed: () {
                  if (con.totalDices.value < 25) {
                    Get.snackbar(
                      "Not Enough Dices",
                      "You need at least 25 dices to continue in game.",
                      snackPosition: SnackPosition.TOP,
                      duration: const Duration(seconds: 3),
                      icon: Icon(Icons.cancel_outlined, color: Colors.black87),
                      backgroundColor: Colors.grey.shade500,
                      colorText: Colors.black87,
                    );
                    return;
                  }

                  con.lessDices(25);

                  Get.back(result: true); // Ensure returning `true`
                },
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.white, fontSize: 16.r),
                ),
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  controller.snakeBite.value = false;
                  Get.back(result: false); // Ensure returning `false`
                },
                child: Text(
                  'No',
                  style: TextStyle(color: Colors.white, fontSize: 16.r),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }
}
