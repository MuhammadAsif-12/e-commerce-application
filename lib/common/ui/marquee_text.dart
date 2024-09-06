import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/common/ui/text.dart';
import 'package:marquee/marquee.dart';


class MarqueeText extends StatelessWidget {
  final String text;
  final double thresholdWidth;
  Color color;
  double size;
  final FontWeight fontWeight;
  double blankSpace;

  MarqueeText({
    Key? key,
    this.color = Colors.black,
    required this.text,
    this.size = 14.0,
    this.fontWeight = FontWeight.w500,
    this.blankSpace = 20,
    this.thresholdWidth = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
          text: text,
          style: TextStyle(
              fontSize: size,
              fontWeight: this.fontWeight)), // Adjust text style as needed
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    final double textWidth = textPainter.size.width;

    if (textWidth > thresholdWidth) {
      // Apply Marquee effect
      return Marquee(
        text: text,
        fadingEdgeEndFraction: 0.1,
        fadingEdgeStartFraction: 0.1,
        style: TextStyle(
            fontSize: size,
            letterSpacing: -.3,
            fontWeight: this.fontWeight,
            color: color),
        blankSpace: this.blankSpace, // Adjust text style as needed
      );
    } else {
      // Return normal Text widget
      return PrimaryText(
        text: text,
        textAlign: TextAlign.start,
        size: this.size,
        maxLines: 1,
        fontWeight: fontWeight,
        textColor: color,
        letterSpacing: -.3,
      );
    }
  }
}