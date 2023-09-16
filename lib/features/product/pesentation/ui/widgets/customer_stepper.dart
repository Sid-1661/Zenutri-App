import 'package:flutter/material.dart';
import 'package:zenutri_app/common/presentation/utils/app_colors.dart';
import 'package:zenutri_app/core/extensions/size_extension.dart';

@immutable
class CustomStepper extends StatefulWidget {
  CustomStepper({
    super.key,
    required this.lowerLimit,
    required this.upperLimit,
    required this.stepValue,
    required this.value,
    required this.onChange,
  });

  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  int value;
  final Function(int) onChange;

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.rSp, vertical: 6.rh),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.aluminium.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(50.rSp)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(30.rSp),
            child: const Icon(
              Icons.remove,
              color: AppColors.eerieBlack,
            ),
            onTap: () {
              widget.value = widget.value == widget.lowerLimit
                  ? widget.lowerLimit
                  : widget.value -= widget.stepValue;
              widget.onChange(widget.value);
              setState(() {});
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.rSp),
            child: Text(
              '${widget.value}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.black,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(30.rSp),
            child: const Icon(
              Icons.add,
              color: AppColors.eerieBlack,
            ),
            onTap: () {
              widget.value = widget.value == widget.upperLimit
                  ? widget.upperLimit
                  : widget.value += widget.stepValue;
              widget.onChange(widget.value);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
