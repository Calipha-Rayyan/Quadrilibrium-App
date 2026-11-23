import 'dart:async';

import 'package:flutter/material.dart';

import '../../../app/theme_tokens.dart';
import '../../../core/utils/date_time_utils.dart';
import '../../view_models/app_state.dart';
import '../../widgets/app_header.dart';
import '../../widgets/aurora_scaffold.dart';
import '../../widgets/primary_button.dart';

enum _BreathPhase {
  ready('Ready', 4, 0.84),
  inhale('Inhale', 4, 1.0),
  hold('Hold', 4, 1.0),
  exhale('Exhale', 4, 0.72),
  rest('Rest', 2, 0.72);

  const _BreathPhase(this.label, this.seconds, this.orbScale);
  final String label;
  final int seconds;
  final double orbScale;
}

/// Screen 31 — Breathing Exercises with guided Inhale / Hold / Exhale / Rest phases.
class BreathingExercisesScreen extends StatefulWidget {
  const BreathingExercisesScreen({
    super.key,
    this.sessionDurationSeconds = 5 * 60,
  });

  final int sessionDurationSeconds;

  @override
  State<BreathingExercisesScreen> createState() =>
      _BreathingExercisesScreenState();
}

class _BreathingExercisesScreenState extends State<BreathingExercisesScreen> {
  static const List<_BreathPhase> _cycle = [
    _BreathPhase.inhale,
    _BreathPhase.hold,
    _BreathPhase.exhale,
    _BreathPhase.rest,
  ];

  bool _isRunning = false;
  int _cycleIndex = 0;
  _BreathPhase _phase = _BreathPhase.ready;
  int _phaseSecondsLeft = 4;
  int _elapsedSessionSeconds = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _toggleStartPause() {
    if (_isRunning) {
      _timer?.cancel();
      setState(() => _isRunning = false);
      return;
    }

    setState(() {
      _isRunning = true;
      if (_phase == _BreathPhase.ready) {
        _cycleIndex = 0;
        _phase = _cycle.first;
        _phaseSecondsLeft = _phase.seconds;
      }
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _elapsedSessionSeconds++;
        if (_elapsedSessionSeconds >= widget.sessionDurationSeconds) {
          timer.cancel();
          _isRunning = false;
          _phase = _BreathPhase.ready;
          _phaseSecondsLeft = 4;
          AppStateScope.of(context).mentalWellbeing.recordBreathingSession();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Breathing session completed.')),
          );
          return;
        }
        if (_phaseSecondsLeft <= 1) {
          _cycleIndex = (_cycleIndex + 1) % _cycle.length;
          _phase = _cycle[_cycleIndex];
          _phaseSecondsLeft = _phase.seconds;
        } else {
          _phaseSecondsLeft--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final reducedMotion = AppStateScope.of(context).auth.reducedMotion;
    final orbSize = 156.0 * _phase.orbScale;

    return AuroraScaffold(
      auroraColor: AppColors.mentalWellbeing,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppHeader(
            title: 'Breathing',
            subtitle: 'Inhale 4s · Hold 4s · Exhale 4s · Rest 2s',
            titleColor: AppColors.mentalWellbeing,
          ),
          const Spacer(),
          Center(
            child: SizedBox(
              width: 244,
              height: 244,
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
                  AnimatedContainer(
                    duration: reducedMotion
                        ? Duration.zero
                        : const Duration(milliseconds: 900),
                    curve: Curves.easeInOut,
                    width: orbSize,
                    height: orbSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mentalWellbeing.withValues(alpha: 0.32),
                      border: Border.all(
                        color: AppColors.mentalWellbeing,
                        width: 2,
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
                          _phase.label,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '$_phaseSecondsLeft',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textPrimary,
                            fontFeatures: [FontFeature.tabularFigures()],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),
          Center(
            child: Text(
              'Session ${DateTimeUtils.formatTimerSeconds(_elapsedSessionSeconds)} / ${DateTimeUtils.formatTimerSeconds(widget.sessionDurationSeconds)}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: _isRunning ? 'Pause' : 'Start breathing',
            backgroundColor: AppColors.mentalWellbeing,
            onPressed: _toggleStartPause,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
