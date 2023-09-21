import 'package:flutter/material.dart';
import 'package:zenutri/common/presentation/utils/image_assets.dart';


class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
              image: AssetImage(ImageAssets.back),
              fit: BoxFit.cover,
            ),
          ),
          ),
        ],
      ),
    );
  }
}