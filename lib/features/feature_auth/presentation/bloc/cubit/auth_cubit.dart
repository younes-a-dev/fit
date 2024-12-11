import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/params/sign_up_params.dart';
import '../../../../../locator.dart';
import '../../../domin/usecase/is_logged_in_usecase.dart';
import '../../../domin/usecase/sign_up_usecase.dart';

part 'auth_status.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(AuthState(
            authStatus: AppInitialState(),));

  void checkAppStateEvent() async {
    emit(state.copyWith(newAuthStatus: AppInitialState()));

    var isLoggedIn = await sl<IsLoggedInUsecase>().call();
    if (isLoggedIn) {
      emit(state.copyWith(newAuthStatus: AuthenticatedState()));
    } else {
      emit(state.copyWith(newAuthStatus: UnAuthenticatedState()));
    }
  }
}
