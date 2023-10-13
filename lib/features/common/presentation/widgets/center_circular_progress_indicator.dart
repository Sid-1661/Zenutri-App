import 'package:flutter/material.dart';

class CenterCircularProgressLoader extends StatelessWidget {
  const CenterCircularProgressLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
