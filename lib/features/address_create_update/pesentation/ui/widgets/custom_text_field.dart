import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/presentation/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    required this.textEditingController,
    super.key,
    this.hPadding = 10,
    this.vPadding = 8,
    this.textColor = Colors.black,
    this.hint,
    this.maxLines = 10,
    this.minLines = 1,
    this.isPassword = false,
    this.containsPrefix = false,
    this.containsSuffix = false,
    this.prefixSvgPath = '',
    this.suffixSvgPath = '',
    this.prefixOnTapFunction,
    this.sufffixOnTapFunction,
    this.isEnabled = true,
    this.textInputType = TextInputType.text,
    // required this.validateFormFunction,
    this.showBorders = true,
  });

  double hPadding;
  double vPadding;
  Color textColor;
  bool isEnabled;
  String? hint;
  int maxLines;
  int minLines;

  // Function validateFormFunction;
  TextEditingController textEditingController;
  final bool? isPassword;
  bool containsPrefix;
  bool containsSuffix;
  String prefixSvgPath;
  String suffixSvgPath;
  Function? prefixOnTapFunction;
  Function? sufffixOnTapFunction;
  TextInputType? textInputType;
  bool showBorders;

  // final FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final customBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(
        context,
        color: !showBorders ? Colors.transparent : AppColors.antiFlashWhite,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(
        10,
      ),
    );
    return TextFormField(
      //focusNode: focus,
      keyboardType: textInputType,
      textAlignVertical: TextAlignVertical.center,
      controller: textEditingController,
      style: interTextStyle,
      maxLines: maxLines,
      minLines: minLines,
      textCapitalization: isPassword == true ? TextCapitalization.none : TextCapitalization.sentences,
      cursorColor: AppColors.primaryColor,
      enabled: isEnabled,
      decoration: InputDecoration(
        suffixIcon: suffixSvgPath == ''
            ? const SizedBox.shrink()
            : Padding(
                padding: EdgeInsets.only(
                  right: hPadding,
                ),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: Align(
                    child: SvgPicture.asset(
                      suffixSvgPath,
                    ),
                  ),
                ),
              ),
        hintText: hint ?? '',
        hintStyle: interTextStyle.copyWith(
          color: AppColors.aluminium,
          fontSize: 11,
        ),
        filled: true,
        fillColor: AppColors.white,
        // helperText: " ",
        contentPadding: EdgeInsets.symmetric(
          horizontal: hPadding,
          vertical: maxLines > 1 ? 15 : vPadding,
        ),
        border: customBorder,
        enabledBorder: customBorder,
        disabledBorder: customBorder,
        focusedBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(
            context,
            color: !showBorders ? Colors.transparent : AppColors.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(
            context,
            color: !showBorders ? Colors.transparent : AppColors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(
            context,
            color: !showBorders ? Colors.transparent : AppColors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        errorStyle: interTextStyle,
      ),
      // validator: (value) {
      //   final validator = validateFormFunction(value);
      //   if (validator == null) {
      //     return null;
      //   } else {
      //     log('Requesting focus');
      //     //focus.requestFocus();
      //     // return validator;
      //   }
      // },
    );
  }
}

TextStyle interTextStyle = const TextStyle(
  fontFamily: 'Outfit',
  color: Colors.black,
  fontWeight: FontWeight.w500,
  fontSize: 14,
);
