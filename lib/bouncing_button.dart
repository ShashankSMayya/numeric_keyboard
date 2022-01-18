import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {
  const BouncingButton({Key? key, required this.child, required this.onTap})
      : super(key: key);
  final Widget child;
  final VoidCallback onTap;

  @override
  _BouncingButtonState createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late final AnimationController _controller;
  bool _shouldAnimate = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: -0.05,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1.0 - _controller.value;
    return GestureDetector(
      onTapDown: (details) => _controller.forward(),
      onTapUp: (details) => _controller.reverse(),
      onTap: widget.onTap,
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
