import 'package:flutter/material.dart';

import '../login_form.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/background.png"),
          ),
        ),
        child: Center(
          child: Card(
            elevation: 9,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Column(
                children: const [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Image(
                        image: AssetImage("assets/splash/splash.png"),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: LoginForm(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
