part of '../reservation_view.dart';

final class DriverInfoView extends StatelessWidget {
  const DriverInfoView(
      {required this.car,
      required this.startDate,
      required this.endDate,
      super.key,
      required this.dayCount});
  final Car car;
  final String startDate;
  final String endDate;
  final int dayCount;

  @override
  Widget build(BuildContext context) {

     
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              CarInfo(imageUrl: 'assets/images/fiat-egea.png', car: car),
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
                          Text(' Toplam Tutar'),
                          Spacer(),

                        
                          Text((car.pricePerDay! * dayCount).toString()),
                        ],
                      ),
                      const SizedBox(height: WidgetSizes.spacingM),
                      Row(
                        children: [
                          //todo make this field readonly and disabled
                          Expanded(
                            child: TextFormField(
                              initialValue: startDate,
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
                              initialValue: endDate,
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
                          RentButton(onPressed: () {}),
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
