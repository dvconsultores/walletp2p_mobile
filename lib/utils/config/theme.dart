import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wallet_p2p/main.dart';
import 'package:wallet_p2p/main_provider.dart';

///? A Collection of app themes.
enum ThemeType {
  light;
}

///? A Mixin to getter some weigth of current font families.
/// use like `FontFamily.montserrat("400")`
mixin FontFamily {
  static final _conversion = {
    "400": "regular",
  };

  static String montserrat(String value) =>
      'Montserrat_${_conversion[value] ?? value}';

  static String karla(String value) => 'Karla_${_conversion[value] ?? value}';
}

/// Themes configuration class from app.
class ThemeApp {
  static Map<ThemeType, ThemeData> get _themes {
    final ligthTheme = ThemeData.light(useMaterial3: false);

    return {
      // ? ligth
      ThemeType.light: ligthTheme.copyWith(
        // text config
        textTheme:
            GoogleFonts.montserratTextTheme(ligthTheme.textTheme.copyWith(
          titleLarge: ligthTheme.textTheme.bodyLarge?.copyWith(
              fontSize: 34,
              letterSpacing: 3.52,
              height: 1,
              fontWeight: FontWeight.w700,
              fontFamily: GoogleFonts.montserrat().fontFamily),
          bodyLarge: ligthTheme.textTheme.bodyLarge?.copyWith(
              fontSize: 12,
              letterSpacing: .36,
              fontWeight: FontWeight.w700,
              fontFamily: GoogleFonts.montserrat().fontFamily),
          bodyMedium: ligthTheme.textTheme.bodyLarge?.copyWith(
              fontSize: 10,
              letterSpacing: .39,
              fontWeight: FontWeight.w700,
              fontFamily: GoogleFonts.montserrat().fontFamily),
          bodySmall: ligthTheme.textTheme.bodyLarge?.copyWith(fontSize: 9),
        )),

        // color config
        primaryColor: const Color.fromRGBO(9, 105, 254, 1),
        focusColor: const Color.fromRGBO(9, 105, 254, 1),
        disabledColor: const Color.fromRGBO(9, 105, 254, .5),
        colorScheme: const ColorScheme.light(
          background: Color.fromRGBO(231, 255, 227, 1),
          primary: Color.fromRGBO(9, 105, 254, 1),
          secondary: Color.fromRGBO(222, 230, 234, 1),
          tertiary: Color.fromRGBO(246, 246, 247, 1),
          error: Color.fromRGBO(242, 12, 12, 1),
          onError: Color.fromRGBO(242, 12, 12, 1),
          outline: Color.fromRGBO(0, 0, 0, 1),
        ),
        extensions: <ThemeExtension<dynamic>>[
          const ThemeDataColorExtension(
            text: Color.fromRGBO(0, 0, 0, 1),
            textVariant: Color.fromRGBO(51, 51, 51, 1),
            accent: Color.fromRGBO(124, 123, 127, 1),
            accentVariant: Color.fromRGBO(209, 196, 232, 1),
            success: Colors.green,
            warning: Color.fromARGB(255, 233, 198, 2),
          ),
          const ThemeDataStyleExtension(
            customText: TextStyle(),
          ),
        ],
      ),
    };
  }

  ///* Getter to current theme name.
  static ThemeType get theme =>
      globalNavigatorKey.currentContext!.watch<MainProvider>().appTheme;

  ///* Getter to current theme assets directory `assets/themes/${theme}`.
  static String assetsPrefix(BuildContext? context) =>
      'assets/themes/${(context ?? globalNavigatorKey.currentContext!).watch<MainProvider>().appTheme.name}';

  ///* Getter to current themeData.
  static ThemeData of(BuildContext? context) {
    final ctx = context ?? globalNavigatorKey.currentContext!;
    return _themes[ctx.watch<MainProvider>().appTheme]!;
  }

  ///* Switch between themeData.
  static void switchTheme(BuildContext? context, ThemeType themeType) =>
      (context ?? globalNavigatorKey.currentContext!)
          .read<MainProvider>()
          .switchTheme = themeType;

