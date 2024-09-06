import 'package:flutter/material.dart';

class Spacerr extends StatelessWidget {
  final double height;
  final double width;

  const Spacerr({super.key, this.height = 16.0, this.width = 0.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}



class SpacerVertical extends StatelessWidget {
  final double space;

  const SpacerVertical({super.key, this.space = 16.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space);
  }

  static SpacerVertical small = const SpacerVertical(space: 4,);
  static SpacerVertical normal = const SpacerVertical(space: 8,);
  static SpacerVertical medium = const SpacerVertical(space: 12,);
  static SpacerVertical large = const SpacerVertical(space: 16,);
  static SpacerVertical extraLarge = const SpacerVertical(space: 32,);

}

class SpacerHorizontal extends StatelessWidget {
  final double space;

  const SpacerHorizontal({super.key, this.space = 16.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: space);
  }


  static SpacerHorizontal small = const SpacerHorizontal(space: 4,);
  static SpacerHorizontal normal = const SpacerHorizontal(space: 8,);
  static SpacerHorizontal medium = const SpacerHorizontal(space: 12,);
  static SpacerHorizontal large = const SpacerHorizontal(space: 16,);
  static SpacerHorizontal extraLarge = const SpacerHorizontal(space: 32,);

}
