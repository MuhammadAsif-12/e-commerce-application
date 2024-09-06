import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/common/ui/color.dart';
import 'package:shopping_store/common/ui/custom_button.dart';
import 'package:shopping_store/common/ui/custom_button_outlined.dart';
import 'package:shopping_store/common/ui/spacerr.dart';
import 'package:shopping_store/common/ui/text.dart';

class DialogYesNoHorizontal extends StatelessWidget {
  String title;
  String text;
  String yesBtnText;
  String noBtnText;
  Color yesBtnTextColor;
  Color noBtnTextColor;
  Color yesBtnBg;
  Color noBtnBg;
  Color yesBtnBorderColor;
  Color noBtnBorderColor;
  Function? onYesTap;
  Function? onNoTap;
  bool isDismissable;

  DialogYesNoHorizontal(
      {super.key,
        required this.title,
        required this.text,
        required this.yesBtnText,
        required this.noBtnText,
        required this.yesBtnTextColor,
        required this.noBtnTextColor,
        required this.yesBtnBg,
        required this.noBtnBg,
        required this.yesBtnBorderColor,
        required this.noBtnBorderColor,
        required this.isDismissable,
        this.onYesTap,
        this.onNoTap});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AlertDialog(
      contentPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PrimaryText(
            text: title,
            size: 20,
            fontWeight: FontWeight.w600,
            textColor: theme.colorScheme.onBackground,
          ),
          const SpacerVertical(space: 20),
          PrimaryText(
            text: text,
            textColor: textColor92,
            size: 13,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          SpacerVertical.extraLarge,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: PrimaryButton(
                      text: yesBtnText,
                      backgroundColor: yesBtnBg,
                      onTap: () {
                        onYesTap?.call();
                      })),
              SpacerHorizontal.normal,
              Flexible(
                  child: PrimaryButtonOutlined(
                    showProgress: false,
                    text: noBtnText,
                    borderColor: noBtnBorderColor,
                    textColor: noBtnTextColor,
                    onTap: () {
                      onNoTap?.call();
                    },
                  ))
            ],
          )
        ],
      ),
    );
  }

  static DialogYesNoHorizontal changePhoneAlert(BuildContext context,
      {Function? onNoTap, Function? onYesTap}) {
    return DialogYesNoHorizontal(
        title: "Disclaimer",
        text: "Are you sure you want to change your number?",
        yesBtnText: "Yes",
        noBtnText: "No",
        yesBtnTextColor: Colors.white,
        yesBtnBg: primaryBtnColor,
        noBtnTextColor: Theme.of(context).colorScheme.onBackground,
        noBtnBg: Colors.transparent,
        yesBtnBorderColor: Colors.transparent,
        noBtnBorderColor: textColorB4,
        onNoTap: onNoTap,
        onYesTap: onYesTap,
        isDismissable: false);
  }
}