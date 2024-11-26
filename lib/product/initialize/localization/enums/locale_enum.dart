import 'package:flutter/material.dart';

enum Locales {
  en(Locale('en'));

  final Locale locale;
  const Locales(this.locale);
}
