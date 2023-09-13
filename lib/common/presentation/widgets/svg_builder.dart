import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgBuilder extends StatelessWidget {
  final String path;
  final double? height, width;
  final Color? color;

  const SvgBuilder(
      {super.key, required this.path, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      height: height,
      width: width,
      color: color,
    );
  }
}
