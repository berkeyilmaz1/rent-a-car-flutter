part of '../sign_in_view.dart';

final class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField();

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_SignInViewState>()!;
    return TextFormField(
      controller: state.passwordController,
      decoration: InputDecoration(
        labelText: LocaleKeys.auth_password.tr(),
        suffixIcon: IconButton(
          icon: Icon(
            state.obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            state.setState(() {
              state.obscureText = !state.obscureText;
            });
          },
        ),
      ),
      obscureText: state.obscureText,
    );
  }
}
