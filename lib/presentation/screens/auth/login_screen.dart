import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/route_names.dart';
import '../../../app/theme_tokens.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/input_validators.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/password_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/quadrilibrium_logo.dart';

/// Screen 02 — Login with validation, password visibility toggle, and error state.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'you@university.edu');
  final _passwordController = TextEditingController(text: 'password123');
  bool _autoValidate = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _autoValidate = true);
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final auth = AppStateScope.of(context).auth;
    final ok = await auth.login(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (!mounted) return;
    if (ok) {
      context.go(RouteNames.home);
    }
  }

  void _previewValidationError() {
    setState(() {
      _autoValidate = true;
      _emailController.text = 'invalid-email';
      _passwordController.text = '123';
    });
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    final auth = AppStateScope.of(context).auth;

    return AuroraScaffold(
      auroraColor: AppColors.brandViolet,
      body: ListenableBuilder(
        listenable: auth,
        builder: (context, _) {
          return SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 24),
            child: Form(
              key: _formKey,
              autovalidateMode: _autoValidate
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () => context.canPop()
                        ? context.pop()
                        : context.go(RouteNames.welcome),
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
                  const SizedBox(height: 16),
                  const Center(
                    child: Column(
                      children: [
                        QuadrilibriumLogo(size: 62, strokeWidth: 7.5),
                        SizedBox(height: 14),
                        Text(
                          AppConstants.appName,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          AppConstants.tagline,
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Welcome back',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 20),
                  if (auth.errorMessage != null) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.danger.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(AppRadii.sm),
                        border: Border.all(color: AppColors.danger),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            LucideIcons.circleAlert,
                            color: AppColors.danger,
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              auth.errorMessage!,
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                  AppTextField(
                    label: 'Email Address',
                    controller: _emailController,
                    hintText: 'you@university.edu',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: InputValidators.email,
                  ),
                  const SizedBox(height: 16),
                  PasswordField(
                    label: 'Password',
                    controller: _passwordController,
                    hintText: 'Enter your password',
                    textInputAction: TextInputAction.done,
                    validator: InputValidators.password,
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    label: 'Log In',
                    isLoading: auth.isLoading,
                    onPressed: _submit,
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      auth.clearError();
                      context.pushReplacement(RouteNames.register);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: AppColors.brandViolet,
                    ),
                    child: const Text('New here? Create an account'),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppConstants.localAuthNotice,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: _previewValidationError,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: AppColors.textSecondary,
                    ),
                    child: const Text(
                      'Explore form states',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
