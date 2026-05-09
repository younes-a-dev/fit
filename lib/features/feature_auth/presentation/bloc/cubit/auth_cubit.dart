import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/auth_usecases.dart';

part 'auth_status.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final CheckLoggedInUseCase _checkLoggedInUseCase;

  AuthCubit(this._checkLoggedInUseCase)
      : super(AuthState(authStatus: AuthInitial()));

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
}
