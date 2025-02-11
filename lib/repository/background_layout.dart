import 'package:flutter/material.dart';

class CheckeredPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const int numSquares = 7; // Number of squares in a row
    final double squareSize = size.width / numSquares;
    final Paint paint = Paint();

    for (int row = 0; row < (size.height / squareSize).ceil(); row++) {
      for (int col = 0; col < numSquares; col++) {
        paint.color = (row + col) % 2 == 0
            ? Colors.white.withOpacity(0.2)
            : Colors.transparent;
        canvas.drawRect(
          Rect.fromLTWH(
              col * squareSize, row * squareSize, squareSize, squareSize),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
