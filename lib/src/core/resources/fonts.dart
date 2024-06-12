import 'package:flutter/material.dart';

import 'pallet.dart';
import 'ui_helper.dart';

class Styles {
  static const TextStyle kSmallTextStyle =
      TextStyle(fontFamily: "MT", fontSize: UIHelper.smallfontSize);
  static const TextStyle kLargeTextStyle =
      TextStyle(fontFamily: "MT", fontSize: UIHelper.largefontSize);
  static const TextStyle kMediumTextStyle =
      TextStyle(fontFamily: "MT", fontSize: UIHelper.mediumfontSize);
  static const kRedTextFieldStyling = OutlineInputBorder(
    borderRadius: kTextFieldBorder,
    borderSide: BorderSide(color: Palette.primaryColor),
  );

  static OutlineInputBorder kYellowTextFieldStyling = const OutlineInputBorder(
      borderRadius: kTextFieldBorder,
      borderSide: BorderSide(color: Palette.secondaryColor));
  static OutlineInputBorder kTextFieldBlackStyling = OutlineInputBorder(
      gapPadding: 1.0,
      borderRadius: kTextFieldBorder,
      borderSide: BorderSide(width: 0.8, color: Colors.black.withOpacity(0.4)));
  static const kTextFieldBorder = BorderRadius.all(
    Radius.circular(10),
  );
}
