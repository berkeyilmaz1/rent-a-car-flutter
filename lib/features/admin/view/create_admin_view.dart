import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/initialize/service/models/admin/admin_create_request.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

class CreateAdminView extends StatefulWidget {
  const CreateAdminView({super.key});

  @override
  State<CreateAdminView> createState() => _CreateAdminViewState();
}

class _CreateAdminViewState extends State<CreateAdminView> {
  bool obscureText = true;

  // TextEditingController'lar
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController tcController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  DateTime? selectedBirthDate;
  late final RentACarService _rentACarService;

  @override
  initState() {
    super.initState();
    _rentACarService = RentACarService(networkManager: ProductNetworkManager());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const PagePadding.all(),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // İsim ve Soyisim
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: tcController,
                        decoration: const InputDecoration(
                          labelText: 'TC',
                          hintText: 'TC Kimlik Numaranızı giriniz.',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'TC Kimlik Numaranızı giriniz.';
                          }
                          if (value.length != 11) {
                            return 'TC Kimlik Numarası 11 haneli olmalıdır.';
                          }
                          if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                            return 'TC Kimlik Numarası sadece rakamlardan oluşmalıdır.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: WidgetSizes.spacingM),
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Adınız',
                          hintText: 'Adınızı giriniz',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Adınızı giriniz';
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Soyadınızı giriniz';
                          }
                          return null;
                        },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'E-posta adresinizi giriniz';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Şifrenizi giriniz';
                    } else if (value.length != 8) {
                      return 'Şifreniz 8 karakter olmalıdır';
                    }
                    return null;
                  },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Şifrenizi tekrar giriniz';
                    } else if (value != passwordController.text) {
                      return 'Şifreler eşleşmiyor';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: WidgetSizes.spacingM),

                // Kayıt Ol butonu
                AuthButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      await _rentACarService.createAdmin(AdminCreateRequest(
                          email: emailController.text,
                          id: tcController.text,
                          lastname: lastnameController.text,
                          name: nameController.text,
                          password: passwordController.text));
                      const AdminDashboardViewRoute().go(context);
                    }
                  },
                  buttonName: 'Kayıt Ol',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
