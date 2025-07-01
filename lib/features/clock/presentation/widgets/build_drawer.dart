import 'package:clock_app/core/utils/colors/app_colors.dart';
import 'package:clock_app/core/utils/constants/app_constants.dart';
import 'package:clock_app/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClockSettingsDrawer extends StatefulWidget {
  const ClockSettingsDrawer({super.key});

  @override
  ClockSettingsDrawerState createState() => ClockSettingsDrawerState();
}

class ClockSettingsDrawerState extends State<ClockSettingsDrawer> {
  String selectedClockType = 'Analog';
  double clockSize = 30;
  Color selectedColor = AppColors.greyColor;


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 130.h,
            width: double.infinity,
            padding: REdgeInsets.symmetric(horizontal: 20.w),
            color: AppColors.blueColor,
            child: Row(
              children: [
                Icon(
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
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                Icon(Icons.alarm, color: AppColors.greyColor),
                SizedBox(width: 20.w),
                Text(
                  'Clock Type',
                  style: AppStyles.textStyle14.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

          RadioListTile(
            value: 'Analog',
            title: const Text('Analog Clock'),
            groupValue: selectedClockType,
            activeColor: AppColors.blueColor,
            onChanged: (newValue) {
              setState(() {
                selectedClockType = newValue!;
              });
            },
          ),
          RadioListTile(
            value: 'Digital',
            title: const Text('Digital Clock'),
            groupValue: selectedClockType,
            activeColor: AppColors.blueColor,

            onChanged: (newValue) {
              setState(() {
                selectedClockType = newValue!;
              });
            },
          ),
          RadioListTile(
            value: 'Text',
            title: const Text('Text Clock'),
            groupValue: selectedClockType,
            activeColor: AppColors.blueColor,

            onChanged: (newValue) {
              setState(() {
                selectedClockType = newValue!;
              });
            },
          ),
          Divider(height: 15.h, thickness: 0.5),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                Icon(Icons.text_fields_outlined, color: AppColors.greyColor),
                SizedBox(width: 20.w),
                Text(
                  'Clock Size',
                  style: AppStyles.textStyle14.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

          Slider(
            activeColor: AppColors.blueColor,
            value: clockSize,
            min: 20,
            max: 100,
            onChanged: (value) => setState(() => clockSize = value),
          ),
          Divider(height: 15.h, thickness: 0.5),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 12.w),
            child:  Row(
              children: [
                Icon(Icons.palette, color: AppColors.greyColor),
                SizedBox(width: 20.w),
                Text(
                  'Clock Color',
                  style: AppStyles.textStyle14.copyWith(
                    color: AppColors.blackColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
           SizedBox(height: 14.h),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            spacing: 8,
            children:
                AppConstants.colors.map((color) {
                  return GestureDetector(
                    onTap: () => setState(() => selectedColor = color),
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color:
                              selectedColor == color
                                  ? Colors.black
                                  : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      width: 30,
                      height: 30,
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
