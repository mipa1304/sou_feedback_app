class LanguageModel {
  final String flag;
  final String name;
  final String languageCode;

  LanguageModel(
    this.flag,
    this.name,
    this.languageCode,
  );

  static List<LanguageModel> languageList() {
    return <LanguageModel>[
      LanguageModel("🇺🇸", "English", 'en'),
      LanguageModel("🇮🇳", "हिंदी", 'hi'),
      LanguageModel("🇮🇳", "ગુજરાતી", 'gu'),
      LanguageModel("🇮🇳", "தமிழ்", 'ta'),
    ];
  }
}
