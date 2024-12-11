abstract class ButtonState {}

class ButtonStateInitial extends ButtonState {}

class ButtonStateLoading extends ButtonState {}

class ButtonStateSuccess extends ButtonState {
  dynamic data;
  ButtonStateSuccess({this.data});
}

class ButtonStateFailure extends ButtonState {
  final String error;
  ButtonStateFailure(this.error);
}
