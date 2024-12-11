import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/product/initialize/providers/user_provider.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/initialize/service/models/user/user.dart';
import 'package:rent_a_car/product/initialize/service/models/user/user_create_request.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';
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
    return SingleChildScrollView(
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
                  } else if (value.length < 8) {
                    return 'Şifreniz en az 8 karakter olmalıdır';
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

              // Telefon Numarası
              TextFormField(
                controller: phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'Telefon Numarası',
                  hintText: 'Telefon numaranızı giriniz',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Telefon numaranızı giriniz';
                  }
                  if (value.length != 11) {
                    return 'Telefon Numarası 11 haneli olmalıdır.';
                  }
                  if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                    return 'Telefon Numarası sadece rakamlardan oluşmalıdır.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: WidgetSizes.spacingM),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedBirthDate == null
                          ? 'Doğum Tarihi Seçiniz'
                          : '${selectedBirthDate!.day}/${selectedBirthDate!.month}/${selectedBirthDate!.year}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedBirthDate = pickedDate;
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: WidgetSizes.spacingM),
              // Lisans Numarası
              TextFormField(
                controller: licenseNumberController,
                decoration: const InputDecoration(
                  labelText: 'Sürücü Sicil Numarası',
                  hintText: 'Sürücü Sicil Numaranızı giriniz',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Sürücü sicil numaranızı giriniz';
                  }
                  if (value.length != 6) {
                    return 'Sürücü sicil numarası 6 karakter olmalıdır';
                  }
                  return null;
                },
              ),
              const SizedBox(height: WidgetSizes.spacingM),

              // Adres
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Adres',
                  hintText: 'Adresinizi giriniz',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Adresinizi giriniz';
                  }
                  return null;
                },
              ),
              const SizedBox(height: WidgetSizes.spacingXxl2),

              // Kayıt Ol butonu
              AuthButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    await _rentACarService.createUser(
                      UserCreateRequest(
                        id: tcController.text,
                        name: nameController.text,
                        lastname: lastnameController.text,
                        birthDate: selectedBirthDate,
                        email: emailController.text,
                        password: passwordController.text,
                        phoneNumber: phoneNumberController.text,
                        licenseNumber: licenseNumberController.text,
                        address: addressController.text,
                      ),
                    );
                    Provider.of<UserProvider>(context, listen: false)
                        .setUser(User(
                      id: tcController.text,
                      name: nameController.text,
                      lastname: lastnameController.text,
                      birthDate: selectedBirthDate,
                      email: emailController.text,
                      password: passwordController.text,
                      phoneNumber: phoneNumberController.text,
                      licenseNumber: licenseNumberController.text,
                      address: addressController.text,
                    ));
                    const SelectionViewRoute().go(context);
                  }
                },
                buttonName: 'Kayıt Ol',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
