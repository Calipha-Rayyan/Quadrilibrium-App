import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../app/theme_tokens.dart';

/// Four-segment Quadrilibrium ring logo in the four dimension accents:
/// Academics (blue), Physical Fitness (coral), Mental Wellbeing (violet), Sleep (teal).
class QuadrilibriumLogo extends StatelessWidget {
  const QuadrilibriumLogo({super.key, this.size = 64, this.strokeWidth = 8});

  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Quadrilibrium logo',
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: _QuadrilibriumRingPainter(strokeWidth: strokeWidth),
        ),
      ),
    );
  }
}

class _QuadrilibriumRingPainter extends CustomPainter {
  const _QuadrilibriumRingPainter({required this.strokeWidth});

  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final inset = strokeWidth / 2 + 2;
    final arcRect = rect.deflate(inset);

    const gap = 0.24; // radians gap between quadrants
    const sweep = (math.pi / 2) - gap;

    final segments = <(double, Color)>[
      (-math.pi / 2 + gap / 2, AppColors.academics), // top-right
      (0 + gap / 2, AppColors.physicalFitness), // bottom-right
      (math.pi / 2 + gap / 2, AppColors.mentalWellbeing), // bottom-left
      (math.pi + gap / 2, AppColors.sleep), // top-left
    ];

    for (final (start, color) in segments) {
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(arcRect, start, sweep, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _QuadrilibriumRingPainter oldDelegate) =>
      oldDelegate.strokeWidth != strokeWidth;
}
