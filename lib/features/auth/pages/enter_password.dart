import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_store/common/Navigator/app_navigator.dart';
import 'package:shopping_store/common/bloc/button_cubit.dart';
import 'package:shopping_store/common/bloc/button_state.dart';
import 'package:shopping_store/common/ui/basic_reactive_button.dart';
import 'package:shopping_store/common/ui/color.dart';
import 'package:shopping_store/common/ui/custom_app_bar.dart';
import 'package:shopping_store/common/ui/text.dart';
import 'package:shopping_store/features/auth/data/models/user_signin_req.dart';
import 'package:shopping_store/features/auth/domain/usecase/sign_in.dart';
import 'package:shopping_store/features/auth/pages/forget_password.dart';
import 'package:shopping_store/features/auth/pages/sign_in.dart';

class EnterPasswordPage extends StatelessWidget {
  final UserSigninReq signInReq;

  EnterPasswordPage({super.key, required this.signInReq});

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
          child: BlocProvider(
            create: (context) => ButtonStateCubit(),
            child: BlocListener<ButtonStateCubit, ButtonState>(
              listener: (context, state) {
                if (state is ButtonFailureState) {
                  var snackbar = SnackBar(
                    content: Text(state.errorMessage),
                    behavior: SnackBarBehavior.floating,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }

                if (state is ButtonSuccessState) {
                  AppNavigator.pushAndRemove(context, ForgetPassword());
                }
              },
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
                  _continueButton(context, signInReq, _passwordCon),
                  const SizedBox(
                    height: 24,
                  ),
                  _forgotPassword(context)
                ],
              ),
            ),
          ),
        ));
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

Widget _continueButton(BuildContext context, UserSigninReq signinReq,
    TextEditingController passwordCon) {
  return Builder(builder: (context) {
    return BasicReactiveButton(
        onPressed: () {
          signinReq.password = passwordCon.text;
          context
              .read<ButtonStateCubit>()
              .execute(usecase: SigninUseCase(), params: signinReq);
        },
        title: 'Continue');
  });
}

Widget _forgotPassword(BuildContext context) {
  return RichText(
    text: TextSpan(children: [
      const TextSpan(text: "  Forgot password? ", style: TextStyle(color: colorD2C)),
      TextSpan(
          text: '  Reset',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ForgetPassword()));
            },
          style: const TextStyle(fontWeight: FontWeight.bold, color: colorD2C))
    ]),
  );
}
