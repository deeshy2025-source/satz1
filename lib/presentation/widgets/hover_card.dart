import 'package:flutter/material.dart';

class HoverCard extends StatefulWidget {
  final Widget child;
  final double scale;
  final Duration duration;
  final bool addShadow;

  const HoverCard({
    super.key,
    required this.child,
    this.scale = 1.05,
    this.duration = const Duration(milliseconds: 200),
    this.addShadow = false, // الافتراضي بدون ظل
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? widget.scale : 1.0,
        duration: widget.duration,
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: widget.duration,
          curve: Curves.easeOut,
          // 👇 هنا بقى مفيش خلفية ولا curve ظاهر
          decoration: widget.addShadow && _isHovered
              ? BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          )
              : const BoxDecoration(),
          // 👇 نلغي أي clipping عشان نحافظ على شكل الchild
          clipBehavior: Clip.none,
          child: widget.child,
        ),
      ),
    );
  }
}