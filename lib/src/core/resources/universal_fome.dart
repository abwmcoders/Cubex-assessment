import 'package:flutter/material.dart';

import 'fonts.dart';
import 'pallet.dart';
import 'ui_helper.dart';

class UniversalFormField extends StatelessWidget {
  const UniversalFormField({
    super.key,
    required this.label,
    this.onChanged,
    this.fieldController,
    this.hintText,
    this.prefix,
    this.labelColor,
    this.onSaved,
    this.onEditingComplete,
    this.hintTextStyle,
    this.validator,
    this.shouldBeWhite,
    this.letterSpacing = 1.5,
    this.suffixWidget,
    this.obscure,
    this.obscureCharacter = "●",
    this.keyboardType,
  });

  final String? label;
  final Function(String)? onChanged;
  final TextEditingController? fieldController;
  final String? hintText;
  final Widget? prefix;
  final Color? labelColor;
  final Function(String?)? onSaved;
  final VoidCallback? onEditingComplete;
  final TextStyle? hintTextStyle;
  final String? Function(String?)? validator;
  final bool? shouldBeWhite;
  final double? letterSpacing;
  final Widget? suffixWidget;
  final bool? obscure;
  final String obscureCharacter;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "$label",
            style: const TextStyle(
              fontFamily: 'MT',
              //color: Colors.black,
              fontSize: UIHelper.mediumfontSize,
              //fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        UIHelper.verticalSpaceSmall,
        Theme(
          data: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              contentPadding:
                  EdgeInsets.only(left: screenAwareSize(20, context)),
              border: Styles.kTextFieldBlackStyling,
              focusedBorder: Styles.kYellowTextFieldStyling,
              enabledBorder: Styles.kTextFieldBlackStyling,
              errorBorder: Styles.kRedTextFieldStyling,
              focusedErrorBorder: Styles.kRedTextFieldStyling,
            ),
          ),
          child: TextFormField(
            scrollPadding: EdgeInsets.zero,
            obscuringCharacter: obscureCharacter,
            cursorWidth: 0.8,
            cursorColor: Palette.secondaryColor,
            cursorHeight: screenAwareSize(25, context),
            controller: fieldController,
            style: TextStyle(
              fontSize: UIHelper.mediumfontSize,
              fontWeight: FontWeight.bold,
              letterSpacing: letterSpacing,
              fontFamily: "MT",
            ),
            keyboardType: keyboardType ?? TextInputType.number,
            onChanged: onChanged,
            autocorrect: false,
            validator: validator,
            obscureText: obscure ?? false,
            onEditingComplete: onEditingComplete,
            onSaved: onSaved,
            decoration: InputDecoration(
              fillColor: Palette.accentColor,
              filled: true,
              border: OutlineInputBorder(
                gapPadding: 1.0,
                borderRadius: BorderRadius.circular(1),
              ),
              suffixIcon: suffixWidget ?? const Text(""),
              prefix: prefix ?? const Text(""),
              hintText: hintText,
              errorStyle: Styles.kSmallTextStyle.copyWith(
                color: Palette.primaryColor,
                fontWeight: FontWeight.bold,
              ),
              hintStyle: hintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 20),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Palette.secondaryColor),
  );
}
