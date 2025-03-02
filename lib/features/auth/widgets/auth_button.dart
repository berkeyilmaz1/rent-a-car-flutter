import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rent_a_car/product/utils/border_radius_general.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

final class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.buttonName,
    required this.onPressed,
    super.key,
  });
  final String buttonName;

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusGeneral.cardLow(),
        ),
        elevation: WidgetSizes.spacingXSS,
      ),
      child: Text(buttonName).tr(),
    );
  }
}
