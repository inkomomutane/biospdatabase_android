import 'package:biospdatabase/Model/Auth/Auth.dart';
import 'package:biospdatabase/View/FormComponents/LabelComponent.dart';
import 'package:biospdatabase/View/FormComponents/PasswordComponent.dart';
import 'package:biospdatabase/View/FormComponents/TextComponent.dart';
import 'package:biospdatabase/View/Home/Home.dart';
import 'package:flutter/material.dart';

class FormComponents extends StatefulWidget {
  const FormComponents({Key? key}) : super(key: key);

  @override
  _FormComponentsState createState() => _FormComponentsState();
}

class _FormComponentsState extends State<FormComponents> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? passwordController;
  Map<String, String> session = {"email": "", "password": ""};
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LabelComponent(labelText: "Email"),
            TextComponent(
              hintText: "Email",
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                  return "Por favor insira um email válido";
                } else {
                  return null;
                }
              },
              onChanged: (email) {
                setState(() {
                  session['email'] = email;
                });
              },
              onSaved: (email) {
                setState(() {
                  session['email'] = "$email";
                });
              },
            ),
            LabelComponent(labelText: "Password"),
            PasswordComponent(
              hintText: "Password",
              validator: (password) {
                if (password!.isEmpty || password.length < 8) {
                  return "A senha deve ter no mínimo 8 letras";
                } else {
                  return null;
                }
              },
              controller: passwordController,
              onChanged: (password) {
                setState(() {
                  session['password'] = "$password";
                });
              },
              onSaved: (password) {
                setState(() {
                  session['password'] = "$password";
                });
              },
            ),
            Padding(
                padding:
                    EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 34),
                child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("${session["email"]} : " +
                            "${session["password"]}");
                        Auth.session(
                                "${session["email"]}", "${session["password"]}")
                            .then((success) => {
                                  if (success)
                                    {
                                      Navigator.of(context).pop(),
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute<void>(
                                          builder: (BuildContext context) =>
                                              Home(index: 1),
                                          fullscreenDialog: true,
                                        ),
                                      )
                                    }
                                  else
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                          'Usuario não encontrado! por favor contacte a administrador.',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        backgroundColor: Colors.red,
                                      ))
                                    }
                                });
                      }
                    },
                    child: Text("Entrar"),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurple),
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(22)))))
          ],
        ),
      ),
    );
  }
}
