import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopify_flutter/models/src/product/shopify_image/shopify_image.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

class ProductImageSlider extends StatelessWidget {
  ProductImageSlider({
    super.key,
    required this.images,
  });

  List<ShopifyImage> images;

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
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return CachedNetworkImage(
                    imageUrl: i.originalSrc,
                    fit: BoxFit.scaleDown,
                    errorWidget: (context, _, __) {
                      return const Center(
                        child: Icon(Icons.error_outline),
                      );
                    },
                  );
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
              for (int i = 0; i < images.length; i++) {
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
