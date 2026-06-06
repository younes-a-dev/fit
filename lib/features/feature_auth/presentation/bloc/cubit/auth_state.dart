part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final SignUpWithEmailStatus signUpWithEmailStatus;
  final VerifyEmailStatus verifyEmailStatus;
  final SignInWithEmailStatus signInWithEmailStatus;
  final ChangePasswordStatus changePasswordStatus;
  final RequestResetCodeStatus requestResetCodeStatus;
  final VerifyResetCodeStatus verifyResetCodeStatus;
  final ResetPasswordStatus resetPasswordStatus;

  const AuthState({
    required this.authStatus,
    required this.signUpWithEmailStatus,
    required this.verifyEmailStatus,
    required this.signInWithEmailStatus,
    required this.changePasswordStatus,
    required this.requestResetCodeStatus,
    required this.verifyResetCodeStatus,
    required this.resetPasswordStatus,
  });

  AuthState copyWith({
    AuthStatus? newAuthStatus,
    SignUpWithEmailStatus? newSignUpWithEmailStatus,
    VerifyEmailStatus? newVerifyEmailStatus,
    SignInWithEmailStatus? newSignInWithEmailStatus,
    ChangePasswordStatus? newChangePasswordStatus,
    RequestResetCodeStatus? newRequestResetCodeStatus,
    VerifyResetCodeStatus? newVerifyResetCodeStatus,
    ResetPasswordStatus? newResetPasswordStatus,
  }) {
    return AuthState(
      authStatus: newAuthStatus ?? authStatus,
      signUpWithEmailStatus: newSignUpWithEmailStatus ?? signUpWithEmailStatus,
      verifyEmailStatus: newVerifyEmailStatus ?? verifyEmailStatus,
      signInWithEmailStatus: newSignInWithEmailStatus ?? signInWithEmailStatus,
      changePasswordStatus: newChangePasswordStatus ?? changePasswordStatus,
      requestResetCodeStatus:
          newRequestResetCodeStatus ?? requestResetCodeStatus,
      verifyResetCodeStatus: newVerifyResetCodeStatus ?? verifyResetCodeStatus,
      resetPasswordStatus: newResetPasswordStatus ?? resetPasswordStatus,
    );
  }

  @override
  List<Object?> get props => [
        authStatus,
        signUpWithEmailStatus,
        verifyEmailStatus,
        signInWithEmailStatus,
        requestResetCodeStatus,
        verifyResetCodeStatus,
        resetPasswordStatus,
        changePasswordStatus,
      ];
}
