import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  PrimaryText(
      {super.key,
      this.text = "",
      this.size,
      this.textColor,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.start,
      this.maxLines,
      this.overflow,
      this.softWrap,
      this.height,
      this.letterSpacing,
      this.underline = false});

  final String text;
  final double? size;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? height;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  bool? softWrap;
  final double? letterSpacing;
  final bool underline;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final double defaultLetterSpacing = letterSpacing ?? 0.0;

    return Text(text,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        softWrap: softWrap,
        style: theme.textTheme.bodySmall?.copyWith(
          fontSize: size,
          height: height,
          color: textColor ?? theme.colorScheme.onBackground,
          fontWeight: fontWeight,
          letterSpacing: defaultLetterSpacing,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
        ));
  }
}

class PrimaryHeading extends StatelessWidget {
  String text;

  PrimaryHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return PrimaryText(
      text: text,
      fontWeight: FontWeight.w600,
      textColor: theme.colorScheme.onBackground,
      size: 16,
      underline: false,
      letterSpacing: 0,
    );
  }
}

class PrimaryHeadingText extends StatelessWidget {
  String text;

  PrimaryHeadingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return PrimaryText(
      text: text,
      fontWeight: FontWeight.w500,
      textColor: Colors.grey.shade800,
      size: 14,
      underline: false,
      letterSpacing: 0,
    );
  }
}

class PrimaryBodyText extends StatelessWidget {
  String text;

  PrimaryBodyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return PrimaryText(
      text: text,
      fontWeight: FontWeight.normal,
      textColor: Color(0xFFB4B4B4),
      size: 14,
      underline: false,
      letterSpacing: 0,
    );
  }
}
