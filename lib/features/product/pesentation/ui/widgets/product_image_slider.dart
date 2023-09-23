import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

class ProductImageSlider extends StatelessWidget {
  ProductImageSlider({
    super.key,
  });

  final ValueNotifier<int> _selectedImageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 430.rh,
          width: 100.w,
          decoration: const BoxDecoration(color: AppColors.teaGreen),
          child: CarouselSlider(
            options: CarouselOptions(
                height: 430.rh,
                viewportFraction: 1,
                onPageChanged: (pageNo, _) {
                  _selectedImageIndex.value = pageNo;
                }),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(ImageAssets.capsuleBgPng);
                },
              );
            }).toList(),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedImageIndex,
            builder: (context, value, _) {
              List<Widget> list = [];
              for (int i = 0; i < 5; i++) {
                list.add(Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: value == i ? AppColors.primaryColor : Colors.white,
                  ),
                ));
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              );
            },
          ),
        )
      ],
    );
  }
}
