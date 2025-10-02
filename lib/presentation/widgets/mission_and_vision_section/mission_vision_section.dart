import 'package:flutter/material.dart';
import '../../../core/constants/const_size.dart';
import 'mission_image.dart';
import 'mission_text.dart';

class MissionVisionSection extends StatelessWidget {
  const MissionVisionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= ConstSize.missionBreakpoint;

    return Container(
      width: double.infinity,
     color: Colors.white,
      padding: const EdgeInsets.all(ConstSize.missionPadding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: isWide
              ? const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 5, child: MissionImage()),
              SizedBox(width: ConstSize.missionGap),
              Expanded(flex: 5, child: MissionText()),

            ],
          )
              : const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MissionImage(),
              SizedBox(height: ConstSize.missionGap),
              MissionText(),
            ],
          ),
        ),
      ),
    );
  }
}