  ///* Getter to all custom colors registered in themeData.
  static ColorsApp colors(BuildContext? context) {
    final themeData = Theme.of(context ?? globalNavigatorKey.currentContext!);

    return ColorsApp(
      background: themeData.colorScheme.background,
      primary: themeData.colorScheme.primary,
      secondary: themeData.colorScheme.secondary,
      tertiary: themeData.colorScheme.tertiary,
      error: themeData.colorScheme.error,
      focusColor: themeData.focusColor,
      disabledColor: themeData.disabledColor,
      text: themeData.extension<ThemeDataColorExtension>()!.text!,
      textVariant: themeData.extension<ThemeDataColorExtension>()!.textVariant!,
      accent: themeData.extension<ThemeDataColorExtension>()!.accent!,
      success: themeData.extension<ThemeDataColorExtension>()!.success!,
      warning: themeData.extension<ThemeDataColorExtension>()!.warning!,
      accentVariant:
          themeData.extension<ThemeDataColorExtension>()!.accentVariant!,
    );
  }

  ///* Getter to all custom styles registered in themeData.
  static ThemeDataStyleExtension styles(BuildContext? context) {
    final themeData = Theme.of(context ?? globalNavigatorKey.currentContext!);

    return ThemeDataStyleExtension(
      customText: themeData.extension<ThemeDataStyleExtension>()!.customText,
    );
  }
}

///? Collection of all custom colors registered in themeData
class ColorsApp {
  const ColorsApp({
    required this.background,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.error,
    required this.focusColor,
    required this.disabledColor,
    required this.text,
    required this.textVariant,
    required this.accent,
    required this.success,
    required this.warning,
    required this.accentVariant,
  });
  final Color background;
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color error;
  final Color focusColor;
  final Color disabledColor;
  final Color text;
  final Color textVariant;
  final Color accent;
  final Color success;
  final Color warning;
  final Color accentVariant;
}

// ? Theme data color extension
@immutable
class ThemeDataColorExtension extends ThemeExtension<ThemeDataColorExtension> {
  const ThemeDataColorExtension({
    this.text,
    this.textVariant,
    this.accent,
    this.accentVariant,
    this.success,
    this.warning,
  });
  final Color? text;
  final Color? textVariant;
  final Color? accent;
  final Color? accentVariant;
  final Color? success;
  final Color? warning;

  @override
  ThemeDataColorExtension copyWith({
    Color? text,
    Color? textVariant,
    Color? accent,
    Color? accentVariant,
    Color? success,
    Color? warning,
  }) {
    return ThemeDataColorExtension(
      text: text ?? this.text,
      textVariant: textVariant ?? this.textVariant,
      accent: accent ?? this.accent,
      accentVariant: accentVariant ?? this.accentVariant,
      success: success ?? this.success,
      warning: warning ?? this.warning,
    );
  }

  @override
  ThemeDataColorExtension lerp(ThemeDataColorExtension? other, double t) {
    if (other is! ThemeDataColorExtension) return this;

    return ThemeDataColorExtension(
      text: Color.lerp(text, other.text, t),
      textVariant: Color.lerp(text, other.text, t),
      accent: Color.lerp(accent, other.accent, t),
      accentVariant: Color.lerp(accentVariant, other.accentVariant, t),
      success: Color.lerp(success, other.success, t),
      warning: Color.lerp(warning, other.warning, t),
    );
  }

  @override
  String toString() =>
      'ThemeDataColorExtension(text: $text, textVariant: $textVariant, accent: $accent, accentVariant: $accentVariant, success: $success, warning: $warning)';
}

// ? Theme data style extension
@immutable
class ThemeDataStyleExtension extends ThemeExtension<ThemeDataStyleExtension> {
  const ThemeDataStyleExtension({
    required this.customText,
  });
  final TextStyle customText;

  @override
  ThemeDataStyleExtension copyWith({
    TextStyle? customText,
  }) {
    return ThemeDataStyleExtension(
      customText: customText ?? this.customText,
    );
  }

  @override
  ThemeDataStyleExtension lerp(ThemeDataStyleExtension? other, double t) {
    if (other is! ThemeDataStyleExtension) return this;

    return const ThemeDataStyleExtension(
      customText: TextStyle(),
    );
  }

  @override
  String toString() => 'ThemeDataStyleExtension(customText: $customText)';
}
