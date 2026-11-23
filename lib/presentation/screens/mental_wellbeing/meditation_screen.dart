import 'dart:async';

import 'package:flutter/material.dart';

import '../../../app/theme_tokens.dart';
import '../../../core/utils/date_time_utils.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/timer_controls.dart';

/// Screen 30 — Meditation timer with glowing concentric rings.
class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key, this.initialDurationSeconds = 30 * 60});

  final int initialDurationSeconds;

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  late int _remainingSeconds;
  bool _isRunning = false;
  bool _isCompleted = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.initialDurationSeconds;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_isRunning) {
      _timer?.cancel();
      setState(() => _isRunning = false);
      return;
    }

    if (_isCompleted) {
      _remainingSeconds = widget.initialDurationSeconds;
      _isCompleted = false;
    }

    setState(() => _isRunning = true);
    _timer?.cancel();
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
          _isCompleted = true;
        });
        final mins = (widget.initialDurationSeconds / 60).round().clamp(1, 120);
        AppStateScope.of(context).mentalWellbeing.recordMeditationSession(mins);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Meditation complete ($mins min).')),
        );
      } else {
        setState(() => _remainingSeconds--);
      }
    });
  }

  void _reset() {
    _timer?.cancel();
    setState(() {
      _remainingSeconds = widget.initialDurationSeconds;
      _isRunning = false;
      _isCompleted = false;
    });
  }

  void _stopAndSave() {
    _timer?.cancel();
    final elapsedSeconds = widget.initialDurationSeconds - _remainingSeconds;
    if (elapsedSeconds >= 60) {
      final mins = (elapsedSeconds / 60).round();
      AppStateScope.of(context).mentalWellbeing.recordMeditationSession(mins);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved $mins min meditation session.')),
      );
    }
    setState(() {
      _isRunning = false;
      _remainingSeconds = widget.initialDurationSeconds;
      _isCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.initialDurationSeconds;
    final elapsedFraction = total == 0
        ? 0.0
        : ((total - _remainingSeconds) / total).clamp(0.0, 1.0);
    final statusLabel = _isCompleted
        ? 'COMPLETED'
        : (_isRunning ? 'IN SESSION' : 'READY');

    return AuroraScaffold(
      auroraColor: AppColors.mentalWellbeing,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppHeader(
            title: 'Meditation',
            subtitle: '30 minute session',
            titleColor: AppColors.mentalWellbeing,
          ),
          const Spacer(),
          Center(
            child: SizedBox(
              width: 240,
              height: 240,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.mentalWellbeing.withValues(
                          alpha: 0.45,
                        ),
                        width: 1.5,
                      ),
                    ),
                  ),
                  Container(
                    width: 196,
                    height: 196,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.mentalWellbeing.withValues(
                          alpha: 0.65,
                        ),
                        width: 1.5,
                      ),
                    ),
                  ),
                  Container(
                    width: 152,
                    height: 152,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mentalWellbeing.withValues(alpha: 0.3),
                      border: Border.all(
                        color: AppColors.mentalWellbeing,
                        width: 1.8,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.mentalWellbeing.withValues(
                            alpha: 0.35,
                          ),
                          blurRadius: 32,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateTimeUtils.formatTimerSeconds(_remainingSeconds),
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                            fontFeatures: [FontFeature.tabularFigures()],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          statusLabel,
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(letterSpacing: 1.2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 36),
          TimerControls(
            isRunning: _isRunning,
            accentColor: AppColors.mentalWellbeing,
            onTogglePlayPause: _togglePlayPause,
            onReset: _reset,
            onStop: _stopAndSave,
          ),
          const SizedBox(height: 28),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppRadii.pill),
            child: LinearProgressIndicator(
              value: elapsedFraction,
              minHeight: 5,
              backgroundColor: AppColors.surfaceElevated,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.mentalWellbeing,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              'A little stillness, just for you',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
