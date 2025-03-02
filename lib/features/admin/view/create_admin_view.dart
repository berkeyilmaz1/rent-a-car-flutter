import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rent_a_car/core/product_network_manager.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/product/initialize/localization/locale_keys.g.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/initialize/service/models/admin/admin_create_request.dart';
import 'package:rent_a_car/product/initialize/service/rent_a_car_service.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

part 'widgets/confirm_password_field.dart';
part 'widgets/email_field.dart';
part 'widgets/password_field.dart';
part 'widgets/tc_name_surname_row.dart';

class CreateAdminView extends StatefulWidget {
  const CreateAdminView({super.key});

  @override
  State<CreateAdminView> createState() => _CreateAdminViewState();
}

class _CreateAdminViewState extends State<CreateAdminView> {
  bool obscureText = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController tcController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
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
                TcNameSurnameRow(
                  tcController: tcController,
                  nameController: nameController,
                  lastnameController: lastnameController,
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
                AuthButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      await _rentACarService.createAdmin(
                        AdminCreateRequest(
                          email: emailController.text,
                          id: tcController.text,
                          lastname: lastnameController.text,
                          name: nameController.text,
                          password: passwordController.text,
                        ),
                      );
                      const AdminDashboardViewRoute().go(context);
                    }
                  },
                  buttonName: LocaleKeys.auth_register.tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
