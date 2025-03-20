import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Menu/menu_screen.dart';

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
                onPressed: () => Get.toNamed(MenuScreen.routeName),
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
}
