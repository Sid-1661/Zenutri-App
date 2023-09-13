import 'package:flutter/material.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/common/presentation/widgets/svg_builder.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

class DashboardMainNavScreen extends StatefulWidget {
  const DashboardMainNavScreen({super.key});

  @override
  State<DashboardMainNavScreen> createState() => _DashboardMainNavScreenState();
}

class _DashboardMainNavScreenState extends State<DashboardMainNavScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.graniteGray,
              blurRadius: 1,
              offset: Offset(0.5, 0.5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            _selectedIndex = index;
            if (mounted) {
              setState(() {});
            }
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
                color: getIconColor(_selectedIndex == 0),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgBuilder(
                path: ImageAssets.favouriteSvg,
                color: getIconColor(_selectedIndex == 1),
              ),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: SvgBuilder(
                path: ImageAssets.cartSvg,
                color: getIconColor(_selectedIndex == 2),
              ),
              label: 'My cart',
            ),
            BottomNavigationBarItem(
              icon: SvgBuilder(
                path: ImageAssets.profileSvg,
                color: getIconColor(_selectedIndex == 3),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Color getIconColor(bool selected) {
    return selected ? AppColors.primaryColor : AppColors.darkBlueBlack;
  }
}
