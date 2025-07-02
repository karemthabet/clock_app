import 'package:clock_app/core/utils/colors/app_colors.dart';
import 'package:clock_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
              height: 130.h,
              padding: REdgeInsets.only(left: 35.w),
              color: AppColors.blueColor,
              child: Row(
                children: [
                  const Icon(
                    Icons.access_time_filled_outlined,
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    'Settings',
                    style: AppStyles.textStyleBold.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            );
          
  }
}