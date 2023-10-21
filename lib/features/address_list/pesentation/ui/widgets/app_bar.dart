import 'package:flutter/material.dart';

import '../../../../common/presentation/utils/app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  CommonAppBar({
    required this.height,
    required this.elevation,
    required this.title,
    required this.context,
    required this.finishScreen,
    required this.isTitleCenter,
    required this.icon,
    this.isLeadingIconShow = true,
    super.key,
  });
  String title;
  final double height;
  final double elevation;
  final bool finishScreen;
  final bool isTitleCenter;
  final IconData icon;
  final bool isLeadingIconShow;
  BuildContext context;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return _appbar();
  }

  Widget _appbar() {
    return AppBar(
      centerTitle: isTitleCenter,
      title: Text(
        title,
      ),
      elevation: elevation,automaticallyImplyLeading: isLeadingIconShow,
      backgroundColor: AppColors.white,
      leading: isLeadingIconShow? IconButton(
        onPressed: () {
          if (finishScreen != null) {
            if (finishScreen) {
              Navigator.pop(context);
            }
          } else {
            Navigator.pop(context);
          }
        },
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.black,
          size: 20,
        ),
      ) : SizedBox(),
    );
  }
}
