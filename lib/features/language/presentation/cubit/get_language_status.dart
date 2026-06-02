part of 'language_cubit.dart';

@immutable
abstract class GetLanguageStatus extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLanguageInitial extends GetLanguageStatus {}

class GetLanguageLoading extends GetLanguageStatus {}

class GetLanguageCompleted extends GetLanguageStatus {}

class GetLanguageError extends GetLanguageStatus {
  final String message;
  GetLanguageError(this.message);

  @override
  List<Object?> get props => [message];
}