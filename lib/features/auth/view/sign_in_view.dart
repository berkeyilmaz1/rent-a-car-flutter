import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:rent_a_car/features/auth/view/mixin/sign_in_mixin.dart';
import 'package:rent_a_car/features/auth/widgets/auth_button.dart';
import 'package:rent_a_car/product/initialize/localization/locale_keys.g.dart';
import 'package:rent_a_car/product/initialize/router/route_tree.dart';
import 'package:rent_a_car/product/widgets/page/page_padding.dart';
import 'package:rent_a_car/product/widgets/widget_sizes.dart';

part 'widgets/email_text_field.dart';
part 'widgets/password_text_field.dart';
part 'widgets/sign_in_button.dart';

final class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

final class _SignInViewState extends State<SignInView> with SignInMixin {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: PagePadding.all(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _EmailTextField(),
          SizedBox(height: WidgetSizes.spacingM),
          _PasswordTextField(),
          SizedBox(height: WidgetSizes.spacingXxl2),
          _SignInButton(),
        ],
      ),
    );
  }
}
