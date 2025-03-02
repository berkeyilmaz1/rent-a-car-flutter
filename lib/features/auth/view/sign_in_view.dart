import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:rent_a_car/features/auth/view/mixin/sign_in_mixin.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/product/initialize/localization/locale_keys.g.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

final class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> with SignInMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(labelText: LocaleKeys.auth_email.tr()),
          ),
          const SizedBox(height: WidgetSizes.spacingM),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: LocaleKeys.auth_password.tr(),
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
                final user = await fetchAndFindUser(
                  emailController.text,
                  passwordController.text,
                );
                setState(() {
                  isLoading = false;
                });

                if (user == null) return;
                const SelectionViewRoute().go(context);
              } catch (e) {
                setState(() {
                  isLoading = false;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(LocaleKeys.notification_userNotFound,
                            textAlign: TextAlign.center)
                        .tr(),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
            buttonName: LocaleKeys.auth_login,
          ).ext.toDisabled(disable: isLoading == true),
        ],
      ),
    );
  }
}
