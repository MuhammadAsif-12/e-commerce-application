import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/common/ui/color.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final int radius;
  final int textSize;
  Color disabledBackgroundColor;
  Color? backgroundColor;
  final bool showProgress;
  final Function()? onTap;
  Color? textColor;
  final FontWeight? fontWeight;

  PrimaryButton({
    super.key,
    required this.text,
    this.radius = 12,
    this.textSize = 16,
    this.showProgress = false,
    this.backgroundColor = primaryBtnColor,
    this.disabledBackgroundColor = grayF1,
    this.isEnabled = true,
    this.onTap,
    this.textColor,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final ButtonStyle primaryButtonStyle = TextButton.styleFrom(
      // foregroundColor: Colors.black87,
      backgroundColor: showProgress
          ? Colors.grey
          : isEnabled
              ? backgroundColor
              : disabledBackgroundColor,
      // disabledBackgroundColor: theme.colorScheme.onSurface.withAlpha(12),
      minimumSize: const Size.fromHeight(52),
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      textStyle: theme.textTheme.titleSmall,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );

    if (showProgress) {
      return ElevatedButton(
        style: primaryButtonStyle,
        onPressed: null,
        child: SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: theme.colorScheme.tertiary,
            )),
      );
    } else {
      return ElevatedButton(
        style: primaryButtonStyle,
        onPressed: isEnabled ? onTap : null,
        child: Text(
          text,
          style: theme.textTheme.titleMedium?.copyWith(
              color: isEnabled ? textColor ?? Colors.white : textColor92,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      );
    }
  }
}
