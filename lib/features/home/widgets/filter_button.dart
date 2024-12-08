import 'package:flutter/material.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

final class FilterButton extends StatelessWidget {
  const FilterButton({
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
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: WidgetSizes.spacingXSS, // Hafif gölge
      ),
      child: Text(buttonName),
    );
  }
}
