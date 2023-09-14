import 'package:flutter/material.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/dashboard/presentation/ui/widgets/home/home_banner_widget.dart';
import 'package:zenutri_app/features/dashboard/presentation/ui/widgets/product_card.dart';

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
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyle(fontSize: 17.rSp, color: AppColors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        primary: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.rw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),
              const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: 'Search'),
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
    );
  }

  GridView get productGridView {
    return GridView.builder(
        primary: false,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8.rSp,
            crossAxisSpacing: 8.rSp,
            mainAxisSpacing: 8.rSp),
        itemBuilder: (context, index) {
          return const ProductCard();
        });
  }
}
