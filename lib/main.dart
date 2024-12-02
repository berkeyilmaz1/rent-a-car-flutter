import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:rent_a_car/features/auth/view/auth_view.dart';
import 'package:rent_a_car/product/initialize/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('tr_TR');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const customTheme = CustomTheme(TextTheme());
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: customTheme.theme(CustomTheme.lightScheme()),
      darkTheme: customTheme.theme(CustomTheme.darkScheme()),
      themeMode: ThemeMode.light,
      home: const AuthView(),
    );
  }
}
