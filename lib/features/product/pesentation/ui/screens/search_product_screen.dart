import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopify_flutter/models/models.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/widgets/center_circular_progress_indicator.dart';
import 'package:zenutri_app/features/product/pesentation/state_holders/search_product_controller.dart';
import 'package:zenutri_app/features/product/pesentation/ui/screens/product_details_screen.dart';

class SearchProductScreen extends StatefulWidget {
  const SearchProductScreen({super.key});

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      Get.find<SearchProductController>().searchProducts(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.black,),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (String value) {
                if (value.trim().isNotEmpty) {
                  _onSearchChanged(value);
                }
              },
              decoration: const InputDecoration(
                hintText: 'Search',
                suffixIcon: Icon(Icons.search)
              ),
            ),
            Expanded(
              child: GetBuilder<SearchProductController>(
                builder: (controller) {
                  if (controller.inProgress) {
                    return const CenterCircularProgressLoader();
                  }
                  return ListView.builder(
                    itemCount: controller.productList.length,
                    itemBuilder: (context, index) {
                      final Product product = controller.productList[index];
                      return ListTile(
                        onTap: () {
                        Get.to(
                          () => ProductDetailsScreen(product: product),
                        );
                      },
                        leading: CachedNetworkImage(
                          imageUrl: product.image,
                        ),
                        title: Text(product.title),
                        subtitle: Text('${product.price} AUD'),
                      );
                    },
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
