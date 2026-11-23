import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/route_names.dart';
import '../../../app/theme_tokens.dart';
import '../../view_models/app_state.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/primary_button.dart';

/// Screen 04 — Account created confirmation state.
class RegisterSuccessScreen extends StatelessWidget {
  const RegisterSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AppStateScope.of(context).auth.currentUser;

    return AuroraScaffold(
      auroraColor: AppColors.success,
      body: Column(
        children: [
          const Spacer(flex: 3),
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.success.withValues(alpha: 0.14),
              border: Border.all(color: AppColors.success, width: 2.5),
              boxShadow: [
                BoxShadow(
                  color: AppColors.success.withValues(alpha: 0.25),
                  blurRadius: 24,
                ),
              ],
            ),
            child: const Icon(
              LucideIcons.check,
              size: 36,
              color: AppColors.success,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Account created',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Welcome to Quadrilibrium, ${user.firstName}.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 4),
          PrimaryButton(
            label: 'Go to Home',
            onPressed: () => context.go(RouteNames.home),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
