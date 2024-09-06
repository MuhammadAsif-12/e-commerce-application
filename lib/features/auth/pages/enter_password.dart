import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/common/ui/color.dart';
import 'package:shopping_store/common/ui/custom_app_bar.dart';
import 'package:shopping_store/common/ui/custom_button.dart';
import 'package:shopping_store/common/ui/custom_button_outlined.dart';
import 'package:shopping_store/common/ui/text.dart';
import 'package:shopping_store/features/auth/pages/forget_password.dart';
import 'package:shopping_store/features/auth/pages/sign_in.dart';

class EnterPasswordPage extends StatelessWidget {
  EnterPasswordPage({super.key});

  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "",
        onBackPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignInPage()));
        },
      ),
      backgroundColor: appBackGround,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _siginText(context),
            const SizedBox(
              height: 24,
            ),
            _passwordField(context, _passwordCon),
            const SizedBox(
              height: 24,
            ),
            _continueButton(context),
            const SizedBox(
              height: 24,
            ),
            _forgotPassword(context)
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

Widget _passwordField(BuildContext context, TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: const InputDecoration(
      hintText: "Enter Password",
      fillColor: Colors.white,
    ),
  );
}

Widget _continueButton(BuildContext context) {
  return PrimaryButton(
    text: "Continue",
    onTap: () {},
    backgroundColor: primary,
    textColor: Colors.white,
  );
}

Widget _forgotPassword(BuildContext context) {
  return RichText(
    text: TextSpan(children: [
      TextSpan(text: "  Forgot password? ", style: TextStyle(color: colorD2C)),
      TextSpan(
          text: '  Reset',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ForgetPassword()));
            },
          style: TextStyle(fontWeight: FontWeight.bold, color: colorD2C))
    ]),
  );
}
