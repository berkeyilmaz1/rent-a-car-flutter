import 'package:flutter/material.dart';
import 'package:rent_a_car/features/home/view/mixin/home_view_mixin.dart';
import 'package:rent_a_car/features/home/widgets/car_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CarCard(
          car: car,
          imageUrl: 'assets/fiat-egea.png',
        ),
      ),
    );
  }
}



// final class CarCard extends StatelessWidget {
//   const CarCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadiusGeneral.allLow()),
//       child: Padding(
//         padding: const PagePadding.all(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadiusGeneral.cardLow(),
//                   child: Image.asset(
//                     'assets/fiat-egea.png',
//                     width: 120,
//                     height: 80,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(width: WidgetSizes.spacingM),
//                 // Araç Bilgileri
//                 const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Fiat Egea veya benzeri',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: WidgetSizes.spacingXSs),
//                     Row(
//                       children: [
//                         Icon(Icons.local_gas_station, size: 16),
//                         SizedBox(width: 4),
//                         Text('Benzin ya da Dizel'),
//                         SizedBox(width: 8),
//                         Icon(Icons.settings, size: 16),
//                         SizedBox(width: 4),
//                         Text('Otomatik'),
//                         SizedBox(width: 8),
//                         Icon(Icons.person, size: 16),
//                         SizedBox(width: 4),
//                         Text('21+ yaş'),
//                       ],
//                     ),
//                     SizedBox(height: WidgetSizes.spacingXSs),
//                     Row(
//                       children: [
//                         Icon(Icons.speed, size: 16),
//                         SizedBox(width: 4),
//                         Text('1500 km'),
//                         SizedBox(width: 8),
//                         Icon(Icons.money, size: 16),
//                         SizedBox(width: 4),
//                         Text('Depozito: 3000 TL'),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const Divider(height: WidgetSizes.spacingXl),
//             // Alt Satır (Fiyat, Şirket ve Buton)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           '3 günlük fiyat:',
//                           style: TextStyle(fontSize: 14),
//                         ),
//                         SizedBox(width: 8),
//                         Text(
//                           '4.335 TL',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: WidgetSizes.spacingXSs),
//                     Text(
//                       'Günlük fiyat: 1.445 TL',
//                       style: TextStyle(fontSize: 12, color: Colors.grey),
//                     ),
//                     SizedBox(height: WidgetSizes.spacingXSs),
//                     Row(
//                       children: [
//                         Icon(Icons.check_circle,
//                             color: Colors.green, size: 16),
//                         SizedBox(width: 4),
//                         Text(
//                           'Ücretsiz İptal',
//                           style:
//                               TextStyle(fontSize: 12, color: Colors.green),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: const Text('Hemen Kirala'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
