enum LanguageType {
  ENGLISH,
  SPANISH,
}

const String ENGLISH = "en";
const String SPANISH = "es";

extension LanguageTypExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.SPANISH:
        return SPANISH;
    }
  }
}
