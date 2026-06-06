class VerifyResetCodeParams {
  final String email;
  final String code;

  VerifyResetCodeParams({required this.email,required this.code});

  Map<String,String> toMap(){
    return <String,String>{
      'email' : email,
      'code' : code,
    };
  }
}