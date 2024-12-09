import 'package:flutter/material.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool obscureText = true;

  // TextEditingController'lar
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController licenseNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: Column(
        mainAxisSize: MainAxisSize.min, // İçeriğe göre boyutlandırma
        children: [
          // İsim ve Soyisim
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Adınız',
                    hintText: 'Adınızı giriniz',
                  ),
                ),
              ),
              const SizedBox(width: WidgetSizes.spacingM),
              Expanded(
                child: TextFormField(
                  controller: lastnameController,
                  decoration: const InputDecoration(
                    labelText: 'Soyadınız',
                    hintText: 'Soyadınızı giriniz',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: WidgetSizes.spacingM),

          // E-posta
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'E-Posta',
              hintText: 'E-posta adresinizi giriniz',
            ),
          ),
          const SizedBox(height: WidgetSizes.spacingM),

          // Şifre
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Şifre',
              hintText: 'Şifrenizi giriniz',
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
          const SizedBox(height: WidgetSizes.spacingM),

          // Şifre Tekrar
          TextFormField(
            controller: confirmPasswordController,
            decoration: InputDecoration(
              labelText: 'Şifre Tekrar',
              hintText: 'Şifrenizi tekrar giriniz',
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
          const SizedBox(height: WidgetSizes.spacingM),

          // Telefon Numarası
          TextFormField(
            controller: phoneNumberController,
            decoration: const InputDecoration(
              labelText: 'Telefon Numarası',
              hintText: 'Telefon numaranızı giriniz',
            ),
          ),
          const SizedBox(height: WidgetSizes.spacingM),

          // Lisans Numarası
          TextFormField(
            controller: licenseNumberController,
            decoration: const InputDecoration(
              labelText: 'Sürücü Sicil Numarası',
              hintText: 'Sürücü Sicil Numaranızı giriniz',
            ),
          ),
          const SizedBox(height: WidgetSizes.spacingM),

          // Adres
          TextFormField(
            controller: addressController,
            decoration: const InputDecoration(
              labelText: 'Adres',
              hintText: 'Adresinizi giriniz',
            ),
          ),
          const SizedBox(height: WidgetSizes.spacingXxl2),

          // Kayıt Ol butonu
          AuthButton(
            onPressed: () {
              const SelectionViewRoute().go(context);
            },
            buttonName: 'Kayıt Ol',
          ),
        ],
      ),
    );
  }
}
