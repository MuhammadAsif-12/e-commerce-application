import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/common/ui/color.dart';
import 'package:shopping_store/common/ui/text.dart';

class PrimaryCheckBox extends StatelessWidget {
  bool isSelected;
  String? text;
  Color? color;
  Border? border;
  Function(bool)? onChanged;

  PrimaryCheckBox(
      {super.key,
      required this.isSelected,
      this.text,
      this.onChanged,
      this.color,
      this.border});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 52,
          padding: const EdgeInsets.only(left: 16, right: 16),
          // width: 90,
          decoration: BoxDecoration(
            color: this.color ?? Colors.white,
            border: this.border ?? null,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: InkWell(
            onTap: () {
              onChanged?.call(!isSelected);
            },
            child: Row(
              children: [
                // const SizedBox(width: 16,),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer circle
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.grey,
                        border: Border.all(
                          color: grayDA, // You can customize the border color
                          width: 2,
                        ),
                      ),
                    ),
                    // Inner circle
                    if (isSelected)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorSecondary,
                        ),
                      ),
                  ],
                ),

                if (text != null) const SizedBox(width: 16),

                if (text != null)
                  PrimaryText(
                    text: text!,
                    size: 14,
                    textColor: theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w500,
                    // maxLines: 1,
                  )
              ],
            ),
          ),
        ))
      ],
    );
  }
}
