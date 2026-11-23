import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/theme_tokens.dart';

/// Shared Reset / Play-Pause / Stop timer controls for Pomodoro and Meditation.
class TimerControls extends StatelessWidget {
  const TimerControls({
    super.key,
    required this.isRunning,
    required this.accentColor,
    required this.onTogglePlayPause,
    required this.onReset,
    this.onStop,
  });

  final bool isRunning;
  final Color accentColor;
  final VoidCallback onTogglePlayPause;
  final VoidCallback onReset;
  final VoidCallback? onStop;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _CircleIconControl(
          tooltip: 'Reset timer',
          icon: LucideIcons.rotateCcw,
          size: 52,
          backgroundColor: AppColors.surfaceElevated,
          iconColor: AppColors.textPrimary,
          onPressed: onReset,
        ),
        const SizedBox(width: 24),
        _CircleIconControl(
          tooltip: isRunning ? 'Pause timer' : 'Start timer',
          icon: isRunning ? LucideIcons.pause : LucideIcons.play,
          size: 68,
          backgroundColor: accentColor,
          iconColor: AppColors.background,
          glow: true,
          onPressed: onTogglePlayPause,
        ),
        if (onStop != null) ...[
          const SizedBox(width: 24),
          _CircleIconControl(
            tooltip: 'Stop session',
            icon: LucideIcons.square,
            size: 52,
            backgroundColor: AppColors.surfaceElevated,
            iconColor: AppColors.textPrimary,
            onPressed: onStop!,
          ),
        ],
      ],
    );
  }
}

class _CircleIconControl extends StatelessWidget {
  const _CircleIconControl({
    required this.tooltip,
    required this.icon,
    required this.size,
    required this.backgroundColor,
    required this.iconColor,
    required this.onPressed,
    this.glow = false,
  });

  final String tooltip;
  final IconData icon;
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onPressed;
  final bool glow;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: tooltip,
      child: Tooltip(
        message: tooltip,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(AppRadii.pill),
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              border: glow ? null : Border.all(color: AppColors.border),
              boxShadow: glow
                  ? [
                      BoxShadow(
                        color: backgroundColor.withValues(alpha: 0.35),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : const [],
            ),
            child: Icon(icon, color: iconColor, size: size * 0.4),
          ),
        ),
      ),
    );
  }
}
