import 'package:flutter/foundation.dart';

import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';

/// Manages local authentication state, profile updates, and accessibility preferences.
class AuthViewModel extends ChangeNotifier {
  AuthViewModel(this._repository);

  final AuthRepository _repository;

  bool _isLoading = false;
  bool _reducedMotion = false;
  String? _errorMessage;

  UserModel get currentUser => _repository.currentUser;
  bool get isSignedIn => _repository.isSignedIn;
  bool get isLoading => _isLoading;
  bool get reducedMotion => _reducedMotion;
  String? get errorMessage => _errorMessage;

  void setReducedMotion(bool enabled) {
    if (_reducedMotion == enabled) return;
    _reducedMotion = enabled;
    notifyListeners();
  }

  void clearError() {
    if (_errorMessage != null) {
      _errorMessage = null;
      notifyListeners();
    }
  }

  Future<bool> login({required String email, required String password}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future<void>.delayed(const Duration(milliseconds: 120));
    final ok = _repository.signIn(email: email, password: password);
    _isLoading = false;
    if (!ok) {
      _errorMessage = 'Invalid email or password. Try any valid university email and 8+ character password.';
    }
    notifyListeners();
    return ok;
  }

  Future<bool> register({
    required String fullName,
    required String email,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future<void>.delayed(const Duration(milliseconds: 120));
    _repository.register(fullName: fullName, email: email);
    _isLoading = false;
    notifyListeners();
    return true;
  }

  void updateProfile({String? fullName, int? avatarIndex}) {
    _repository.updateProfile(fullName: fullName, avatarIndex: avatarIndex);
    notifyListeners();
  }

  void signOut() {
    _repository.signOut();
    notifyListeners();
  }
}
