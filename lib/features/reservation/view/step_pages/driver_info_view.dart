part of '../reservation_view.dart';

final class DriverInfoView extends StatefulWidget {
  const DriverInfoView({
    required this.car,
    required this.startDate,
    required this.endDate,
    required this.dayCount,
    required this.startDateWithTime,
    required this.endDateWithTime,
    required this.onRentButtonPressed,
    super.key,
  });
  final Car car;
  final String startDate;
  final String endDate;
  final int dayCount;
  final DateTime startDateWithTime;
  final DateTime endDateWithTime;
  final VoidCallback onRentButtonPressed;

  @override
  State<DriverInfoView> createState() => _DriverInfoViewState();
}

class _DriverInfoViewState extends State<DriverInfoView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              CarInfo(imageUrl: 'assets/images/fiat-egea.png', car: widget.car),
              const DriverInfoForm(),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Card(
                color: Theme.of(context).colorScheme.onPrimary,
                elevation: WidgetSizes.spacingXSs,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeneral.allLow(),
                ),
                child: Padding(
                  padding: const PagePadding.all(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Toplam Tutar'),
                          const Spacer(),
                          Text(
                            (widget.car.pricePerDay! * widget.dayCount)
                                .toString(),
                          ),
                        ],
                      ),
                      const SizedBox(height: WidgetSizes.spacingM),
                      Row(
                        children: [
                          //todo make this field readonly and disabled
                          Expanded(
                            child: TextFormField(
                              initialValue: widget.startDate,
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: 'Başlangıç Tarihi',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: WidgetSizes.spacingXs),
                          Expanded(
                            child: TextFormField(
                              initialValue: widget.endDate,
                              readOnly: true,
                              decoration: const InputDecoration(
                                labelText: 'Bitiş Tarihi',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: WidgetSizes.spacingM),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RentButton(
                            onPressed: widget.onRentButtonPressed,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
