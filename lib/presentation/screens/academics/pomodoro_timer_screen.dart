import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../app/theme_tokens.dart';
import '../../../core/utils/date_time_utils.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/progress_ring.dart';
import '../../widgets/timer_controls.dart';

enum _PomodoroStatus { ready, running, paused, completed }

/// Screen 14 — Pomodoro Timer with real countdown, Play/Pause/Reset controls,
/// and Randomizer Music Player toggle.
class PomodoroTimerScreen extends StatefulWidget {
  const PomodoroTimerScreen({super.key, this.initialDurationSeconds = 15 * 60});

  final int initialDurationSeconds;

  @override
  State<PomodoroTimerScreen> createState() => _PomodoroTimerScreenState();
}

class _PomodoroTimerScreenState extends State<PomodoroTimerScreen> {
  static const List<String> _ambientTracks = [
    'Midnight Rain & Lo-Fi',
    'Aurora Deep Focus Synth',
    'Library Quiet Ambience',
    'Soft Piano Study Loop',
  ];

  late int _remainingSeconds;
  _PomodoroStatus _status = _PomodoroStatus.ready;
  Timer? _timer;
  int? _activeTrackIndex;

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
    if (_status == _PomodoroStatus.running) {
      _timer?.cancel();
      setState(() => _status = _PomodoroStatus.paused);
      return;
    }

    if (_status == _PomodoroStatus.completed) {
      _remainingSeconds = widget.initialDurationSeconds;
    }

    setState(() => _status = _PomodoroStatus.running);
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
          _status = _PomodoroStatus.completed;
        });
        final mins = (widget.initialDurationSeconds / 60).round().clamp(1, 180);
        AppStateScope.of(context).academics.recordPomodoroCompletion(mins);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Focus session completed! +$mins min logged.'),
          ),
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
      _status = _PomodoroStatus.ready;
    });
  }

  void _randomizeTrack() {
    setState(() {
      if (_activeTrackIndex == null) {
        _activeTrackIndex = 0;
      } else {
        _activeTrackIndex = (_activeTrackIndex! + 1) % _ambientTracks.length;
      }
    });
  }

  String get _statusLabel => switch (_status) {
    _PomodoroStatus.ready => 'READY',
    _PomodoroStatus.running => 'FOCUSING',
    _PomodoroStatus.paused => 'PAUSED',
    _PomodoroStatus.completed => 'COMPLETED',
  };

  @override
  Widget build(BuildContext context) {
    final academics = AppStateScope.of(context).academics;
    final total = widget.initialDurationSeconds;
    final progress = total == 0 ? 0.0 : _remainingSeconds / total;

    return AuroraScaffold(
      auroraColor: AppColors.academics,
      body: ListenableBuilder(
        listenable: academics,
        builder: (context, _) {
          final sessionNum = (academics.completedPomodorosToday % 4) + 1;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader(
                title: 'Pomodoro Timer',
                subtitle: 'Focus session $sessionNum of 4',
                titleColor: AppColors.academics,
              ),
              const Spacer(),
              Center(
                child: ProgressRing(
                  progress: progress,
                  accentColor: _status == _PomodoroStatus.completed
                      ? AppColors.success
                      : AppColors.academics,
                  size: 228,
                  strokeWidth: 14,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateTimeUtils.formatTimerSeconds(_remainingSeconds),
                        style: const TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                          fontFeatures: [FontFeature.tabularFigures()],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _statusLabel,
                        style: Theme.of(context).textTheme.labelSmall
                            ?.copyWith(letterSpacing: 1.4),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 36),
              TimerControls(
                isRunning: _status == _PomodoroStatus.running,
                accentColor: AppColors.academics,
                onTogglePlayPause: _togglePlayPause,
                onReset: _reset,
              ),
              const SizedBox(height: 32),
              Center(
                child: OutlinedButton.icon(
                  onPressed: _randomizeTrack,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.academics,
                    side: BorderSide(
                      color: AppColors.academics.withValues(alpha: 0.65),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppRadii.md),
                    ),
                  ),
                  icon: const Icon(LucideIcons.music, size: 18),
                  label: Text(
                    _activeTrackIndex == null
                        ? 'Randomizer Music Player'
                        : 'Playing: ${_ambientTracks[_activeTrackIndex!]}',
                  ),
                ),
              ),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
