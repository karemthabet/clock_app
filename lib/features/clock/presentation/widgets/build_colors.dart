import 'package:clock_app/core/utils/colors/app_colors.dart';
import 'package:clock_app/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class BuildColors extends StatefulWidget {
  const BuildColors({super.key});

  @override
  State<BuildColors> createState() => _BuildColorsState();
}

class _BuildColorsState extends State<BuildColors> {
  Color selectedColor = AppColors.greyColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
