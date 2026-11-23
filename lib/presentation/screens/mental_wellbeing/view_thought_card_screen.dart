import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/theme_tokens.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/confirm_dialog.dart';
import '../../widgets/primary_button.dart';

/// Screen 34 — View Thought Card with delete confirmation.
class ViewThoughtCardScreen extends StatelessWidget {
  const ViewThoughtCardScreen({super.key, required this.thoughtId});

  final String thoughtId;

  Future<void> _confirmDelete(BuildContext context) async {
    final confirmed = await showAppConfirmDialog(
      context: context,
      title: 'Delete thought card?',
      message: 'This reflection card will be removed from your list.',
      confirmLabel: 'Delete',
    );
    if (!confirmed || !context.mounted) return;
    AppStateScope.of(context).mentalWellbeing.deleteThoughtCard(thoughtId);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final mental = AppStateScope.of(context).mentalWellbeing;
    final card = mental.thoughtById(thoughtId);

    return AuroraScaffold(
      auroraColor: AppColors.mentalWellbeing,
      body: card == null
          ? const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppHeader(
                  title: 'Thought Card',
                  subtitle: 'Card not found',
                  titleColor: AppColors.mentalWellbeing,
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppHeader(
                  title: 'Thought Card',
                  subtitle: card.savedDateLabel,
                  titleColor: AppColors.mentalWellbeing,
                ),
                const SizedBox(height: 22),
                _ThoughtSectionCard(
                  label: 'STRESSFUL THOUGHT',
                  value: card.stressfulThought,
                ),
                const SizedBox(height: 12),
                _ThoughtSectionCard(
                  label: 'THINKING TRAP',
                  value: card.thinkingTrap,
                ),
                const SizedBox(height: 12),
                _ThoughtSectionCard(
                  label: 'REALISTIC COUNTER-STATEMENT',
                  value: card.counterStatement,
                ),
                const Spacer(),
                PrimaryButton(
                  label: 'Delete Card',
                  backgroundColor: AppColors.danger,
                  foregroundColor: AppColors.textPrimary,
                  onPressed: () => _confirmDelete(context),
                ),
                const SizedBox(height: 20),
              ],
            ),
    );
  }
}

class _ThoughtSectionCard extends StatelessWidget {
  const _ThoughtSectionCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.mentalWellbeing,
              letterSpacing: 0.9,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge
                ?.copyWith(height: 1.45),
          ),
        ],
      ),
    );
  }
}
