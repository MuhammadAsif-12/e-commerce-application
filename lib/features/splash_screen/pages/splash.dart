import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_store/common/ui/color.dart';
import 'package:shopping_store/features/auth/pages/sign_in.dart';
import 'package:shopping_store/features/splash_screen/bloc/splash_screen_cubit.dart';
import 'package:shopping_store/features/splash_screen/bloc/splash_screen_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashScreenCubit, SplashScreenState>(
      listener: (context, state) {
        // TODO: implement listener

        if (state is UnAuthenticated) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SignInPage()));
        }
      },

      child: Scaffold(
        backgroundColor: primary,
        body: Center(
          child: SvgPicture.asset('assets/images/logo.svg'),
        ),
      ),
    );
  }
}
