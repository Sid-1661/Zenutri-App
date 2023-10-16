import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/auth/presentation/state_holders/auth_controller.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, this.radius});

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 24.rSp,
      child: Text(
        (Get.find<AuthController>().shopifyUser?.firstName?[0] ?? 'U')
            .toUpperCase(),
        style: TextStyle(fontSize: 24.rSp),
      ),
    );
  }
}
