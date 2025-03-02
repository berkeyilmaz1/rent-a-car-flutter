part of '../create_dealer_view.dart';

class DealerAddressField extends StatelessWidget {
  const DealerAddressField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context
          .findAncestorStateOfType<_CreateDealerViewState>()!
          .addressController,
      decoration: InputDecoration(
        labelText: LocaleKeys.auth_address.tr(),
        hintText: LocaleKeys.auth_hints_address.tr(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.dealer_validations_required_address.tr();
        }
        return null;
      },
    );
  }
}
