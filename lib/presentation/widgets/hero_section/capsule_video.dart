import 'package:flutter/material.dart';
import 'package:satz1/core/constants/const_size.dart';
import 'package:video_player/video_player.dart';

class CapsuleVideo extends StatefulWidget {
  final String assetPath;
  final double height; // ارتفاع الحاوية التي سيملؤها الفيديو رأسياً
  const CapsuleVideo({
    super.key,
    required this.assetPath,
    required this.height,
  });

  @override
  State<CapsuleVideo> createState() => _CapsuleVideoState();
}

class _CapsuleVideoState extends State<CapsuleVideo> {
  late final VideoPlayerController _c;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _c = VideoPlayerController.asset(widget.assetPath)
      ..setLooping(true)
      ..setVolume(0.0); // مهم للـ autoplay على الويب
    _c.initialize().then((_) async {
      if (!mounted) return;
      setState(() => _ready = true);
      await _c.play();
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ConstSize.capsuleRadius),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        height: widget.height,
        child: _ready
            ? FittedBox(
          fit: BoxFit.fitHeight, // يملى الارتفاع فقط
          alignment: Alignment.center,
          child: SizedBox(
            width: _c.value.size.width,
            height: _c.value.size.height,
            child: VideoPlayer(_c),
          ),
        )
            : const SizedBox.expand(),
      ),
    );
  }
}