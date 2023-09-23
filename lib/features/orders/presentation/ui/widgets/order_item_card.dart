import 'package:flutter/material.dart';
import 'package:zenutri_app/features/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/features/common/presentation/utils/image_assets.dart';
import 'package:zenutri_app/features/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/orders/presentation/ui/widgets/step_progress_widget.dart';

class OrderItemCard extends StatefulWidget {
  const OrderItemCard({
    super.key,
    required this.isActive,
    required this.status,
  });

  final bool isActive;
  final String status;

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  final List<String> titles = ['Packed', 'Shipping', 'Delivered'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.antiFlashWhite, width: 2.rSp),
          borderRadius: BorderRadius.circular(16.rSp)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.rSp),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order No. 56987',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    verticalSpace(8),
                    Row(
                      children: [
                        Text(
                          '\$285.30 AUD',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        horizontalSpace(4),
                        CircleAvatar(
                          backgroundColor: AppColors.shadowGray,
                          radius: 4.rSp,
                        ),
                        horizontalSpace(4),
                        Text(
                          '30 Sep',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  width: 46.rSp,
                  height: 46.rSp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.rSp),
                    color: AppColors.teaGreen,
                    image: const DecorationImage(
                      image: AssetImage(ImageAssets.capsuleBgPng),
                    ),
                  ),
                ),
                horizontalSpace(6),
                Container(
                  width: 46.rSp,
                  height: 46.rSp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.rSp),
                    color: AppColors.teaGreen,
                    image: const DecorationImage(
                      image: AssetImage(ImageAssets.capsuleBgPng),
                    ),
                  ),
                ),
                horizontalSpace(6),
                CircleAvatar(
                  backgroundColor: AppColors.teaGreen,
                  child: Text(
                    '+2',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 15, color: AppColors.black),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.isActive,
            child: Column(
              children: [
                Divider(
                  thickness: 2.rSp,
                  height: 0,
                  color: AppColors.antiFlashWhite,
                ),
                Padding(
                  padding: EdgeInsets.all(16.rSp),
                  child: StepProgressWidget(
                    width: MediaQuery.of(context).size.width,
                    curStep: 2,
                    inactiveColor: AppColors.teaGreen,
                    titles: titles,
                    activeColor: AppColors.primaryColor,
                    lineWidth: 3.rSp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
