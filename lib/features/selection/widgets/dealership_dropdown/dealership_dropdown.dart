import 'package:flutter/material.dart';
import 'package:rent_a_car/features/selection/widgets/dealership_dropdown/dealership_dropdown_mixin.dart';
import 'package:rent_a_car/product/initialize/service/models/dealership/dealership.dart';
import 'package:rent_a_car/product/utils/border_radius_general.dart';

final class DealershipDropdown extends StatefulWidget {
  const DealershipDropdown({
    required this.onChanged,
    super.key,
    this.initialCategoryParentId,
  });

  final ValueChanged<DealerShip> onChanged;
  final String? initialCategoryParentId;

  @override
  State<DealershipDropdown> createState() =>
      _MainCategoryDropdownButtonState();
}

class _MainCategoryDropdownButtonState extends State<DealershipDropdown>
    with DealershipDropdownMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Durations.short3,
      opacity: isLoading ? 0.3 : 1,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<DealerShip>(
          items: dealership
              .map(
                (dealer) => DropdownMenuItem<DealerShip>(
                  child: Text(dealer ?? ''),
                ),
              )
              .toList(),
          value: initialValue,
          borderRadius: const BorderRadiusGeneral.allLow(),
          isExpanded: true,
          onChanged: onChanged,
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          hint: const Text(
            'Bayi Seçiniz',
          ),
          icon: const Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}
