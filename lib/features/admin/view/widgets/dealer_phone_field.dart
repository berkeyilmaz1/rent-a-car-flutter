part of '../create_dealer_view.dart';

class DealerPhoneField extends StatelessWidget {
  const DealerPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context
          .findAncestorStateOfType<_CreateDealerViewState>()!
          .phoneController,
      decoration: InputDecoration(
        labelText: LocaleKeys.auth_phoneNumber.tr(),
        hintText: LocaleKeys.auth_hints_phoneNumber.tr(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.dealer_validations_required_phone.tr();
        }
        return null;
      },
    );
  }
}
