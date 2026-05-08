import 'package:equatable/equatable.dart';
import 'package:workout/core/constants/enums.dart';

class LanguageEntity extends Equatable{
  final Language language;

  const LanguageEntity({required this.language});

  @override
  List<Object> get props => [language];
}