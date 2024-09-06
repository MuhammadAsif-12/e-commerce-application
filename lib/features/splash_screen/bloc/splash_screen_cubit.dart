import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_store/features/splash_screen/bloc/splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 5));
    emit(UnAuthenticated());
  }
}
