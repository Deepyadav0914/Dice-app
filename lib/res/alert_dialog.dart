import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget showDialogs(BuildContext context) {
  String Acme = 'acme';
  return AlertDialog(
    backgroundColor: Colors.yellow.shade50,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.white, width: 10.r)),
    title: Center(
        child: Text("REWARD",
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: Acme))),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.casino, size: 40, color: Colors.black87),
            8.horizontalSpace,
            Text("25 dice",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: Acme)),
          ],
        ),
        SizedBox(height: 15),
        Container(
          padding: EdgeInsets.all(8),
          child: Center(
              child: Text(
            "You have collected dice!",
            style: TextStyle(fontFamily: Acme, fontSize: 18.r),
          )),
        )
      ],
    ),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            child: Text(
              "CLOSE",
              style: TextStyle(
                  color: Colors.white, fontSize: 16.r, fontFamily: Acme),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "CLAIM",
              style: TextStyle(
                  color: Colors.white, fontSize: 16.r, fontFamily: Acme),
            ),
          ),
        ],
      )
    ],
  );
}
