import 'package:clock_app/core/utils/colors/app_colors.dart';
import 'package:clock_app/core/utils/styles/app_styles.dart';
import 'package:clock_app/features/clock/presentation/widgets/build_colors.dart';
import 'package:clock_app/features/clock/presentation/widgets/build_row.dart';
import 'package:clock_app/features/clock/presentation/widgets/build_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClockSettingsDrawer extends StatefulWidget {
  const ClockSettingsDrawer({super.key});

  @override
  ClockSettingsDrawerState createState() => ClockSettingsDrawerState();
}

class ClockSettingsDrawerState extends State<ClockSettingsDrawer> {
  String selectedClockType = 'Analog';

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
          ),
          SizedBox(height: 20.h),
          const BuildRow(iconData: Icons.alarm, title: 'Clock Type'),

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
          const BuildRow(
            iconData: Icons.format_size_outlined,
            title: 'Clock Size',
          ),
          const BuildSlider(),

          Divider(height: 15.h, thickness: 0.5),
          const BuildRow(iconData: Icons.color_lens, title: 'Clock Color'),

          SizedBox(height: 14.h),
          const BuildColors(),
        ],
      ),
    );
  }
}
