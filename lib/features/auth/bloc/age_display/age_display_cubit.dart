import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_store/dependency_injection.dart';
import 'package:shopping_store/features/auth/bloc/age_display/age_display_state.dart';
import 'package:shopping_store/features/auth/domain/usecase/get_age.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(AgesLoading());

  void displayAges() async {
    var returnedData = await sl<GetAgesUseCase>().call();

    returnedData.fold((message) {
      emit(AgesLoadFailure(message: message));
    }, (data) {
      emit(AgesLoaded(ages: data));
    });
  }
}
