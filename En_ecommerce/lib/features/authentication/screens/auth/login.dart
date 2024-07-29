import 'package:en_ecommerce/common/widget/login_SignUp/anotherPlatforms.dart';
import 'package:flutter/material.dart';
import '../../../../common/widget/login_SignUp/loginDivider.dart';
import '../../../../common/widget/login_SignUp/loginForm.dart';
import '../../../../common/widget/login_SignUp/loginLogo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            LoginHeader(),
            SizedBox(height: 25),
            LoginForm(),
            SizedBox(height: 15),
            LoginDivider(
              text: "Or sign With",
            ),
            AnotherPlatforms(),
          ],
        ),
      ),
    );
  }
}
