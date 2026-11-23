import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/theme_tokens.dart';

/// Standard Midnight Aurora screen header with circular back control,
/// dimension-colored title, and supporting subtitle.
class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.titleColor = AppColors.textPrimary,
    this.showBack = true,
    this.onBack,
    this.trailing,
  });

  final String title;
  final String? subtitle;
  final Color titleColor;
  final bool showBack;
  final VoidCallback? onBack;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showBack || trailing != null) ...[
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (showBack)
                Semantics(
                  button: true,
                  label: 'Back',
                  child: InkWell(
                    onTap:
                        onBack ??
                        () {
                          if (context.canPop()) {
                            context.pop();
                          }
                        },
                    borderRadius: BorderRadius.circular(AppRadii.pill),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.surfaceCard,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.border),
                      ),
                      child: const Icon(
                        LucideIcons.chevronLeft,
                        color: AppColors.textPrimary,
                        size: 20,
                      ),
                    ),
                  ),
                )
              else
                const SizedBox(height: 44),
              ?trailing,
            ],
          ),
          const SizedBox(height: AppSpacing.md),
        ] else
          const SizedBox(height: AppSpacing.lg),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge
              ?.copyWith(color: titleColor, height: 1.15),
        ),
        if (subtitle != null && subtitle!.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(subtitle!, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ],
    );
  }
}
