import 'package:flutter/material.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

SizedBox horizontalSpace(double width) {
  return SizedBox(
    width: width.rw,
  );
}

SizedBox verticalSpace(double height) {
  return SizedBox(
    height: height.rh,
  );
}
