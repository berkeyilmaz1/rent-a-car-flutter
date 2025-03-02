import 'package:flutter/material.dart';

enum Locales {
  tr(Locale('tr'));

  final Locale locale;
  const Locales(this.locale);
}
