import 'package:flutter/material.dart';
import 'package:rent_a_car/features/home/view/home_view.dart';
import 'package:rent_a_car/product/initialize/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const customTheme = CustomTheme(TextTheme());
    return MaterialApp(
      title: 'Material App',
      theme: customTheme.theme(CustomTheme.lightScheme()),
      darkTheme: customTheme.theme(CustomTheme.darkScheme()),
      themeMode: ThemeMode.light,
      home: const HomeView(),
    );
  }
}
