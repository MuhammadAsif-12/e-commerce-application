import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_store/common/ui/color.dart';
import 'package:shopping_store/common/ui/custom_app_bar.dart';
import 'package:shopping_store/common/ui/custom_button.dart';
import 'package:shopping_store/common/ui/text.dart';
import 'package:shopping_store/features/auth/pages/sign_in.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController _emailCon = TextEditingController();

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
            _emailField(context, _emailCon),
            const SizedBox(
              height: 24,
            ),
            _continueButton(context),
          ],
        ),
      ),
    );
  }
}

Widget _siginText(BuildContext context) {
  return PrimaryText(
    text: 'Forgot Password',
    size: 32,
    fontWeight: FontWeight.w600,
    textColor: colorD2C,
  );
}

Widget _emailField(BuildContext context, TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: const InputDecoration(
      hintText: "Enter Email Address",
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
