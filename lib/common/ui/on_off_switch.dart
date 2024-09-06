import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/common/ui/color.dart';

class SwitchWw extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  bool isActive = true;
  SwitchWw({super.key, required this.onChanged, required this.isActive});

  @override
  State<SwitchWw> createState() => _SwitchWwState();
}

class _SwitchWwState extends State<SwitchWw> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.75,
      child: Switch(
        value: widget.isActive,
        onChanged: (value) {
          setState(() {
            widget.isActive = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        activeTrackColor: colorSecondary,
        activeColor: Colors.white,
      ),
    );
  }
}