import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/app_constants.dart';
import '../presentation/view_models/app_state.dart';
import 'route_names.dart';
import 'router.dart';
import 'theme.dart';

/// Root Quadrilibrium Flutter application shell.
class QuadrilibriumApp extends StatefulWidget {
  const QuadrilibriumApp({
    super.key,
    this.initialLocation = RouteNames.welcome,
    this.appState,
  });

  final String initialLocation;
  final AppState? appState;

  @override
  State<QuadrilibriumApp> createState() => _QuadrilibriumAppState();
}

class _QuadrilibriumAppState extends State<QuadrilibriumApp> {
  late final AppState _appState;
  late final bool _ownsState;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _ownsState = widget.appState == null;
    _appState = widget.appState ?? AppState();
    _router = createAppRouter(initialLocation: widget.initialLocation);
  }

  @override
  void dispose() {
    _router.dispose();
    if (_ownsState) {
      _appState.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      appState: _appState,
      child: MaterialApp.router(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: buildQuadrilibriumTheme(),
        routerConfig: _router,
      ),
    );
  }
}
