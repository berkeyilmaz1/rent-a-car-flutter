import 'package:easy_localization/easy_localization.dart';
import 'package:rent_a_car/product/initialize/localization/enums/locale_enum.dart';
import 'package:rent_a_car/product/initialize/localization/locale_constants.dart';

final class MainLocalization extends EasyLocalization {
  MainLocalization({
    required super.child,
    super.key,
  }) : super(
          path: localizationPath,
          useOnlyLangCode: true,
          supportedLocales: LocaleConstants.supportedLocales,
          fallbackLocale: Locales.tr.locale,
        );

  static const String localizationPath = 'assets/translations';
}
