import 'package:clock_app/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class BuildSlider extends StatefulWidget {
  const BuildSlider({super.key});

  @override
  State<BuildSlider> createState() => _BuildSliderState();
}

class _BuildSliderState extends State<BuildSlider> {
  double clockSize = 50;

  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: AppColors.blueColor,
      value: clockSize,
      min: 20,
      max: 100,
      onChanged: (value) => setState(() => clockSize = value),
    );
  }
}
