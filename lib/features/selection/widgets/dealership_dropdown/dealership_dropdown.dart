import 'package:flutter/material.dart';
import 'package:rent_a_car/product/initialize/service/models/dealership/dealership.dart';

class DealerShipDropdown extends StatefulWidget {
  const DealerShipDropdown({
    required this.fetchDealerShips,
    required this.onSelected,
    super.key,
  });
  final Future<List<DealerShip>?> Function() fetchDealerShips;
  final Function(DealerShip?) onSelected;

  @override
  State<DealerShipDropdown> createState() => _DealerShipDropdownState();
}

class _DealerShipDropdownState extends State<DealerShipDropdown> {
  DealerShip? selectedDealerShip;
  List<DealerShip>? dealerShips;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchDealerShips();
  }

  Future<void> _fetchDealerShips() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final data = await widget.fetchDealerShips();
      setState(() {
        dealerShips = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load data: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
          height: 50, child: Center(child: CircularProgressIndicator()));
    }

    if (errorMessage != null) {
      return SizedBox(
        height: 50,
        child: Center(
          child: Text(errorMessage!),
        ),
      );
    }

    if (dealerShips == null || dealerShips!.isEmpty) {
      return const SizedBox(
        height: 50,
        child: Center(
          child: Text('No Dealerships Available'),
        ),
      );
    }

    return DropdownButton<DealerShip>(
      value: selectedDealerShip,
      hint: const Text('Select a dealership'),
      isExpanded: true,
      items: dealerShips!
          .map(
            (dealerShip) => DropdownMenuItem<DealerShip>(
              value: dealerShip,
              child: Text(dealerShip.name ?? 'Unnamed Dealership'),
            ),
          )
          .toList(),
      onChanged: (DealerShip? value) {
        setState(() {
          selectedDealerShip = value;
        });
        widget.onSelected(value);
      },
    );
  }
}
