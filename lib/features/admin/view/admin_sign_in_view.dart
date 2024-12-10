import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:rent_a_car/features/admin/view/mixin/admin_sign_in_mixin.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/utils/border_radius_general.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

part '../widgets/admin_auth_background.dart';

final class AdminSignInView extends StatefulWidget {
  const AdminSignInView({super.key});

  @override
  State<AdminSignInView> createState() => _AdminSignInViewState();
}

class _AdminSignInViewState extends State<AdminSignInView>
    with AdminSignInMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => const AuthViewRoute().go(context),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Center(
        child: AdminAuthBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'E-Posta'),
              ),
              const SizedBox(height: WidgetSizes.spacingM),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                ),
                obscureText: obscureText,
              ),
              const SizedBox(height: WidgetSizes.spacingXxl2),
              AuthButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });

                  try {
                    await fetchAndFindAdmin(emailController.text);
                    setState(() {
                      isLoading = false;
                    });
                    const AdminDashboardViewRoute().go(context);
                  } catch (e) {
                    setState(() {
                      isLoading = false;
                    });
                    // Eğer admin bulunamazsa, kullanıcıya bilgi vermek
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Admin bulunamadı. Lütfen tekrar deneyin.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                buttonName: 'Giriş Yap',
              ).ext.toDisabled(disable: isLoading),
            ],
          ),
        ),
      ),
    );
  }
}
