part of '../sign_up_view.dart';

class AddressField extends StatelessWidget {
  const AddressField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
    );
  }
}
