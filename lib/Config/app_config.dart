import '/Locale/Languages/arabic.dart';
import '/Locale/Languages/english.dart';
import '/Locale/Languages/french.dart';
import '/Locale/Languages/german.dart';
import '/Locale/Languages/indonesian.dart';
import '/Locale/Languages/italian.dart';
import '/Locale/Languages/portuguese.dart';
import '/Locale/Languages/romanian.dart';
import '/Locale/Languages/spanish.dart';
import '/Locale/Languages/swahili.dart';
import '/Locale/Languages/turkish.dart';

class AppConfig {
  static final String appName = "Hungerz";
  static final bool isDemoMode = true;
  static const String languageDefault = "en";
  static final Map<String, AppLanguage> languagesSupported = {
    "en": AppLanguage("English", english()),
    "ar": AppLanguage("عربى", arabic()),
    "pt": AppLanguage("Portugal", portuguese()),
    "fr": AppLanguage("Français", french()),
    "id": AppLanguage("Bahasa Indonesia", indonesian()),
    "es": AppLanguage("Español", spanish()),
    "it": AppLanguage("italiano", italian()),
    "tr": AppLanguage("Türk", turkish()),
    "sw": AppLanguage("Kiswahili", swahili()),
    "de": AppLanguage("Deutsch", german()),
    "ro": AppLanguage("Română", romanian()),
  };
}

class AppLanguage {
  final String name;
  final Map<String, String> values;
  AppLanguage(this.name, this.values);
}
