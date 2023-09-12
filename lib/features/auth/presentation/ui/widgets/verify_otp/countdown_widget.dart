import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({super.key});

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  int _seconds = 0;
  bool _isRunning = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startCountdown() {
    _seconds = 30; // Change this to set your desired countdown duration.
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        _isRunning = false;
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Visibility(
          visible: _isRunning,
          replacement: TextButton(
            onPressed: () {
              if (!_isRunning) {
                startCountdown();
              }
            },
            child: const Text('Resend'),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Resend after ',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primaryColor,
                    ),
              ),
              Text(
                '$_seconds s',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primaryColor,
                    ),
              )
            ],
          ),
        )
      ],
    );
  }
}
