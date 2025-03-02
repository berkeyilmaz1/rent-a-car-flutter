import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rent_a_car/features/auth/view/mixin/auth_view_mixin.dart';
import 'package:rent_a_car/product/initialize/localization/locale_keys.g.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/utils/border_radius_general.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';

part '../widgets/auth_background.dart';

final class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> with AuthViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Text(LocaleKeys.admin_admin).tr(),
        onPressed: () => const AdminSignInViewRoute().go(context),
      ),
      body: Center(
        child: AuthBackground(
          child: DefaultTabController(
            length: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue,
                  tabs: [
                    Tab(text: LocaleKeys.auth_login.tr()),
                    Tab(text: LocaleKeys.auth_register.tr()),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: authPages,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
