part of '../sign_up_view.dart';

class LicenseNumberField extends StatelessWidget {
  const LicenseNumberField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: LocaleKeys.auth_licenseNumber.tr(),
        hintText: LocaleKeys.auth_hints_licenseNumber.tr(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.auth_validations_required_licenseNumber.tr();
        }
        if (value.length != 6) {
          return LocaleKeys.auth_validations_licenseNumber_length.tr();
        }
        return null;
      },
    );
  }
}
