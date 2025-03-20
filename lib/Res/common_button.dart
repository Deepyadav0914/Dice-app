import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buttons {
  static buildActionButton(String label, VoidCallback? onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 4.r)),
        margin: EdgeInsets.all(4.r),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 30.r),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 24.r,
                fontFamily: 'VarelaRound',
                color: onPressed == null ? Colors.grey[800] : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }


}
