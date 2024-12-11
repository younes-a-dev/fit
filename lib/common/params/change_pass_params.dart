class ChangePassParams {
  final String email;
  final String password;

  ChangePassParams({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'new_password': password,
    };
  }
}
