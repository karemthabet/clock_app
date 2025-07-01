import 'package:clock_app/core/utils/colors/app_colors.dart';
import 'package:clock_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData myTheme = ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: AppColors.whiteColor),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppStyles.textStyleBold.copyWith(
        color: AppColors.whiteColor,
      ),

      backgroundColor: AppColors.blueColor,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.whiteColor,
    ),
  );
}
