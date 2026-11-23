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

/// Screen 19 — Subject Flashcards with interactive flip card and card list.
class SubjectFlashcardsScreen extends StatefulWidget {
  const SubjectFlashcardsScreen({super.key, required this.subjectId});

  final String subjectId;

  @override
  State<SubjectFlashcardsScreen> createState() =>
      _SubjectFlashcardsScreenState();
}

class _SubjectFlashcardsScreenState extends State<SubjectFlashcardsScreen> {
  int _activeIndex = 0;
  bool _showBack = false;

  @override
  Widget build(BuildContext context) {
    final state = AppStateScope.of(context);
    final academics = state.academics;
    final reducedMotion = state.auth.reducedMotion;

    return AuroraScaffold(
      auroraColor: AppColors.academics,
      body: ListenableBuilder(
        listenable: academics,
        builder: (context, _) {
          final subject = academics.subjectById(widget.subjectId);
          final cards = academics.flashcardsForSubject(widget.subjectId);
          final safeIndex = cards.isEmpty
              ? 0
              : _activeIndex.clamp(0, cards.length - 1);
          final activeCard = cards.isEmpty ? null : cards[safeIndex];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(
                title: subject?.name ?? 'Flashcards',
                subtitle:
                    '${cards.length} ${cards.length == 1 ? 'card' : 'cards'} · tap a card to flip',
                titleColor: AppColors.academics,
              ),
              const SizedBox(height: 18),
              if (activeCard == null)
                const Expanded(
                  child: Center(
                    child: EmptyState(
                      icon: LucideIcons.layers,
                      title: 'No flashcards yet',
                      message: 'Add your first term and description card to start studying this subject.',
                      accentColor: AppColors.academics,
                    ),
                  ),
                )
              else ...[
                GestureDetector(
                  onTap: () => setState(() => _showBack = !_showBack),
                  child: AnimatedContainer(
                    duration: AppDurations.resolve(
                      AppDurations.flip,
                      reducedMotion: reducedMotion,
                    ),
                    width: double.infinity,
                    constraints: const BoxConstraints(minHeight: 156),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: _showBack
                          ? AppColors.surfaceElevated
                          : AppColors.surfaceCard,
                      borderRadius: BorderRadius.circular(AppRadii.xl),
                      border: Border.all(
                        color: AppColors.academics.withValues(alpha: 0.7),
                        width: 1.2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _showBack ? 'DESCRIPTION' : 'TERM',
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(letterSpacing: 1.2),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _showBack ? activeCard.description : activeCard.term,
                          style: _showBack
                              ? Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(height: 1.45)
                              : Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _showBack ? 'Tap to show term' : 'Tap to flip',
                          style: const TextStyle(
                            color: AppColors.academics,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 12),
                    itemCount: cards.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final card = cards[index];
                      final isSelected = index == safeIndex;
                      return AppCard(
                        title: card.term,
                        subtitle: 'Tap to view description',
                        icon: LucideIcons.layers,
                        accentColor: AppColors.academics,
                        borderColor: isSelected
                            ? AppColors.academics.withValues(alpha: 0.7)
                            : AppColors.border,
                        onTap: () {
                          setState(() {
                            _activeIndex = index;
                            _showBack = true;
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
              const SizedBox(height: 12),
              PrimaryButton(
                label: 'Add Card',
                backgroundColor: AppColors.academics,
                onPressed: () =>
                    context.push(RouteNames.newFlashcardPath(widget.subjectId)),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
