import 'package:flutter/material.dart';

import '../../constants/design_tokens.dart';

class QuantityButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const QuantityButton({super.key, required this.icon, required this.onTap});

  @override
  State<QuantityButton> createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppDuration.fast,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.85).animate(
      CurvedAnimation(
        parent: _controller,
        curve: AppCurves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onTap();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDarkTheme
                  ? [
                      Colors.grey[800]!,
                      Colors.grey[850]!,
                    ]
                  : [
                      Colors.grey[100]!,
                      Colors.grey[200]!,
                    ],
            ),
            borderRadius: AppRadius.smRadius,
            border: Border.all(
              color: kPrimaryColor.withValues(alpha: 0.15),
              width: 1,
            ),
            boxShadow: AppElevation.subtle(Colors.black),
          ),
          child: Icon(
            widget.icon,
            size: AppIconSize.sm,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
