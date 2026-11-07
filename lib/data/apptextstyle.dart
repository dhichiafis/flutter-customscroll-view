import 'package:flutter/material.dart';
import 'package:mysliver/data/appcolor.dart';

class LightAppTheme{
  static TextStyle bodyBold=TextStyle(
    fontFamily:'Poppins',
    fontWeight:FontWeight.w900,
    fontSize: 20,
    color: LightAppColors.primaryText
  );
  static TextStyle bodyMedium=TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: LightAppColors.primaryText
  );
  static TextStyle bodySmall=TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w100,
    fontSize: 12,
    color: LightAppColors.secondaryText
  );
  static TextStyle bodyRegularBold=TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: LightAppColors.primaryText
  );
  static TextStyle bodyRegularSmall=TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w100,
    fontSize: 12,
    color: LightAppColors.secondaryText
  );
}