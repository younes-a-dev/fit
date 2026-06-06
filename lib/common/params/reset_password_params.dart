class ResetPasswordParams {
  final String resetToken;
  final String newPassword;

  ResetPasswordParams({required this.resetToken,required this.newPassword});

  Map<String,String> toMap(){
    return <String,String>{
      'reset_token' : resetToken,
      'new_password' : newPassword,
    };
  }
}