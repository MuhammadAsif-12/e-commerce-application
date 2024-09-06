import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/common/ui/color.dart';
import 'package:shopping_store/common/ui/custom_app_bar.dart';
import 'package:shopping_store/common/ui/custom_button.dart';
import 'package:shopping_store/common/ui/custom_button_outlined.dart';
import 'package:shopping_store/common/ui/text.dart';
import 'package:shopping_store/features/auth/pages/enter_password.dart';
import 'package:shopping_store/features/auth/pages/signup.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _emailCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackGround,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _siginText(context),
            const SizedBox(
              height: 24,
            ),
            _emailField(context, _emailCon),
            const SizedBox(
              height: 24,
            ),
            _continueButton(context),
            const SizedBox(
              height: 24,
            ),
            _createAccount(context)
          ],
        ),
      ),
    );
  }
}

Widget _siginText(BuildContext context) {
  return PrimaryText(
    text: 'Sign In',
    size: 32,
    fontWeight: FontWeight.w600,
    textColor: colorD2C,
  );
}

Widget _emailField(BuildContext context, TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: const InputDecoration(
      hintText: "Enter Email",
      fillColor: Colors.white,
    ),
  );
}

Widget _continueButton(BuildContext context) {
  return PrimaryButton(
    text: "Continue",
    onTap: () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => EnterPasswordPage()));
    },
    backgroundColor: primary,
    textColor: Colors.white,
  );
}

Widget _createAccount(BuildContext context) {
  return RichText(
    text:  TextSpan(children: [
      TextSpan(
          text: "  Don't you have an account? ",
          style: TextStyle(color: colorD2C)),
      TextSpan(
          text: '  Create one',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SignUpPage()));
            },
          style: TextStyle(fontWeight: FontWeight.bold, color: colorD2C))
    ]),
  );
}
