import 'package:clock_app/core/utils/colors/app_colors.dart';
import 'package:clock_app/core/utils/constants/app_constants.dart';
import 'package:clock_app/core/utils/styles/app_styles.dart' show AppStyles;
import 'package:clock_app/features/clock/presentation/widgets/clock_page_body.dart';
import 'package:clock_app/features/clock/presentation/widgets/custom_container.dart';
import 'package:clock_app/features/clock/presentation/widgets/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  String selectedClockType = 'Analog';
  Color selectedColor = Colors.black;
  double selectedSize = 300;

  void updateClockType(String type) {
    setState(() => selectedClockType = type);
  }

  void updateColor(Color color) {
    setState(() => selectedColor = color);
  }

  void updateSize(double size) {
    setState(() => selectedSize = size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clock App')),
      drawer: Drawer(
        child: Column(
          spacing: 5.h,
          children: [
           const CustomContainer(),
            const RowWidget(iconData: Icons.access_alarm, title: "Clock Type"),
            buildRadioTile("Analog", "Analog Clock"),
            buildRadioTile("Digital", "Digital Clock"),
            buildRadioTile("Text", "Text Clock"),
             Divider(height: 20.h, thickness: 0.5),
            const RowWidget(
              iconData: Icons.format_size_outlined,
              title: "Clock Size",
            ),
            Slider(
              value: selectedSize,
              min: 100,
              max: 400,
              divisions: 7,
              activeColor: AppColors.blueColor,
              onChanged: updateSize,
            ),
             Divider(height: 20.h, thickness: 0.5),
            const RowWidget(iconData: Icons.color_lens, title: "Clock Color"),
            SizedBox(
              height: 40,
              child: ListView.separated(
                padding: REdgeInsets.symmetric(horizontal: 16.w),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemCount: AppConstants.colors.length,
                itemBuilder: (context, index) {
                  final color = AppConstants.colors[index];
                  return GestureDetector(
                    onTap: () => updateColor(color),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color:
                              selectedColor == color
                                  ? Colors.black
                                  : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: ClockPageBody(
        clockType: selectedClockType,
        clockColor: selectedColor,
        clockSize: selectedSize,
      ),
    );
  }

  Widget buildRadioTile( String value, String label) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: selectedClockType,
          activeColor: AppColors.blueColor,
          onChanged: (val) => updateClockType(val!),
        ),
        Text(label, style: AppStyles.textStyle14.copyWith(color: Colors.black)),
      ],
    );
  }
}


