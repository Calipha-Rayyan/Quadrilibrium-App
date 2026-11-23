import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/theme_tokens.dart';
import '../../../data/models/study_sheet_model.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/empty_state.dart';

/// Screen 16 — Saved Bluttering Sheets list with open reader and delete action.
class SavedSheetsScreen extends StatelessWidget {
  const SavedSheetsScreen({super.key});

  void _openSheet(BuildContext context, StudySheetModel sheet) {
    showDialog<void>(
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
                  sheet.title,
                  style: Theme.of(dialogContext).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  '${sheet.savedDateLabel} · ${sheet.durationMinutes} min',
                  style: Theme.of(dialogContext).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 280),
                  child: SingleChildScrollView(
                    child: Text(
                      sheet.content,
                      style: Theme.of(dialogContext).textTheme.bodyLarge
                          ?.copyWith(height: 1.5, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    child: const Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final academics = AppStateScope.of(context).academics;

    return AuroraScaffold(
      auroraColor: AppColors.academics,
      body: ListenableBuilder(
        listenable: academics,
        builder: (context, _) {
          final sheets = academics.sheets;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(
                title: 'Saved Sheets',
                subtitle: 'Your saved recall sheets · ${sheets.length} saved',
                titleColor: AppColors.academics,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: sheets.isEmpty
                    ? const Center(
                        child: EmptyState(
                          icon: LucideIcons.notebookPen,
                          title: 'No saved sheets yet',
                          message: 'Write and save a timed Bluttering Sheet to review your recall notes here.',
                          accentColor: AppColors.academics,
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.only(bottom: 24),
                        itemCount: sheets.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final sheet = sheets[index];
                          return AppCard(
                            title: sheet.title,
                            subtitle:
                                '${sheet.savedDateLabel} · ${sheet.durationMinutes} min',
                            icon: LucideIcons.notebookPen,
                            accentColor: AppColors.academics,
                            showChevron: false,
                            onTap: () => _openSheet(context, sheet),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(
                                  onPressed: () => _openSheet(context, sheet),
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColors.academics,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                  ),
                                  child: const Text('Open'),
                                ),
                                IconButton(
                                  tooltip: 'Delete sheet',
                                  onPressed: () {
                                    academics.deleteStudySheet(sheet.id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Deleted "${sheet.title}"',
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    LucideIcons.trash2,
                                    size: 18,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
