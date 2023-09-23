import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/carts/presentation/ui/screens/carts_screen.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/features/common/presentation/widgets/svg_builder.dart';
import 'package:zenutri_app/features/dashboard/presentation/controllers/dashboard_bottom_nav_controller.dart';
import 'package:zenutri_app/features/dashboard/presentation/ui/screens/home_screen.dart';
import 'package:zenutri_app/features/favourite/presentation/ui/screens/favourite_screen.dart';
import 'package:zenutri_app/features/profile/presentation/ui/screens/profile_screen.dart';

class DashboardMainNavScreen extends StatefulWidget {
  const DashboardMainNavScreen({super.key});

  @override
  State<DashboardMainNavScreen> createState() => _DashboardMainNavScreenState();
}

class _DashboardMainNavScreenState extends State<DashboardMainNavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    FavouriteScreen(),
    CartsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DashboardBottomNavController>(
        builder: (controller) {
          return _screens[controller.selectedIndex];
        }
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.aluminium,
              blurRadius: 1,
              offset: Offset(0.5, 0.5),
            ),
          ],
        ),
        child: GetBuilder<DashboardBottomNavController>(
          builder: (controller) {
            return BottomNavigationBar(
              currentIndex: controller.selectedIndex,
              onTap: (int index) {
                controller.changeIndex(index);
              },
              elevation: 0,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.darkBlueBlack,
              showUnselectedLabels: true,
              unselectedLabelStyle:
                  TextStyle(color: AppColors.shadowGray, fontSize: 10.rSp),
              selectedFontSize: 14.rSp,
              items: [
                BottomNavigationBarItem(
                  icon: SvgBuilder(
                    path: ImageAssets.homeSvg,
                    color: getIconColor(controller.selectedIndex == 0),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgBuilder(
                    path: ImageAssets.favouriteSvg,
                    color: getIconColor(controller.selectedIndex == 1),
                  ),
                  label: 'Favourite',
                ),
                BottomNavigationBarItem(
                  icon: SvgBuilder(
                    path: ImageAssets.cartSvg,
                    color: getIconColor(controller.selectedIndex == 2),
                  ),
                  label: 'My cart',
                ),
                BottomNavigationBarItem(
                  icon: SvgBuilder(
                    path: ImageAssets.profileSvg,
                    color: getIconColor(controller.selectedIndex == 3),
                  ),
                  label: 'Profile',
                ),
              ],
            );
          }
        ),
      ),
    );
  }

  Color getIconColor(bool selected) {
    return selected ? AppColors.primaryColor : AppColors.darkBlueBlack;
  }
}
