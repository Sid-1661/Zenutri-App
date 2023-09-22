import 'package:flutter/material.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';
import 'package:zenutri_app/features/orders/presentation/ui/widgets/order_item_card.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: const BackButton(
          color: AppColors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.rw, right: 16.rw, bottom: 16.rw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(6),
              Text(
                'My Order',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              verticalSpace(3),
              Text(
                '4 Orders',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.shadowGray),
              ),
              verticalSpace(22),
              Text(
                'Active',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 22.rSp),
              ),
              verticalSpace(16),
              ListView.separated(
                itemCount: 2,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return const OrderItemCard(
                    isActive: true,
                    status: 'Shipping',
                  );
                },
                separatorBuilder: (context, index) {
                  return verticalSpace(8);
                },
              ),
              verticalSpace(32),
              Text(
                'History',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 22.rSp),
              ),
              verticalSpace(16),
              ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return const OrderItemCard(
                    isActive: false,
                    status: 'Shipping',
                  );
                },
                separatorBuilder: (context, index) {
                  return verticalSpace(8);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
