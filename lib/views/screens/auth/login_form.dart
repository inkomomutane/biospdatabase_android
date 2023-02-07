import 'package:biosp/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../components/label_component.dart';
import '../../components/password_component.dart';
import '../../components/text_component.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LabelComponent(labelText: LocaleKeys.email_address.tr()),
            TextComponent(
              hintText: LocaleKeys.email_address.tr(),
              validator: (value) {
                return null;
              },
              onChanged: (email) {},
              onSaved: (email) {},
            ),
            LabelComponent(labelText: LocaleKeys.password.tr()),
            PasswordComponent(
              hintText: LocaleKeys.password.tr(),
              validator: (password) {
                return null;
              },
              onChanged: (password) {},
              onSaved: (password) {},
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 35, right: 35, top: 10, bottom: 34),
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).primaryColor),
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
    );
  }
}
