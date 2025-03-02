part of '../sign_up_view.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: LocaleKeys.auth_phoneNumber.tr(),
        hintText: LocaleKeys.auth_hints_phoneNumber.tr(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.auth_validations_required_phoneNumber.tr();
        }
        if (value.length != 11) {
          return LocaleKeys.auth_validations_phoneNumber_length.tr();
        }
        if (!RegExp(r'^\d{11}$').hasMatch(value)) {
          return LocaleKeys.auth_validations_phoneNumber_format.tr();
        }
        return null;
      },
    );
  }
}
