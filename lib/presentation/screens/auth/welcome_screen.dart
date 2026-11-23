import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/route_names.dart';
import '../../../app/theme_tokens.dart';
import '../../../core/constants/app_constants.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/quadrilibrium_logo.dart';
import '../../widgets/secondary_button.dart';

/// Screen 01 — Welcome.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuroraScaffold(
      auroraColor: AppColors.brandViolet,
      body: Column(
        children: [
          const Spacer(flex: 3),
          const QuadrilibriumLogo(size: 76, strokeWidth: 9),
          const SizedBox(height: 24),
          Text(
            AppConstants.appName,
            style: Theme.of(context).textTheme.headlineLarge
                ?.copyWith(fontSize: 32, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            AppConstants.tagline,
            style: Theme.of(context).textTheme.bodyMedium
                ?.copyWith(fontSize: 15, color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 4),
          PrimaryButton(
            label: 'Log In',
            onPressed: () => context.push(RouteNames.login),
          ),
          const SizedBox(height: 12),
          SecondaryButton(
            label: 'Create Account',
            onPressed: () => context.push(RouteNames.register),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
