import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/route_names.dart';
import '../../app/theme_tokens.dart';

/// Persistent 4-tab bottom navigation: Home, Progress, Trophies, Settings.
/// Preserves original tab labels ("Progress" opens the Analytics screen).
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key, required this.currentIndex});

  final int currentIndex;

  static const _tabs = [
    (label: 'Home', icon: LucideIcons.house, route: RouteNames.home),
    (
      label: 'Progress',
      icon: LucideIcons.barChart2,
      route: RouteNames.analytics,
    ),
    (label: 'Trophies', icon: LucideIcons.trophy, route: RouteNames.trophies),
    (label: 'Settings', icon: LucideIcons.settings, route: RouteNames.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 68,
          child: Row(
            children: List.generate(_tabs.length, (index) {
              final tab = _tabs[index];
              final isSelected = index == currentIndex;
              final color = isSelected
                  ? AppColors.brandViolet
                  : AppColors.textSecondary;

              return Expanded(
                child: Semantics(
                  button: true,
                  selected: isSelected,
                  label: tab.label,
                  child: InkWell(
                    onTap: () {
                      if (!isSelected) {
                        context.go(tab.route);
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(tab.icon, size: 22, color: color),
                        const SizedBox(height: 4),
                        Text(
                          tab.label,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
