import 'dart:ui';

import 'package:rent_a_car/product/initialize/localization/enums/locale_enum.dart';

final class LocaleConstants {
  const LocaleConstants._();

  static List<Locale> supportedLocales =
      Locales.values.map((e) => e.locale).toList();
}
