enum Language { english, persian }
enum Gender { male,female,other}
enum UserRole {normal,coach}
enum WeekStartDay {saturday,sunday,monday}

extension LanguageExtension on Language {
  String get code {
    switch (this) {
      case Language.english:
        return 'en';
      case Language.persian:
        return 'fa';
    }
  }

  String get displayName {
    switch (this) {
      case Language.english:
        return 'English';
      case Language.persian:
        return 'فارسی';
    }
  }

  static Language fromCode(String code) {
    switch (code) {
      case 'fa':
        return Language.persian;
      default:
        return Language.english;
    }
  }
}