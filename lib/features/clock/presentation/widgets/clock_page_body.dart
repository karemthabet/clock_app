import 'dart:async';
import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';
import 'package:segment_display/segment_display.dart';
import 'package:clock_app/core/utils/colors/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClockPageBody extends StatefulWidget {
  final String clockType;
  final Color clockColor;
  final double clockSize;

  const ClockPageBody({
    super.key,
    required this.clockType,
    required this.clockColor,
    required this.clockSize,
  });

  @override
  State<ClockPageBody> createState() => _ClockPageBodyState();
}

class _ClockPageBodyState extends State<ClockPageBody> {
  late Timer _timer;
  late DateTime _now;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();

    // يحدث الوقت كل ثانية ويعيد بناء الواجهة لتحديث الساعة الرقمية
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // نوقف التايمر عند التخلص من الواجهة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.clockType) {
      case 'Analog':
        return _buildAnalogClock();
      case 'Digital':
        return _buildDigitalClock();
      case 'Text':
      default:
        return _buildTextClock(context);
    }
  }

  Widget _buildAnalogClock() {
    return Center(
      child: AnalogClock(
        isLive: true, 
        width: widget.clockSize,
        hourHandColor: widget.clockColor,
        minuteHandColor: widget.clockColor,
        secondHandColor: widget.clockColor,
        numberColor: widget.clockColor,
        showNumbers: true,
        showAllNumbers: true,
        textScaleFactor: 1.5,
        showTicks: true,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.whiteColor,
          border: Border.all(
            color: widget.clockColor,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildDigitalClock() {
    final timeString =
        '${_now.hour.toString().padLeft(2, '0')}:'
        '${_now.minute.toString().padLeft(2, '0')}:'
        '${_now.second.toString().padLeft(2, '0')}';

    return Center(
      child: SevenSegmentDisplay(
        value: timeString,
        size: widget.clockSize / 50,
        characterSpacing: 6.0,
        backgroundColor: Colors.transparent,
        segmentStyle: HexSegmentStyle(
          enabledColor: widget.clockColor,
          disabledColor: widget.clockColor.withOpacity(0.15),
        ),
      ),
    );
  }

  Widget _buildTextClock(BuildContext context) {
    final timeString = TimeOfDay.now().format(context); 

    return Center(
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Text(
          'It is $timeString',
          style: TextStyle(
            fontSize: widget.clockSize / 8,
            color: widget.clockColor,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: const Offset(1, 2),
                blurRadius: 2.0,
                color: Colors.black.withOpacity(0.2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
