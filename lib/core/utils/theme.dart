import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes{
  static ThemeData lighttheme = ThemeData(
          scaffoldBackgroundColor: AppColors.whitecolor,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            color: AppColors.graycolor ),
           enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.graycolor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary),
      
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.redcolor),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.redcolor),
          ),
        )
      );
  
}
