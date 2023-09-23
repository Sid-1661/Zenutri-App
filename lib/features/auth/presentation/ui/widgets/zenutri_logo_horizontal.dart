import 'package:flutter/material.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/features/common/presentation/widgets/svg_builder.dart';

class ZenutriLogo extends StatelessWidget {
  const ZenutriLogo({
    super.key, this.width, this.height,
  });

  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return SvgBuilder(
      path: ImageAssets.appLogoSvg,
      width: width?.rw ?? 158.rw,
      height: height?.rh ?? 44.rh,
    );
  }
}
