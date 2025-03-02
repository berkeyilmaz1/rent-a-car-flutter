part of '../create_admin_view.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    required this.controller,
    required this.obscureText,
    required this.onToggleVisibility,
    super.key,
  });
  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggleVisibility;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: LocaleKeys.auth_password.tr(),
        hintText: LocaleKeys.auth_hints_password.tr(),
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
          return LocaleKeys.auth_validations_required_password.tr();
        } else if (value.length != 8) {
          return LocaleKeys.auth_validations_password_minLength.tr();
        }
        return null;
      },
    );
  }
}
