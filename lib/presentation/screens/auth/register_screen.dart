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

/// Screen 03 — Register with full name, email, password, confirm password validation.
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _autoValidate = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _autoValidate = true);
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final auth = AppStateScope.of(context).auth;
    final ok = await auth.register(
      fullName: _nameController.text,
      email: _emailController.text,
    );
    if (!mounted) return;
    if (ok) {
      context.go(RouteNames.registerSuccess);
    }
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
                  const SizedBox(height: 12),
                  const Center(
                    child: Column(
                      children: [
                        QuadrilibriumLogo(size: 56, strokeWidth: 7),
                        SizedBox(height: 10),
                        Text(
                          AppConstants.appName,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          AppConstants.tagline,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Create your account',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    label: 'Full Name',
                    controller: _nameController,
                    hintText: 'Alex Morgan',
                    textInputAction: TextInputAction.next,
                    validator: (v) =>
                        InputValidators.requiredField(v, label: 'Full name'),
                  ),
                  const SizedBox(height: 14),
                  AppTextField(
                    label: 'Email Address',
                    controller: _emailController,
                    hintText: 'you@university.edu',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: InputValidators.email,
                  ),
                  const SizedBox(height: 14),
                  PasswordField(
                    label: 'Password',
                    controller: _passwordController,
                    hintText: 'At least 8 characters',
                    textInputAction: TextInputAction.next,
                    validator: InputValidators.password,
                  ),
                  const SizedBox(height: 14),
                  PasswordField(
                    label: 'Confirm Password',
                    controller: _confirmController,
                    hintText: 'Re-enter password',
                    textInputAction: TextInputAction.done,
                    validator: (v) => InputValidators.confirmPassword(
                      v,
                      _passwordController.text,
                    ),
                  ),
                  const SizedBox(height: 22),
                  PrimaryButton(
                    label: 'Create Account',
                    isLoading: auth.isLoading,
                    onPressed: _submit,
                  ),
                  const SizedBox(height: 14),
                  TextButton(
                    onPressed: () => context.pushReplacement(RouteNames.login),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: AppColors.brandViolet,
                    ),
                    child: const Text('Already have an account? Log In'),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    AppConstants.localAuthNotice,
                    style: Theme.of(context).textTheme.bodySmall,
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
