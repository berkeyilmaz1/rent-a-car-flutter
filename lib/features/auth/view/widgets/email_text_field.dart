part of '../sign_in_view.dart';

final class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    final emailController =
        context.findAncestorStateOfType<_SignInViewState>()!.emailController;
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(labelText: LocaleKeys.auth_email.tr()),
    );
  }
}
