import 'package:clock_app/features/clock/presentation/widgets/build_drawer.dart';
import 'package:clock_app/features/clock/presentation/widgets/clock_page_body.dart';
import 'package:flutter/material.dart';

class ClockPage extends StatelessWidget {
  const ClockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(' Octal Clock')),
      drawer: const ClockSettingsDrawer(),
      body: const ClockPageBody(),
    );
  }
}
