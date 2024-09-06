import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping_store/common/ui/text.dart';

class PrimaryIconButton extends StatelessWidget {
  String assetPath;
  double? radius;
  String? text;
  Function onClick;
  Color? bgColor;
  Color? iconTint;
  Color? borderColor;

  PrimaryIconButton(
      {super.key,
      required this.assetPath,
      this.radius,
      this.text,
      required this.onClick,
      this.bgColor,
      this.iconTint,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    if (text == null) {
      return IconButton(
          icon: SvgPicture.asset(assetPath,
              colorFilter:
                  ColorFilter.mode(iconTint ?? Colors.grey, BlendMode.srcIn)),
          onPressed: () {
            onClick.call();
          },
          style: IconButton.styleFrom(
              backgroundColor: bgColor ?? Colors.transparent,
              padding: const EdgeInsets.all(14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 10),
                side: borderColor != null
                    ? BorderSide(color: borderColor!)
                    : const BorderSide(color: Colors.transparent),
              )));
    } else {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.transparent),
            shape: BoxShape.rectangle,
            color: bgColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(radius ?? 10)),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius ?? 10),
          onTap: () {
            onClick.call();
          },
          child: Container(
            height: 44,
            child: Row(
              children: [
                IconButton(
                    icon: SvgPicture.asset(assetPath,
                        colorFilter: ColorFilter.mode(
                            iconTint ?? Colors.grey, BlendMode.srcIn)),
                    onPressed: () {
                      onClick.call();
                    }),
                const SizedBox(width: 6),
                PrimaryText(
                  text: text!,
                  size: 12,
                  fontWeight: FontWeight.w500,
                  textColor: theme.colorScheme.onBackground,
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      );
    }
  }
}
