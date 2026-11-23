import 'package:flutter/material.dart';

import '../../app/theme_tokens.dart';
import '../../core/constants/app_constants.dart';

/// Shared Midnight Aurora screen wrapper with restrained top aurora radial glow,
/// SafeArea, optional persistent bottom navigation, and responsive max-width
/// centering for desktop/tablet viewports.
class AuroraScaffold extends StatelessWidget {
  const AuroraScaffold({
    super.key,
    required this.body,
    this.auroraColor = AppColors.brandViolet,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
  });

  final Widget body;
  final Color auroraColor;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: Stack(
        children: [
          Positioned(
            top: -120,
            left: -60,
            right: -60,
            height: 320,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(0, -0.35),
                    radius: 0.85,
                    colors: [
                      auroraColor.withValues(alpha: 0.22),
                      auroraColor.withValues(alpha: 0.06),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: AppConstants.maxPhoneLayoutWidth,
                ),
                child: Padding(padding: padding, child: body),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
