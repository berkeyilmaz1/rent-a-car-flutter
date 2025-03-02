import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rent_a_car/product/initialize/localization/main_localization.dart';
import 'package:rent_a_car/product/initialize/main_app/main_app.dart';

void main() async {
  await applicationInitialize();
  runApp(MainLocalization(child: const MainApp()));
}

Future<void> applicationInitialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initializeDateFormatting('tr_TR');
}
