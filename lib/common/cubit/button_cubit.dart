import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/usecase/usecase.dart';
import 'button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonStateInitial());

  void execute({dynamic params, required UseCase usecase}) async {
    emit(ButtonStateLoading());

    try {
      Either result = await usecase.call(param: params);
      result.fold((error) {
        emit(ButtonStateFailure(error));
      }, (data) {
        emit(ButtonStateSuccess(data: data));
      });
    } catch (e) {
      emit(ButtonStateFailure(e.toString()));
    }
  }
}
