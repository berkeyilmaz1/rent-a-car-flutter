import 'package:flutter/material.dart';
import 'package:rent_a_car/product/utils/border_radius_general.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

final class DriverInfoForm extends StatelessWidget {
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
