import 'package:flutter/material.dart';

/// Midnight Aurora — Balance in the Dark design tokens.
/// Matches `project-docs/DESIGN.md` and the latest 6 PNG screen exports.
abstract final class AppColors {
  static const Color background = Color(0xFF090B16);
  static const Color surface = Color(0xFF111629);
  static const Color surfaceCard = Color(0xFF171B30);
  static const Color surfaceElevated = Color(0xFF20253D);

  static const Color brandViolet = Color(0xFF8265F5);
  static const Color academics = Color(0xFF64A5FF);
  static const Color physicalFitness = Color(0xFFFF8B83);
  static const Color mentalWellbeing = Color(0xFFB18AFF);
  static const Color sleep = Color(0xFF63D5D0);

  static const Color achievementGold = Color(0xFFF5C76B);
  static const Color success = Color(0xFF5BE0B2);
  static const Color danger = Color(0xFFFF6B7A);

  static const Color textPrimary = Color(0xFFF4F0FF);
  static const Color textSecondary = Color(0xFFA9A5C5);
  static const Color border = Color(0xFF303651);
}

abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

abstract final class AppRadii {
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 20;
  static const double xl = 24;
  static const double pill = 999;
}

abstract final class AppDurations {
  static const Duration fast = Duration(milliseconds: 140);
  static const Duration standard = Duration(milliseconds: 240);
  static const Duration reveal = Duration(milliseconds: 520);
  static const Duration flip = Duration(milliseconds: 380);

  static Duration resolve(Duration normal, {required bool reducedMotion}) {
    return reducedMotion ? Duration.zero : normal;
  }
}
