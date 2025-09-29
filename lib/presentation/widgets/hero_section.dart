import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:satz1/presentation/widgets/video_background.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.6,
      child: Stack(
        children: [
          const Positioned.fill(
            child: VideoBgWithController(
              // على الويب لو الملف جوّه مجلد web/ استخدمي مسار نسبي كده:
              url: 'assets/videos/satVideo2.mp4',
            ),
          ),

          SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'مرحبا بك في موقعي',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('ابدئي الآن'),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}