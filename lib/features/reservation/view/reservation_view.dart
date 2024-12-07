import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_a_car/features/home/widgets/car_card.dart';
import 'package:rent_a_car/features/payment/view/payment_view.dart';
import 'package:rent_a_car/features/reservation/view/mixin/reservation_view_mixin.dart';
import 'package:rent_a_car/features/reservation/widgets/car_info.dart';
import 'package:rent_a_car/product/initialize/service/models/car/car.dart';
import 'package:rent_a_car/product/utils/border_radius_general.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

final class ReservationView extends StatefulWidget {
  const ReservationView({super.key});
  // final Car car;

  @override
  State<ReservationView> createState() => _ReservationViewState();
}

class _ReservationViewState extends State<ReservationView>
    with ReservationViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return const SizedBox.shrink();
              },
              steps: [
                Step(
                  title: const Text('Araç Seçimi'),
                  content: const SizedBox.shrink(),
                  isActive: currentStep == 0,
                ),
                Step(
                  title: const Text('Sürücü Bilgileri'),
                  content: DriverInfoView(
                    ///todo: change car to widget.car
                    car: Car(
                      model: 'Corolla',
                      fuelType: 1,
                      gearType: 1,
                      kilometer: 500,
                      minAge: 20,
                      seatCount: 5,
                      vinNumber: '12345',
                      brand: 'Toyota',
                    ),
                  ),
                  isActive: currentStep == 1,
                ),
                Step(
                  title: const Text('Ödeme'),
                  content: const PaymentView(),
                  isActive: currentStep == 2,
                ),
              ],
              onStepTapped: (value) {
                //todo home olarak değiştir ve daycount ekle, provider kullanabilirsin burda ya da param pasla
                if (value == 0) context.go('/selection');
                setState(() {
                  currentStep = value;
                });
              },
              currentStep: currentStep,
              type: StepperType.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

final class DriverInfoView extends StatelessWidget {
  const DriverInfoView({required this.car, super.key});
  final Car car;

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
                      const Row(
                        children: [
                          Text(' Toplam Tutar'),
                          Spacer(),

                          ///todo add priceparday*daycount
                          Text('₺ 500'),
                        ],
                      ),
                      const SizedBox(height: WidgetSizes.spacingM),
                      Row(
                        children: [
                          //todo make this field readonly and disabled
                          Expanded(
                            child: TextFormField(
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

class DriverInfoForm extends StatelessWidget {
  const DriverInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: WidgetSizes.spacingXs,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusGeneral.cardLow(),
      ),
      child: Padding(
        padding: const PagePadding.all(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [Icon(Icons.person), Text('Kişisel Bilgiler')],
            ),
            // E-posta Adresi
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'E-posta adresi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: WidgetSizes.spacingM),

            // Cep Telefonu
            Row(
              children: [
                DropdownButton<String>(
                  value: '+90',
                  items: const [
                    DropdownMenuItem(value: '+90', child: Text('+90')),
                  ],
                  onChanged: (value) {},
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Cep Telefonu',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: WidgetSizes.spacingM),

            // Açık Rıza Checkbox
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                const Expanded(
                  child: Text(
                    'İndirimler ve kampanyalardan Rıza Metni kapsamında haberdar olmak istiyorum ve kişisel verilerimin pazarlama amacıyla işlenmesine açık rıza veriyorum.',
                  ),
                ),
              ],
            ),
            const SizedBox(height: WidgetSizes.spacingM),

            // Ad, Soyad, Doğum Tarihi, Uçuş Numarası
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Ad',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: WidgetSizes.spacingXs),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Soyad',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: WidgetSizes.spacingM),

            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Doğum Tarihi',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Gün',
                            border: OutlineInputBorder(),
                          ),
                          items: ['1', '2', '3'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Ay',
                            border: OutlineInputBorder(),
                          ),
                          items: ['January', 'February', 'March']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Yıl',
                            border: OutlineInputBorder(),
                          ),
                          items: ['1990', '1991', '1992'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: WidgetSizes.spacingM),

            // T.C. Kimlik No
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'T.C. Kimlik No',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: WidgetSizes.spacingXs),
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      const Text('T.C. vatandaşı değil'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
