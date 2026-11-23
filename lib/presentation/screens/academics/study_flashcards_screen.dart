import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/route_names.dart';
import '../../../app/theme_tokens.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/empty_state.dart';
import '../../widgets/primary_button.dart';

/// Screen 17 — Study Flashcards subject selection grid.
class StudyFlashcardsScreen extends StatelessWidget {
  const StudyFlashcardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final academics = AppStateScope.of(context).academics;

    return AuroraScaffold(
      auroraColor: AppColors.academics,
      body: ListenableBuilder(
        listenable: academics,
        builder: (context, _) {
          final subjects = academics.subjects;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppHeader(
                title: 'Study Flashcards',
                subtitle: 'Choose a subject',
                titleColor: AppColors.academics,
              ),
              const SizedBox(height: 22),
              Expanded(
                child: subjects.isEmpty
                    ? const Center(
                        child: EmptyState(
                          icon: LucideIcons.layers,
                          title: 'No subjects yet',
                          message: 'Create a subject deck to organize your study flashcards.',
                          accentColor: AppColors.academics,
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.only(bottom: 16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 1.15,
                            ),
                        itemCount: subjects.length,
                        itemBuilder: (context, index) {
                          final subject = subjects[index];
                          final count = academics.flashcardCountForSubject(
                            subject.id,
                          );
                          return Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () => context.push(
                                RouteNames.subjectFlashcardsPath(subject.id),
                              ),
                              borderRadius: BorderRadius.circular(AppRadii.lg),
                              child: Ink(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceCard,
                                  borderRadius: BorderRadius.circular(
                                    AppRadii.lg,
                                  ),
                                  border: Border.all(color: AppColors.border),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: AppColors.academics.withValues(
                                          alpha: 0.14,
                                        ),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.academics.withValues(
                                            alpha: 0.55,
                                          ),
                                        ),
                                      ),
                                      child: const Icon(
                                        LucideIcons.layers,
                                        size: 18,
                                        color: AppColors.academics,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          subject.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          '$count ${count == 1 ? 'card' : 'cards'}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 12),
              PrimaryButton(
                label: 'Add Subject',
                backgroundColor: AppColors.academics,
                onPressed: () => context.push(RouteNames.addSubject),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
