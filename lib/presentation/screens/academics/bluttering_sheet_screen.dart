import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/route_names.dart';
import '../../../app/theme_tokens.dart';
import '../../../core/utils/date_time_utils.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/secondary_button.dart';

/// Screen 15 — Bluttering Sheet (timed recall writing editor).
/// Editable while timer is active; automatically locks to read-only on expiry.
class BlutteringSheetScreen extends StatefulWidget {
  const BlutteringSheetScreen({
    super.key,
    this.initialDurationSeconds = 10 * 60,
  });

  final int initialDurationSeconds;

  @override
  State<BlutteringSheetScreen> createState() => _BlutteringSheetScreenState();
}

class _BlutteringSheetScreenState extends State<BlutteringSheetScreen> {
  final _titleController = TextEditingController(text: 'DSA recall — Trees');
  final _writingController = TextEditingController();

  late int _remainingSeconds;
  bool _isRunning = false;
  bool _isExpired = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.initialDurationSeconds;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _titleController.dispose();
    _writingController.dispose();
    super.dispose();
  }

  void _startTimerIfNeeded() {
    if (_isRunning || _isExpired) return;
    setState(() => _isRunning = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_remainingSeconds <= 1) {
        timer.cancel();
        setState(() {
          _remainingSeconds = 0;
          _isRunning = false;
          _isExpired = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Time expired — sheet is now read-only. Save your notes!',
            ),
          ),
        );
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  void _toggleTimer() {
    if (_isExpired) return;
    if (_isRunning) {
      _timer?.cancel();
      setState(() => _isRunning = false);
    } else {
      _startTimerIfNeeded();
    }
  }

  void _saveSheet() {
    final title = _titleController.text.trim();
    final content = _writingController.text.trim();
    if (title.isEmpty || content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both a title and your recall notes.'),
        ),
      );
      return;
    }

    _timer?.cancel();
    final elapsedMins =
        ((widget.initialDurationSeconds - _remainingSeconds) / 60).ceil().clamp(
          1,
          60,
        );

    AppStateScope.of(context).academics.saveStudySheet(
      title: title,
      content: content,
      durationMinutes: elapsedMins,
      wasExpired: _isExpired,
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Bluttering sheet saved.')));
    setState(() {
      _writingController.clear();
      _remainingSeconds = widget.initialDurationSeconds;
      _isRunning = false;
      _isExpired = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuroraScaffold(
      auroraColor: AppColors.academics,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppHeader(
            title: 'Bluttering Sheet',
            subtitle: 'Write everything you recall',
            titleColor: AppColors.academics,
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.surfaceCard,
              borderRadius: BorderRadius.circular(AppRadii.md),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TITLE',
                        style: Theme.of(context).textTheme.labelSmall
                            ?.copyWith(fontSize: 10),
                      ),
                      TextField(
                        controller: _titleController,
                        readOnly: _isExpired,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: const InputDecoration(
                          isDense: true,
                          filled: false,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 4),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: _toggleTimer,
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color:
                          (_isExpired ? AppColors.danger : AppColors.academics)
                              .withValues(alpha: 0.16),
                      borderRadius: BorderRadius.circular(AppRadii.pill),
                      border: Border.all(
                        color: _isExpired
                            ? AppColors.danger
                            : AppColors.academics,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _isExpired ? LucideIcons.lock : LucideIcons.timer,
                          size: 15,
                          color: _isExpired
                              ? AppColors.danger
                              : AppColors.academics,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          DateTimeUtils.formatTimerSeconds(_remainingSeconds),
                          style: TextStyle(
                            color: _isExpired
                                ? AppColors.danger
                                : AppColors.academics,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            fontFeatures: const [FontFeature.tabularFigures()],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Text(
                'Writing area',
                style: Theme.of(context).textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  _isExpired
                      ? 'Read-only (timer expired)'
                      : (_isRunning
                            ? 'Timer running'
                            : 'Tap timer or type to start'),
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11.5,
                    color: _isExpired
                        ? AppColors.danger
                        : AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TextField(
              controller: _writingController,
              readOnly: _isExpired,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              onChanged: (_) => _startTimerIfNeeded(),
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14.5,
                height: 1.5,
              ),
              decoration: const InputDecoration(
                hintText: 'Start writing everything you remember about binary trees, traversals and balancing...',
                alignLabelWithHint: true,
              ),
            ),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            label: 'Save',
            backgroundColor: AppColors.academics,
            onPressed: _saveSheet,
          ),
          const SizedBox(height: 10),
          SecondaryButton(
            label: 'View Saved Sheets',
            onPressed: () => context.push(RouteNames.savedSheets),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
