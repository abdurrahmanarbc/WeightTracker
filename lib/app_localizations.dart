import 'package:flutter/material.dart';

class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String get title => "Uygulama Başlığı";
  String get button => "Buton Metni";
  String get language => "Dil"; // Dil seçimi metni
  // Diğer dil metinleri...

  // Dil değiştirme metodu
  void changeLanguage(BuildContext context, String languageCode) {
    // Uygulama dilini değiştirmek için gerekli işlemleri burada yapabilirsiniz.
    // Örneğin, LocaleProvider gibi bir servis kullanarak uygulama dilini ayarlayabilirsiniz.
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'tr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations();
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
