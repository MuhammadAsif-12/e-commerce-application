import 'package:get_it/get_it.dart';
import 'package:shopping_store/features/auth/data/data_source/auth_firebase_service.dart';
import 'package:shopping_store/features/auth/data/repository_impl/auth_repository_impl.dart';
import 'package:shopping_store/features/auth/domain/repository/auth_repository.dart';
import 'package:shopping_store/features/auth/domain/usecase/get_age.dart';
import 'package:shopping_store/features/auth/domain/usecase/sign_in.dart';
import 'package:shopping_store/features/auth/domain/usecase/sign_up.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Services

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  // Repositories

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // usecases

  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
