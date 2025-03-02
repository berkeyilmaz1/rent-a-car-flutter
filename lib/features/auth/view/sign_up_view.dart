import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/product/initialize/localization/locale_keys.g.dart';
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
  final TextEditingController lastNameController = TextEditingController();
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
                      decoration: InputDecoration(
                        labelText: LocaleKeys.auth_tc.tr(),
                        hintText: LocaleKeys.auth_validations_tc,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'TC Giriniz';
                        }
                        if (value.length != 11) {
                          return LocaleKeys.auth_validations_tc_length.tr();
                        }
                        if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                          return LocaleKeys.auth_validations_tc_format.tr();
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: WidgetSizes.spacingM),
                  Expanded(
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.auth_name.tr(),
                        hintText: LocaleKeys.auth_hints_name.tr(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.auth_validations_required_name.tr();
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: WidgetSizes.spacingM),
                  Expanded(
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.auth_surname.tr(),
                        hintText: LocaleKeys.auth_hints_surname.tr(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return LocaleKeys.auth_validations_required_surname
                              .tr();
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
                decoration: InputDecoration(
                  labelText: LocaleKeys.auth_email.tr(),
                  hintText: LocaleKeys.auth_hints_email.tr(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.auth_validations_required_email.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: WidgetSizes.spacingM),

              // Şifre
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.auth_password.tr(),
                  hintText: LocaleKeys.auth_hints_password.tr(),
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
                    return LocaleKeys.auth_validations_required_password.tr();
                  } else if (value.length < 8) {
                    return LocaleKeys.auth_validations_password_minLength.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: WidgetSizes.spacingM),

              // Şifre Tekrar
              TextFormField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.auth_confirmPassword.tr(),
                  hintText: LocaleKeys.auth_hints_confirmPassword.tr(),
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
                    return LocaleKeys.auth_validations_required_confirmPassword
                        .tr();
                  } else if (value != passwordController.text) {
                    return LocaleKeys.auth_validations_password_notMatch.tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: WidgetSizes.spacingM),

              // Telefon Numarası
              TextFormField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.auth_phoneNumber.tr(),
                  hintText: LocaleKeys.auth_hints_phoneNumber.tr(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.auth_validations_required_phoneNumber
                        .tr();
                  }
                  if (value.length != 11) {
                    return LocaleKeys.auth_validations_phoneNumber_length.tr();
                  }
                  if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                    return LocaleKeys.auth_validations_phoneNumber_format.tr();
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
                          ? LocaleKeys.auth_hints_selectBirthDate.tr()
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
                decoration: InputDecoration(
                  labelText: LocaleKeys.auth_licenseNumber.tr(),
                  hintText: LocaleKeys.auth_hints_licenseNumber.tr(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.auth_validations_required_licenseNumber
                        .tr();
                  }
                  if (value.length != 6) {
                    return LocaleKeys.auth_validations_licenseNumber_length
                        .tr();
                  }
                  return null;
                },
              ),
              const SizedBox(height: WidgetSizes.spacingM),

              // Adres
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.auth_address.tr(),
                  hintText: LocaleKeys.auth_hints_address.tr(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.auth_validations_required_address.tr();
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
                        lastname: lastNameController.text,
                        birthDate: selectedBirthDate,
                        email: emailController.text,
                        password: passwordController.text,
                        phoneNumber: phoneNumberController.text,
                        licenseNumber: licenseNumberController.text,
                        address: addressController.text,
                      ),
                    );
                    Provider.of<UserProvider>(context, listen: false).setUser(
                      User(
                        id: tcController.text,
                        name: nameController.text,
                        lastname: lastNameController.text,
                        birthDate: selectedBirthDate,
                        email: emailController.text,
                        password: passwordController.text,
                        phoneNumber: phoneNumberController.text,
                        licenseNumber: licenseNumberController.text,
                        address: addressController.text,
                      ),
                    );
                    const SelectionViewRoute().go(context);
                  }
                },
                buttonName: LocaleKeys.auth_register.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
