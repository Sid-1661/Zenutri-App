import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../utils/image_assets.dart';

class NoDataFoundWidget extends StatelessWidget {
  String? title;

  NoDataFoundWidget({super.key, this.title = "No data found"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 100,
            child: Align(
              child: LottieBuilder.asset(
                ImageAssets.emptyCart,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("${title}")
        ],
      ),
    );
  }
}
