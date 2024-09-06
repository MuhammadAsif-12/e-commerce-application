import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/common/ui/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  String? startIconPath;
  final String? endIconPath;
  final Function? onBackPressed;
  final Function? onActionPressed;

  PrimaryAppBar({
    super.key,
    this.title,
    this.startIconPath = "assets/images/back.svg",
    this.endIconPath,
    this.onBackPressed,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AppBar(
      centerTitle: true,
      title: Text(title ?? "",
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(
            fontSize: 16,
            color: theme.colorScheme.onBackground,
            fontWeight: FontWeight.w600,
          )),
      leading: (startIconPath != null)
          ? IconButton(
              onPressed: () {
                onBackPressed?.call();
              },
              icon: SvgPicture.asset(
                startIconPath!,
                semanticsLabel: 'Back Logo',
              ))
          : null,
      actions: <Widget>[
        if (endIconPath != null)
          IconButton(
            onPressed: () {
              onActionPressed?.call();
            },
            icon: SvgPicture.asset(
              endIconPath!,
              semanticsLabel: 'Acme Logo',
            ),
          ),
      ],
      backgroundColor: appBackGround,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
