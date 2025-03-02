part of '../create_dealer_view.dart';

class DealerNameField extends StatelessWidget {
  const DealerNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context
          .findAncestorStateOfType<_CreateDealerViewState>()!
          .nameController,
      decoration: InputDecoration(
        labelText: LocaleKeys.dealer_name.tr(),
        hintText: LocaleKeys.dealer_hints_name.tr(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.dealer_validations_required_name.tr();
        }
        return null;
      },
    );
  }
}
