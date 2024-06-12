import 'package:flutter/material.dart';

import 'fonts.dart';
import 'pallet.dart';
import 'ui_helper.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    required this.buttonText,
    this.buttonColor,
    this.height,
    this.buttonTextColor = Palette.accentColor,
    this.textStyle,
  });

  final VoidCallback? onPressed;
  final String buttonText;
  final Color? buttonColor;
  final double? height;
  final Color buttonTextColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: onPressed,
      minWidth: deviceWidth(context) / 1.05,
      height: height ?? screenAwareSize(82, context),
      color: buttonColor ?? Colors.transparent,
      disabledColor: Palette.semiGreyColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        buttonText,
        style: textStyle ??
            Styles.kMediumTextStyle.copyWith(
                fontWeight: FontWeight.w600,
                fontFamily: "MT",
                color: buttonTextColor,
                fontSize: screenAwareSize(22, context)),
      ),
    );
  }
}

