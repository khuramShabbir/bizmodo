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
  static final String appName = "BizModo eMenu";

  // to get the token
  static String clientId = "7";
  static String clientSecret = "C30C6RIW3dxtQMQcKRMCXlT3smG106t5OYoaySoN";
  static String grantType = "password";
  static String scope = "";

  // api base url
  static String baseUrl = "https://manage.bizmodo.ae/";

  static final bool isDemoMode = true;

  // language
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
