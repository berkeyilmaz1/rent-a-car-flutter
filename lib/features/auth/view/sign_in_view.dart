import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/auth/view/mixin/sign_in_mixin.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/initialize/service/models/user/user.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';
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
               final user =await fetchAndFindUser(emailController.text);
               if (user ==null )return;
              const SelectionViewRoute().go(context);
            },
            buttonName: 'Giriş Yap',
          ),
        ],
      ),
    );
  }
}
