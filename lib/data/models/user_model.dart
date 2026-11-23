/// Local user profile model for the prototype.
class UserModel {
  const UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.avatarIndex = 0,
    this.isSampleUser = true,
  });

  final String id;
  final String fullName;
  final String email;
  final int avatarIndex;
  final bool isSampleUser;

  String get firstName {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    return parts.isEmpty || parts.first.isEmpty ? 'Student' : parts.first;
  }

  UserModel copyWith({
    String? fullName,
    String? email,
    int? avatarIndex,
    bool? isSampleUser,
  }) {
    return UserModel(
      id: id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      avatarIndex: avatarIndex ?? this.avatarIndex,
      isSampleUser: isSampleUser ?? this.isSampleUser,
    );
  }
}
