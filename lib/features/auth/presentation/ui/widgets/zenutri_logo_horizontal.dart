import 'package:flutter/material.dart';
import 'package:zenutri_app/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

class ZenutriLogoHorizontal extends StatelessWidget {
  const ZenutriLogoHorizontal({
    super.key, this.width, this.height,
  });

  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssets.appLogoHorizontal,
      width: width?.rw ?? 158.rw,
      height: height?.rh ?? 44.rh,
      fit: BoxFit.cover,
    );
  }
}
