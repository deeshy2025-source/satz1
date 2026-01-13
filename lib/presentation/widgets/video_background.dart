import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBgWithController extends StatefulWidget {
  final String url;
  const VideoBgWithController({super.key, required this.url});

  @override
  State<VideoBgWithController> createState() => _VideoBgWithControllerState();
}

class _VideoBgWithControllerState extends State<VideoBgWithController> {
  late final VideoPlayerController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = VideoPlayerController.asset('assets/videos/satVideo2.mp4')
      ..setLooping(true)
      ..setVolume(0.0)
      ..initialize().then((_) {
        setState(() {});
        _ctrl.play();
      });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  // @override
  // Widget build(BuildContext context) {
  //   if (!_ctrl.value.isInitialized) {
  //     return const SizedBox.expand(); // ممكن تضيفي لودر/صورة
  //   }
  //   return Stack(
  //     children: [
  //       // نخلي الفيديو يغطي الخلفية كلها
  //       Positioned.fill(
  //         child: FittedBox(
  //           fit: BoxFit.cover,
  //           child: SizedBox(
  //             width: _ctrl.value.size.width,
  //             height: _ctrl.value.size.height,
  //             child: VideoPlayer(_ctrl),
  //           ),
  //         ),
  //       ),
  //       Positioned.fill(
  //         child: Container(color: Colors.black.withOpacity(0.35)),
  //       ),
  //       // المحتوى فوق الفيديو...
  //     ],
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    if (!_ctrl.value.isInitialized) {
      final err = _ctrl.value.errorDescription;
      return Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                err == null ? 'Loading video...' : 'Video error: $err',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    }

    return FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: _ctrl.value.size.width,
        height: _ctrl.value.size.height,
        child: VideoPlayer(_ctrl),
      ),
    );
  }
}
