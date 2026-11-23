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

/// Screen 27 — Sleep Tracker with bedtime & wake-up time pickers and midnight-crossing duration.
class SleepTrackerScreen extends StatefulWidget {
  const SleepTrackerScreen({super.key});

  @override
  State<SleepTrackerScreen> createState() => _SleepTrackerScreenState();
}

class _SleepTrackerScreenState extends State<SleepTrackerScreen> {
  TimeOfDay _bedtime = const TimeOfDay(hour: 23, minute: 0);
  TimeOfDay _wakeTime = const TimeOfDay(hour: 6, minute: 30);

  Future<void> _pickBedtime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _bedtime,
    );
    if (picked != null) setState(() => _bedtime = picked);
  }

  Future<void> _pickWakeTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _wakeTime,
    );
    if (picked != null) setState(() => _wakeTime = picked);
  }

  void _save() {
    final record = AppStateScope.of(context).sleep
        .logSleep(bedtime: _bedtime, wakeTime: _wakeTime);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sleep logged: ${record.formattedDuration}.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final duration = DateTimeUtils.calculateSleepDuration(_bedtime, _wakeTime);

    return AuroraScaffold(
      auroraColor: AppColors.sleep,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(
              title: 'Sleep Tracker',
              subtitle: 'Log last night\'s rest',
              titleColor: AppColors.sleep,
            ),
            const SizedBox(height: 28),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 108,
                    height: 108,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.sleep.withValues(alpha: 0.25),
                          blurRadius: 36,
                        ),
                      ],
                    ),
                    child: const Icon(
                      LucideIcons.moon,
                      size: 84,
                      color: AppColors.sleep,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Duration: ${DateTimeUtils.formatHoursMinutes(duration)}',
                    style: Theme.of(context).textTheme.titleMedium
                        ?.copyWith(color: AppColors.sleep),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Adult (18–60) guidance: ≥7 h/night · duration only, not sleep quality',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            _TimePickerTile(
              label: 'Bedtime',
              value: DateTimeUtils.formatTimeOfDay(_bedtime),
              onTap: _pickBedtime,
            ),
            const SizedBox(height: 16),
            _TimePickerTile(
              label: 'Wake-up time',
              value: DateTimeUtils.formatTimeOfDay(_wakeTime),
              onTap: _pickWakeTime,
            ),
            const SizedBox(height: 28),
            PrimaryButton(
              label: 'Save',
              backgroundColor: AppColors.sleep,
              onPressed: _save,
            ),
            const SizedBox(height: 12),
            SecondaryButton(
              label: 'View Sleep History',
              onPressed: () => context.push(RouteNames.sleepHistory),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimePickerTile extends StatelessWidget {
  const _TimePickerTile({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadii.md),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            decoration: BoxDecoration(
              color: AppColors.surfaceCard,
              borderRadius: BorderRadius.circular(AppRadii.md),
              border: Border.all(
                color: AppColors.sleep.withValues(alpha: 0.65),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
                const Icon(LucideIcons.clock, color: AppColors.sleep, size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
