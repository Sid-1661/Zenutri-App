import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/features/common/presentation/widgets/center_circular_progress_indicator.dart';
import 'package:zenutri_app/features/common/presentation/widgets/product_card.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/dashboard/presentation/controllers/home_products_controller.dart';
import 'package:zenutri_app/features/dashboard/presentation/ui/widgets/home/home_banner_widget.dart';
import 'package:zenutri_app/features/product/pesentation/ui/screens/search_product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<HomeProductController>().getBundleProducts();
        },
        child: SingleChildScrollView(
          primary: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.rw),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(16),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SearchProductScreen());
                  },
                  child: const TextField(
                    enabled: false,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search), hintText: 'Search'),
                  ),
                ),
                verticalSpace(32),
                const HomeBannerWidget(),
                verticalSpace(32),
                Text(
                  'Our Products',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 22.rSp),
                ),
                verticalSpace(16),
                productGridView
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get productGridView {
    return GetBuilder<HomeProductController>(
      builder: (homeProductController) {
        if (homeProductController.inProgress) {
          return SizedBox(
            height: 100,
            width: 100.w,
            child: const CenterCircularProgressLoader(),
          );
        }
        return GridView.builder(
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homeProductController.productList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75.rSp,
                crossAxisSpacing: 8.rSp,
                mainAxisSpacing: 8.rSp),
            itemBuilder: (context, index) {
              return ProductCard(
                product: homeProductController.productList[index],
              );
            });
      }
    );
  }
}
