part of '../view/auth_view.dart';

final class AuthBackground extends StatelessWidget {
  const AuthBackground({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      padding: const PagePadding.all(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadiusGeneral.cardLow(),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
