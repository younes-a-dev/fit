part of 'language_cubit.dart';

@immutable
abstract class GetLanguageStatus {}
class GetLanguageInitial extends GetLanguageStatus{}
class GetLanguageLoading extends GetLanguageStatus{}
class GetLanguageCompleted extends GetLanguageStatus{
  final LanguageEntity language;
  GetLanguageCompleted(this.language);
}
class GetLanguageError extends GetLanguageStatus{
  final String message;
  GetLanguageError(this.message);
}