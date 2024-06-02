import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    // AppLocalizations nesnesini alıyoruz ve null kontrolü yapıyoruz
    final localizations = AppLocalizations.of(context);
    if (localizations == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Localization Error'),
        ),
        body: Center(
          child: Text('Localization data not found.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.title),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(localizations.theme),
            subtitle: Text(localizations.themeSubtitle),
            leading: Icon(Icons.color_lens),
            onTap: () {
              // TODO: Implement theme change functionality
            },
          ),
          ListTile(
            title: Text(localizations.notifications),
            subtitle: Text(localizations.notificationsSubtitle),
            leading: Icon(Icons.notifications),
            onTap: () {
              // TODO: Implement notification settings
            },
          ),
          ListTile(
            title: Text(localizations.language),
            subtitle: Text(localizations.languageSubtitle),
            leading: Icon(Icons.language),
            onTap: () {
              // Navigate to language selection page
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LanguageSelectionPage()),
              );
            },
          ),
          // Add more settings here...
        ],
      ),
    );
  }
}

class LanguageSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('English'),
            onTap: () {
              // TODO: Set app language to English
            },
          ),
          ListTile(
            title: Text('Türkçe'),
            onTap: () {
              // TODO: Set app language to Turkish
            },
          ),
          // Add more languages here...
        ],
      ),
    );
  }
}

class AppLocalizations {
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title => 'Settings';
  String get theme => 'Theme';
  String get themeSubtitle => 'Change the app theme';
  String get notifications => 'Notifications';
  String get notificationsSubtitle => 'Enable or disable notifications';
  String get language => 'Language';
  String get languageSubtitle => 'Change the app language';
}
