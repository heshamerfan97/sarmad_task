import 'package:flutter/material.dart';
import 'package:sarmad_task/shared/views/helpers/palette.dart';

//This class is to specify textStyles for the app
class TextStyles {

  ///Base Styles
  static const basePrimaryStyle = TextStyle(
    color: Palette.primary,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const baseBlackStyle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  ///Specific Styles
  static const appBarStyle = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  static const hintStyle = TextStyle(
    color: Colors.grey,
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );

}
