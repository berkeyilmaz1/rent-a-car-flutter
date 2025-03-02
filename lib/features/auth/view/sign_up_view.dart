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

part 'widgets/address_field.dart';
part 'widgets/birth_date_picker.dart';
part 'widgets/confirm_password_field.dart';
part 'widgets/email_field.dart';
part 'widgets/license_number_field.dart';
part 'widgets/name_surname_fields.dart';
part 'widgets/password_field.dart';
part 'widgets/phone_number_field.dart';

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
              NameSurnameFields(
                nameController: nameController,
                lastNameController: lastNameController,
                tcController: tcController,
              ),
              const SizedBox(height: WidgetSizes.spacingM),
              EmailField(controller: emailController),
              const SizedBox(height: WidgetSizes.spacingM),
              PasswordField(
                controller: passwordController,
                obscureText: obscureText,
                onToggleVisibility: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
              const SizedBox(height: WidgetSizes.spacingM),
              ConfirmPasswordField(
                controller: confirmPasswordController,
                passwordController: passwordController,
                obscureText: obscureText,
                onToggleVisibility: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              ),
              const SizedBox(height: WidgetSizes.spacingM),
              PhoneNumberField(controller: phoneNumberController),
              const SizedBox(height: WidgetSizes.spacingM),
              BirthDatePicker(
                selectedBirthDate: selectedBirthDate,
                onDatePicked: (pickedDate) {
                  setState(() {
                    selectedBirthDate = pickedDate;
                  });
                },
              ),
              const SizedBox(height: WidgetSizes.spacingM),
              LicenseNumberField(controller: licenseNumberController),
              const SizedBox(height: WidgetSizes.spacingM),
              AddressField(controller: addressController),
              const SizedBox(height: WidgetSizes.spacingXxl2),
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
