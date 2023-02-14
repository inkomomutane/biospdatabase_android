import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/components/views/auth/login_cubit.dart';
import '../../../bloc/components/views/auth/login_state.dart';
import '../../../core/validations.dart';
import '../../../translations/locale_keys.g.dart';
import '../../components/label_component.dart';
import '../../components/password_component.dart';
import '../../components/text_component.dart';
import '../home/home.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.authenticated && state.validated) {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const Home(),
                fullscreenDialog: true,
              ),
            );
          } else if (state.validated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                showCloseIcon: true,
                dismissDirection: DismissDirection.startToEnd,
                behavior: SnackBarBehavior.floating,
                content: Text(
                  LocaleKeys.auth_failed.tr(),
                ),
                // backgroundColor: FlexColor.redDarkPrimary,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LabelComponent(labelText: LocaleKeys.email_address.tr()),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return TextComponent(
                    hintText: LocaleKeys.email_address.tr(),
                    initialValue: state.email,
                    validator: (value) =>
                        Validation.mailValidation(value ?? ""),
                    onChanged: (email) => context.read<LoginCubit>().validate(
                          state.copyWith(email: email),
                        ),
                  );
                },
              ),
              LabelComponent(labelText: LocaleKeys.password.tr()),
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return PasswordComponent(
                    hintText: LocaleKeys.password.tr(),
                    initialValue: state.password,
                    validator: (password) =>
                        Validation.passwordValidation(password ?? ""),
                    onChanged: (password) =>
                        context.read<LoginCubit>().validate(
                              state.copyWith(password: password),
                            ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 35, right: 35, top: 10, bottom: 34),
                child: TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<LoginCubit>().login(true);
                    }
                  },
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(22))),
                  child: Text(
                    LocaleKeys.login.tr(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
