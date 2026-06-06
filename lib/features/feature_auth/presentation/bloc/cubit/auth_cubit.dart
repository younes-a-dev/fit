import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/params/change_pass_params.dart';
import '../../../../../common/params/reset_password_params.dart';
import '../../../../../common/params/sign_in_params.dart';
import '../../../../../common/params/sign_up_params.dart';
import '../../../../../common/params/verify_email_params.dart';
import '../../../../../common/params/verify_reset_code_params.dart';
import '../../../domain/usecase/auth_usecases.dart';
import 'status/auth_status.dart';
import 'status/change_password_status.dart';
import 'status/request_reset_code_status.dart';
import 'status/reset_password_status.dart';
import 'status/sign_in_with_email_status.dart';
import 'status/sign_up_with_email_status.dart';
import 'status/verify_email_status.dart';
import 'status/verify_reset_code_status.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final CheckLoggedInUseCase _checkLoggedInUseCase;
  final SignUpWithEmailUseCase _signUpWithEmailUseCase;
  final VerifyEmailUseCase _verifyEmailUseCase;
  final SignInWithEmailUseCase _signInWithEmailUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final RequestResetCodeUseCase _requestResetCodeUseCase;
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  AuthCubit(
    this._checkLoggedInUseCase,
    this._signUpWithEmailUseCase,
    this._verifyEmailUseCase,
    this._signInWithEmailUseCase,
    this._changePasswordUseCase,
    this._requestResetCodeUseCase,
    this._verifyResetCodeUseCase,
    this._resetPasswordUseCase,
  ) : super(AuthState(
          authStatus: AuthInitial(),
          signUpWithEmailStatus: SignUpWithEmailInitial(),
          verifyEmailStatus: VerifyEmailInitial(),
          signInWithEmailStatus: SignInWithEmailInitial(),
          requestResetCodeStatus: RequestResetCodeInitial(),
          verifyResetCodeStatus: VerifyResetCodeInitial(),
          resetPasswordStatus: ResetPasswordInitial(),
          changePasswordStatus: ChangePasswordInitial(),
        ));

  // SignUp with Email
  Future<void> signUpWithEmail(SignUpWithEmailParams params) async {
    emit(state.copyWith(newSignUpWithEmailStatus: SignUpWithEmailLoading()));
    var result = await _signUpWithEmailUseCase(param: params);

    result.fold((failure) {
      emit(state.copyWith(
          newSignUpWithEmailStatus:
              SignUpWithEmailError(message: failure.message)));
    }, (authEntity) {
      emit(state.copyWith(
          newSignUpWithEmailStatus: SignUpWithEmailCompleted(authEntity)));
    });
  }

  // Verify Email for sign up
  Future<void> verifyEmail(VerifyEmailParams params) async {
    emit(state.copyWith(newVerifyEmailStatus: VerifyEmailLoading()));

    var result = await _verifyEmailUseCase(param: params);
    result.fold((failure) {
      emit(state.copyWith(
          newVerifyEmailStatus: VerifyEmailError(message: failure.message)));
    }, (_) {
      emit(state.copyWith(newVerifyEmailStatus: VerifyEmailCompleted()));
    });
  }

  // Login with Email
  Future<void> signInWithEmail(SignInWithEmailParams params) async {
    emit(state.copyWith(newSignInWithEmailStatus: SignInWithEmailLoading()));
    var result = await _signInWithEmailUseCase(param: params);

    result.fold((failure) {
      emit(state.copyWith(
          newSignInWithEmailStatus:
              SignInWithEmailError(message: failure.message)));
    }, (_) {
      emit(
          state.copyWith(newSignInWithEmailStatus: SignInWithEmailCompleted()));
    });
  }

  // Change Password
  Future<void> changePassword(ChangePassParams params) async {
    emit(state.copyWith(newChangePasswordStatus: ChangePasswordLoading()));
    var result = await _changePasswordUseCase(param: params);

    result.fold((failure) {
      emit(state.copyWith(
          newChangePasswordStatus:
              ChangePasswordError(message: failure.message)));
    }, (_) {
      emit(state.copyWith(newChangePasswordStatus: ChangePasswordCompleted()));
    });
  }

  // Request reset code for reset password (Forgot Password)
  Future<void> requestResetCode(String email) async {
    emit(state.copyWith(newRequestResetCodeStatus: RequestResetCodeLoading()));
    var result = await _requestResetCodeUseCase(param: email);

    result.fold((failure) {
      emit(state.copyWith(
          newRequestResetCodeStatus:
              RequestResetCodeError(message: failure.message)));
    }, (_) {
      emit(state.copyWith(
          newRequestResetCodeStatus: RequestResetCodeCompleted()));
    });
  }

  // Verify Code for reset password (Forgot Password)
  Future<void> verifyResetCode(VerifyResetCodeParams params) async {
    emit(state.copyWith(newVerifyResetCodeStatus: VerifyResetCodeLoading()));
    var result = await _verifyResetCodeUseCase(param: params);

    result.fold((failure) {
      emit(state.copyWith(
          newVerifyResetCodeStatus:
              VerifyResetCodeError(message: failure.message)));
    }, (resetToken) {
      emit(state.copyWith(
          newVerifyResetCodeStatus: VerifyResetCodeCompleted(resetToken)));
    });
  }

  // Reset Password (Forgot Password)
  Future<void> resetPassword(ResetPasswordParams params) async {
    emit(state.copyWith(newResetPasswordStatus: ResetPasswordLoading()));
    var result = await _resetPasswordUseCase(param: params);

    result.fold((failure) {
      emit(state.copyWith(
          newResetPasswordStatus:
              ResetPasswordError(message: failure.message)));
    }, (_) {
      emit(state.copyWith(newResetPasswordStatus: ResetPasswordCompleted()));
    });
  }

  // Check isLoggedIn
  void checkLoggedIn() async {
    emit(state.copyWith(newAuthStatus: AuthLoading()));

    var result = await _checkLoggedInUseCase();
    result.fold((failure) {
      emit(state.copyWith(newAuthStatus: AuthError(failure.message)));
    }, (isLoggedIn) {
      isLoggedIn
          ? emit(state.copyWith(newAuthStatus: AuthAuthenticated()))
          : emit(state.copyWith(newAuthStatus: AuthUnauthenticated()));
    });
  }

  void resetIsLoggedInStatus(){
    emit(state.copyWith(newAuthStatus: AuthInitial()));
  }

  void resetAuthStatus(){
    emit(state.copyWith(newSignUpWithEmailStatus: SignUpWithEmailInitial()));
    emit(state.copyWith(newVerifyEmailStatus: VerifyEmailInitial()));
    emit(state.copyWith(newSignInWithEmailStatus: SignInWithEmailInitial()));
    emit(state.copyWith(newRequestResetCodeStatus: RequestResetCodeInitial()));
    emit(state.copyWith(newVerifyResetCodeStatus: VerifyResetCodeInitial()));
    emit(state.copyWith(newResetPasswordStatus: ResetPasswordInitial()));
  }
}
