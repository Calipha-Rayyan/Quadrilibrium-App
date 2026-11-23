import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/route_names.dart';
import '../../../app/theme_tokens.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/empty_state.dart';
import '../../widgets/primary_button.dart';

/// Screen 32 — Thought Reframer saved cards list.
class ThoughtReframerScreen extends StatelessWidget {
  const ThoughtReframerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mental = AppStateScope.of(context).mentalWellbeing;

    return AuroraScaffold(
      auroraColor: AppColors.mentalWellbeing,
      body: ListenableBuilder(
        listenable: mental,
        builder: (context, _) {
          final cards = mental.thoughtCards;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(
                title: 'Thought Reframer',
                subtitle: cards.isEmpty
                    ? 'Your saved reflections'
                    : 'Your saved reflections · ${cards.length} saved',
                titleColor: AppColors.mentalWellbeing,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: cards.isEmpty
                    ? const Center(
                        child: EmptyState(
                          icon: LucideIcons.notebookPen,
                          title: 'No thought cards yet',
                          message: 'Capture a stressful thought, spot the thinking trap, and write a balanced counter-statement.',
                          accentColor: AppColors.mentalWellbeing,
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.only(bottom: 16),
                        itemCount: cards.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final card = cards[index];
                          return AppCard(
                            title: card.stressfulThought,
                            subtitle: 'Thinking trap: ${card.thinkingTrap}',
                            icon: LucideIcons.notebookPen,
                            accentColor: AppColors.mentalWellbeing,
                            onTap: () => context.push(
                              RouteNames.viewThoughtPath(card.id),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: 'Add Thought Card',
                backgroundColor: AppColors.mentalWellbeing,
                onPressed: () => context.push(RouteNames.newThought),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
