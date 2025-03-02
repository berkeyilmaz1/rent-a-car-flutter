import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_car/product/initialize/providers/user_provider.dart';
import 'package:rent_a_car/product/initialize/router/main_app_router.dart';
import 'package:rent_a_car/product/initialize/theme/theme.dart';

final class MainApp extends StatelessWidget {
  const MainApp({super.key});
  static const String appName = 'Rent a Car';
  @override
  Widget build(BuildContext context) {
    const customTheme = CustomTheme();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp.router(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: customTheme.theme(CustomTheme.lightScheme()),
        darkTheme: customTheme.theme(CustomTheme.darkScheme()),
        themeMode: ThemeMode.light,
        routerConfig: MainAppRouter.router,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
