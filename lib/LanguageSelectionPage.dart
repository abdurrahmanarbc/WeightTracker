import 'package:flutter/material.dart';
import 'package:weight_tracking/app_localizations.dart';

class LanguageSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localizations =
        AppLocalizations.of(context); // AppLocalizations nesnesini alın

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations!.language), // Dil seçimi başlığı
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('English'), // İngilizce dil seçeneği
            onTap: () {
              _changeLanguage(context, 'en');
            },
          ),
          ListTile(
            title: Text('Türkçe'), // Türkçe dil seçeneği
            onTap: () {
              _changeLanguage(context, 'tr');
            },
          ),
          // Diğer dil seçeneklerini buraya ekleyin
        ],
      ),
    );
  }

  void _changeLanguage(BuildContext context, String languageCode) {
    final localizations = AppLocalizations.of(context);
    localizations!.changeLanguage(context, languageCode);

    // Dil değiştirme işlemi tamamlandıktan sonra sayfayı kapatmak için Navigator.pop() kullanabiliriz
    Navigator.pop(context);
  }
}
