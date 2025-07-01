import 'package:clock_app/core/utils/theme/app_theme.dart';
import 'package:clock_app/features/clock/presentation/pages/clock_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ClockApp());
}

class ClockApp extends StatelessWidget {
  const ClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (context, child) =>
              MaterialApp(
                theme: AppTheme.myTheme,
                
                debugShowCheckedModeBanner: false, home: ClockPage()),
    );
  }
}
