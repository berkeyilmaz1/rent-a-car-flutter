part of '../create_dealer_view.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthButton(
      onPressed: () async {
        final state = context.findAncestorStateOfType<_CreateDealerViewState>();
        if (state?._formKey.currentState?.validate() ?? false) {
          await state!._rentACarService.createDealerShip(
            CreateDealerShipRequest(
              name: state.nameController.text,
              address: state.addressController.text,
              phone: state.phoneController.text,
            ),
          );
          const AdminDashboardViewRoute().go(context);
        }
      },
      buttonName: LocaleKeys.dealer_create.tr(),
    );
  }
}
