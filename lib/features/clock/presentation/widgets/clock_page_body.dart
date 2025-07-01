import 'package:clock_app/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_clock/one_clock.dart';

class ClockPageBody extends StatelessWidget {
  const ClockPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnalogClock(
        width: 300.w,
        hourHandColor: AppColors.blackColor,
        minuteHandColor: AppColors.blackColor,
        secondHandColor: AppColors.blackColor,
      ),
    );
  }
}