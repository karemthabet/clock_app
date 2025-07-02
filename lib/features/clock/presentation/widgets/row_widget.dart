import 'package:clock_app/core/utils/colors/app_colors.dart';
import 'package:clock_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowWidget extends StatelessWidget {
  final IconData iconData;
  final String title;

  const RowWidget({super.key, required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          Icon(iconData, color: AppColors.greyColor),
           SizedBox(width: 20.w),
          Text(
            title,
            style: AppStyles.textStyleBold.copyWith(
              color: AppColors.blackColor,
              fontSize: 25.sp,
            ),
          ),
        ],
      ),
    );
  }
}
