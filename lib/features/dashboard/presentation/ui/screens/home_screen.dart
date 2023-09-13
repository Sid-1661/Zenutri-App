import 'package:flutter/material.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/common/presentation/utils/spacing.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

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
        title: Text('Home', style: TextStyle(
          fontSize: 17.rSp,
          color: AppColors.black
        ),),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.rw),
        child: Column(
          children: [
            verticalSpace(16),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search'
              ),
            ),
            verticalSpace(32),
            Container(
              width: 100.w,
              height: 313.rh,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.rSp),
                color: AppColors.teaGreen
              ),
              child: Padding(
                padding: EdgeInsets.all(24.rSp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(24),
                    Text(
                      'Get your vitamins suggestion',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    verticalSpace(12),
                    Text('Answer some questions and get your recommendation',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    verticalSpace(25),
                    SizedBox(
                      width: 260.rw,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Recommend My Vitamins'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
