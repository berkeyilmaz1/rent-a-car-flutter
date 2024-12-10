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
    TextEditingController searchController = TextEditingController();

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
          errorMessage = 'Veri yüklenirken bir hata oluştu: $e';
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
            child: Text('Bayi bulunamadı'),
          ),
        );
      }

      return GestureDetector(
        onTap: () async {
          final selected = await showSearch<DealerShip?>(
            context: context,
            delegate: DealerShipSearchDelegate(dealerShips: dealerShips!),
          );
          setState(() {
            selectedDealerShip = selected;
          });
          widget.onSelected(selectedDealerShip);
        },
        child: Row(
          children: [
            const Icon(Icons.search),
            const SizedBox(width: 8),
            Text(
              selectedDealerShip?.name ?? 'Bayi seçiniz',
              style: TextStyle(
                  color: selectedDealerShip == null
                      ? Colors.grey
                      : Colors.black,),
            ),
          ],
        ),
      );
    }
  }

  class DealerShipSearchDelegate extends SearchDelegate<DealerShip?> {
    final List<DealerShip> dealerShips;

    DealerShipSearchDelegate({required this.dealerShips});

    @override
    List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
      ];
    }

    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      );
    }

    @override
    Widget buildResults(BuildContext context) {
      final results = dealerShips
          .where((dealerShip) =>
              dealerShip.name?.toLowerCase().contains(query.toLowerCase()) ??
              false)
          .toList();

      return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final dealerShip = results[index];
          return ListTile(
            title: Text(dealerShip.name ?? 'Bayi adı yok'),
            onTap: () {
              close(context, dealerShip);
            },
          );
        },
      );
    }

    @override
    Widget buildSuggestions(BuildContext context) {
      final suggestions = dealerShips
          .where((dealerShip) =>
              dealerShip.name?.toLowerCase().contains(query.toLowerCase()) ??
              false)
          .toList();

      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final dealerShip = suggestions[index];
          return ListTile(
            title: Text(dealerShip.name ?? 'Bayi adı yok'),
            onTap: () {
              close(context, dealerShip);
            },
          );
        },
      );
    }
  }
