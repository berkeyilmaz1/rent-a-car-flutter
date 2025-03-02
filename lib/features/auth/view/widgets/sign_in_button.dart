part of '../sign_in_view.dart';

final class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_SignInViewState>()!;
    return AuthButton(
      onPressed: () async {
        state.setState(() {
          state.isLoading = true;
        });

        try {
          final user = await state.fetchAndFindUser(
            state.emailController.text,
            state.passwordController.text,
          );
          state.setState(() {
            state.isLoading = false;
          });

          if (user == null) return;
          const SelectionViewRoute().go(context);
        } catch (e) {
          state.setState(() {
            state.isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                LocaleKeys.notification_userNotFound,
                textAlign: TextAlign.center,
              ).tr(),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      buttonName: LocaleKeys.auth_login,
    ).ext.toDisabled(disable: state.isLoading == true);
  }
}
