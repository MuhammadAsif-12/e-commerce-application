import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/common/ui/color.dart';

class AppBottomsheet {

  static Future<void> display(BuildContext context,Widget widget) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: boxColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25)
            )
        ),
        builder: (_) {
          return widget;
        }
    );
  }
}