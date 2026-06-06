class ChangePassParams {
  final String currentPassword;
  final String newPassword;

  ChangePassParams({required this.currentPassword, required this.newPassword});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'current_password': currentPassword,
      'new_password': newPassword,
    };
  }
}
