import 'package:dartz/dartz.dart';
import 'package:shopping_store/core/usecase/usecase.dart';
import 'package:shopping_store/dependency_injection.dart';
import 'package:shopping_store/features/auth/data/models/user_creation_request.dart';
import 'package:shopping_store/features/auth/domain/repository/auth_repository.dart';

class SignupUseCase implements UseCase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
