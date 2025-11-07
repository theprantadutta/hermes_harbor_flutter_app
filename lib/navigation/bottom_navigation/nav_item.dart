import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/design_tokens.dart';

class NavItem extends StatefulWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final kPrimaryColor = Theme.of(context).primaryColor;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: AppDuration.fast,
        curve: AppCurves.easeOut,
        child: AnimatedContainer(
          duration: AppDuration.normal,
          curve: AppCurves.luxury,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            borderRadius: AppRadius.lgRadius,
            gradient: widget.isActive
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      kPrimaryColor.withOpacity(0.15),
                      kPrimaryColor.withOpacity(0.08),
                    ],
                  )
                : null,
            color: widget.isActive ? null : Colors.transparent,
            boxShadow: widget.isActive
                ? [
                    BoxShadow(
                      color: kPrimaryColor.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                scale: widget.isActive ? 1.1 : 1.0,
                duration: AppDuration.normal,
                curve: AppCurves.spring,
                child: Icon(
                  widget.isActive ? widget.selectedIcon : widget.icon,
                  size: AppIconSize.md,
                  color: widget.isActive
                      ? kPrimaryColor
                      : (isDarkTheme ? Colors.grey[400] : Colors.grey[600]),
                ),
              ),
              SizedBox(height: AppSpacing.xxs),
              Text(
                widget.label,
                style: GoogleFonts.raleway(
                  fontSize: AppTextSize.sm,
                  fontWeight: widget.isActive ? FontWeight.w800 : FontWeight.w600,
                  color: widget.isActive
                      ? kPrimaryColor
                      : (isDarkTheme ? Colors.grey[400] : Colors.grey[600]),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
