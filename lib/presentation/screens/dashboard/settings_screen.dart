import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/route_names.dart';
import '../../../app/theme_tokens.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/confirm_dialog.dart';
import '../../widgets/secondary_button.dart';

/// Screen 08 — Settings / Profile (plus Screens 09 Reset & 10 Sign Out dialogs,
/// avatar picker, name editor, Reduced Motion toggle, and Explore UI states).
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const List<IconData> _avatarIcons = [
    LucideIcons.user,
    LucideIcons.sparkles,
    LucideIcons.bookOpen,
    LucideIcons.dumbbell,
    LucideIcons.moon,
    LucideIcons.brain,
  ];

  Future<void> _editAvatar(BuildContext context) async {
    final auth = AppStateScope.of(context).auth;
    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: AppColors.surfaceElevated,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.xl),
            side: const BorderSide(color: AppColors.border),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose Profile Icon',
                  style: Theme.of(dialogContext).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: List.generate(_avatarIcons.length, (i) {
                    final selected = auth.currentUser.avatarIndex == i;
                    return InkWell(
                      onTap: () {
                        auth.updateProfile(avatarIndex: i);
                        Navigator.of(dialogContext).pop();
                      },
                      borderRadius: BorderRadius.circular(AppRadii.pill),
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selected
                              ? AppColors.brandViolet.withValues(alpha: 0.28)
                              : AppColors.surfaceCard,
                          border: Border.all(
                            color: selected
                                ? AppColors.brandViolet
                                : AppColors.border,
                            width: 1.5,
                          ),
                        ),
                        child: Icon(
                          _avatarIcons[i],
                          color: selected
                              ? AppColors.textPrimary
                              : AppColors.textSecondary,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _editName(BuildContext context) async {
    final auth = AppStateScope.of(context).auth;
    final controller = TextEditingController(text: auth.currentUser.fullName);
    final updated = await showDialog<String>(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: AppColors.surfaceElevated,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.xl),
            side: const BorderSide(color: AppColors.border),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit Name',
                  style: Theme.of(dialogContext).textTheme.titleLarge,
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: controller,
                  autofocus: true,
                  decoration: const InputDecoration(hintText: 'Your full name'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: () =>
                          Navigator.of(dialogContext).pop(controller.text),
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    controller.dispose();
    if (updated != null && updated.trim().isNotEmpty) {
      auth.updateProfile(fullName: updated);
    }
  }

  Future<void> _confirmReset(BuildContext context) async {
    final confirmed = await showAppConfirmDialog(
      context: context,
      title: 'Reset all progress?',
      message: 'Your scores, streaks and trophies will be cleared.',
      confirmLabel: 'Reset',
    );
    if (!confirmed || !context.mounted) return;
    AppStateScope.of(context).resetAllProgress();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All progress has been reset.')),
    );
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final confirmed = await showAppConfirmDialog(
      context: context,
      title: 'Sign out?',
      message: 'You will need to log in again.',
      confirmLabel: 'Sign Out',
    );
    if (!confirmed || !context.mounted) return;
    AppStateScope.of(context).auth.signOut();
    context.go(RouteNames.welcome);
  }

  void _exploreUiStates(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surfaceElevated,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadii.xl)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'UI States Reference',
                style: Theme.of(sheetContext).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              _StateBadgeRow(
                icon: LucideIcons.circleCheck,
                color: AppColors.success,
                label: 'Success state — Saved / Completed feedback',
              ),
              const SizedBox(height: 10),
              _StateBadgeRow(
                icon: LucideIcons.circleAlert,
                color: AppColors.danger,
                label: 'Error state — Inline form validation & destructive dialogs',
              ),
              const SizedBox(height: 10),
              _StateBadgeRow(
                icon: LucideIcons.clock,
                color: AppColors.academics,
                label: 'Loading / Active state — Timers & button spinners',
              ),
              const SizedBox(height: 10),
              _StateBadgeRow(
                icon: LucideIcons.layers,
                color: AppColors.textSecondary,
                label: 'Empty state — Shown after Reset All Progress or deleting items',
              ),
              const SizedBox(height: 18),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = AppStateScope.of(context).auth;

    return AuroraScaffold(
      auroraColor: AppColors.brandViolet,
      bottomNavigationBar: const AppBottomNav(currentIndex: 3),
      body: ListenableBuilder(
        listenable: auth,
        builder: (context, _) {
          final user = auth.currentUser;
          final avatarIcon =
              _avatarIcons[user.avatarIndex % _avatarIcons.length];

          return SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 28),
                Center(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () => _editAvatar(context),
                        borderRadius: BorderRadius.circular(AppRadii.pill),
                        child: Container(
                          width: 92,
                          height: 92,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.brandViolet.withValues(alpha: 0.2),
                            border: Border.all(
                              color: AppColors.brandViolet,
                              width: 1.8,
                            ),
                          ),
                          child: Icon(
                            avatarIcon,
                            size: 36,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: () => _editAvatar(context),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.brandViolet,
                        ),
                        child: const Text('Edit Profile Picture'),
                      ),
                      Text(
                        user.fullName,
                        style: Theme.of(context).textTheme.titleLarge
                            ?.copyWith(fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () => _editName(context),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.brandViolet,
                        ),
                        child: const Text('Edit Name'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                SecondaryButton(
                  label: 'Reset All Progress',
                  borderColor: AppColors.danger,
                  foregroundColor: AppColors.danger,
                  onPressed: () => _confirmReset(context),
                ),
                const SizedBox(height: 12),
                SecondaryButton(
                  label: 'Sign Out',
                  onPressed: () => _confirmSignOut(context),
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceCard,
                    borderRadius: BorderRadius.circular(AppRadii.md),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Reduced motion',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Switch.adaptive(
                        value: auth.reducedMotion,
                        activeThumbColor: AppColors.brandViolet,
                        activeTrackColor: AppColors.brandViolet.withValues(
                          alpha: 0.4,
                        ),
                        onChanged: auth.setReducedMotion,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SecondaryButton(
                  label: 'Explore UI states',
                  onPressed: () => _exploreUiStates(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StateBadgeRow extends StatelessWidget {
  const _StateBadgeRow({
    required this.icon,
    required this.color,
    required this.label,
  });

  final IconData icon;
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium
                ?.copyWith(color: AppColors.textPrimary),
          ),
        ),
      ],
    );
  }
}
