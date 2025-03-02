part of '../create_admin_view.dart';

class EmailField extends StatelessWidget {
  const EmailField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
    );
  }
}
