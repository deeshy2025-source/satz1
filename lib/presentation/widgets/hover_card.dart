import 'package:flutter/material.dart';

class HoverCard extends StatefulWidget {
  final Widget child;
  final double scale;
  final Duration duration;

  const HoverCard({
    super.key,
    required this.child,
    this.scale = 1.05,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  void _toggleHover(bool value) {
    if (mounted) {
      setState(() => _isHovered = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _toggleHover(true),
      onExit: (_) => _toggleHover(false),
      child: GestureDetector(
        onTapDown: (_) => _toggleHover(true),   // عند الضغط
        onTapUp: (_) => _toggleHover(false),    // عند الإفلات
        onTapCancel: () => _toggleHover(false), // لو لمسة اتلغت
        child: AnimatedScale(
          scale: _isHovered ? widget.scale : 1.0,
          duration: widget.duration,
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: widget.duration,
            curve: Curves.easeOut,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}