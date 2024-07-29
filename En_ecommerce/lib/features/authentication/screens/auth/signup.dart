import 'package:en_ecommerce/common/widget/login_SignUp/signUp_Form.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              "Let's Create Your Account ",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 25),
            const SignUpForm(),
          ],
        ),
      ),
    );
  }
}
