import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/common/ui/color.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

@CopyWith()
class PrimaryButtonOutlined extends StatelessWidget {
  final String text;
  final bool isEnabled;
  final int radius;
  final int textSize;
  Color disabledBackgroundColor;
  Color textColor;
  Color borderColor;
  final bool showProgress;
  final Function()? onTap;

  PrimaryButtonOutlined({
    super.key,
    required this.text,
    this.radius = 12,
    this.textSize = 16,
    this.showProgress = false,
    this.disabledBackgroundColor = Colors.black87,
    required this.borderColor,
    this.isEnabled = true,
    required this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    if (showProgress) {
      return OutlinedButton(
        onPressed: () {
          onTap?.call();
        }, // Add your button's onPressed function here
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          side: BorderSide(color: borderColor, width: 1),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: theme.colorScheme.tertiary,
            )),
      );
    } else {
      return OutlinedButton(
        onPressed: () {
          onTap?.call();
        }, // Add your button's onPressed function here
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          side: BorderSide(color: borderColor, width: 1),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          text,
          style: theme.textTheme.titleMedium?.copyWith(
              color: textColor, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      );
    }
  }

  static PrimaryButtonOutlined redButton({Function? onTap, required String text, bool showProgress = false}) {
    return PrimaryButtonOutlined(
        text: text,
        borderColor: alertRedLight,
        showProgress: showProgress,
        textColor: alertRedLight,
        onTap: (){onTap?.call();});
  }
}