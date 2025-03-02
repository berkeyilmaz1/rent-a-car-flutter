part of '../create_admin_view.dart';

class TcNameSurnameRow extends StatelessWidget {
  const TcNameSurnameRow({
    required this.tcController,
    required this.nameController,
    required this.lastnameController,
    super.key,
  });
  final TextEditingController tcController;
  final TextEditingController nameController;
  final TextEditingController lastnameController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: tcController,
            decoration: InputDecoration(
              labelText: LocaleKeys.auth_tc.tr(),
              hintText: LocaleKeys.auth_hints_tc.tr(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.auth_validations_required_tc.tr();
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
            controller: lastnameController,
            decoration: InputDecoration(
              labelText: LocaleKeys.auth_surname.tr(),
              hintText: LocaleKeys.auth_hints_surname.tr(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleKeys.auth_validations_required_surname.tr();
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
