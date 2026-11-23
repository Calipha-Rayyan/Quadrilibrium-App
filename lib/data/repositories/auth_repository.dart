import '../models/user_model.dart';
import '../sample_data.dart';

/// Local development authentication repository (no remote server).
class AuthRepository {
  UserModel _currentUser = SampleData.defaultUser;
  bool _isSignedIn = false;

  UserModel get currentUser => _currentUser;
  bool get isSignedIn => _isSignedIn;

  /// Validates local prototype credentials.
  /// Any valid email + >=8-char password succeeds in local dev mode,
  /// except `invalid@test.com` which triggers an explicit invalid-credentials error.
  bool signIn({required String email, required String password}) {
    final normalized = email.trim().toLowerCase();
    if (normalized == 'invalid@test.com' || password == 'wrongpass') {
      return false;
    }
    _currentUser = _currentUser.copyWith(
      email: email.trim(),
      isSampleUser: normalized == SampleData.defaultUser.email,
    );
    _isSignedIn = true;
    return true;
  }

  UserModel register({required String fullName, required String email}) {
    _currentUser = UserModel(
      id: 'local-user-${DateTime.now().millisecondsSinceEpoch}',
      fullName: fullName.trim(),
      email: email.trim(),
      avatarIndex: 0,
      isSampleUser: false,
    );
    _isSignedIn = true;
    return _currentUser;
  }

  UserModel updateProfile({String? fullName, int? avatarIndex}) {
    _currentUser = _currentUser.copyWith(
      fullName: fullName?.trim().isNotEmpty == true ? fullName!.trim() : null,
      avatarIndex: avatarIndex,
    );
    return _currentUser;
  }

  void signOut() {
    _isSignedIn = false;
  }
}
