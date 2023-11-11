import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:wallet_p2p/utils/config/config.dart';
import 'package:wallet_p2p/utils/config/theme.dart';
import 'package:wallet_p2p/utils/services/local_data/hive_data_service.dart';

class MainProvider extends ChangeNotifier {
  // ? -------------------------Global variables----------------------------- //
  bool stopProcess = false;
  set setStopProcess(bool value) {
    stopProcess = value;
    notifyListeners();
  }

  // ? ----------------------Theme switcher Provider------------------------- //
  /// Current app theme.
  ThemeType appTheme = ThemeType.values.firstWhereOrNull((element) =>
          element.name == HiveData.read(HiveDataCollection.theme)) ??
      ThemeType.light;

  /// Setter to switch the current app theme from [ThemeType] value.
  set switchTheme(ThemeType newTheme) {
    appTheme = newTheme;
    HiveData.write(HiveDataCollection.theme, newTheme.name);
    notifyListeners();
  }

  // ? ----------------------Localization translate-------------------------- //
  /// Current locale.
  Locale locale = Locale(HiveData.read(HiveDataCollection.language) ??
      LanguageList.deviceLanguage().name);

  /// change current locale.
  set changeLocale(LanguageList value) {
    locale = Locale(value.name);
    HiveData.write(HiveDataCollection.language, value.name);
    notifyListeners();
  }

  // ? ---------------------------------------------------------------------- //

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
