class VerifyEmailParams {
  final String email;
  final String code;

  VerifyEmailParams({required this.email, required this.code});

  Map<String, String> toMap() {
    return <String, String>{
      'email': email,
      'code': code,
    };
  }
}
