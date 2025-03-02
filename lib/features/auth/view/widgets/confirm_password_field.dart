part of '../sign_up_view.dart';

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({
    required this.controller,
    required this.passwordController,
    required this.obscureText,
    required this.onToggleVisibility,
    super.key,
  });
  final TextEditingController controller;
  final TextEditingController passwordController;
  final bool obscureText;
  final VoidCallback onToggleVisibility;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: LocaleKeys.auth_confirmPassword.tr(),
        hintText: LocaleKeys.auth_hints_confirmPassword.tr(),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: onToggleVisibility,
        ),
      ),
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.auth_validations_required_confirmPassword.tr();
        } else if (value != passwordController.text) {
          return LocaleKeys.auth_validations_password_notMatch.tr();
        }
        return null;
      },
    );
  }
}
