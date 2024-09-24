import 'package:dartz/dartz.dart';
import 'package:shopping_store/core/usecase/usecase.dart';
import 'package:shopping_store/dependency_injection.dart';
import 'package:shopping_store/features/auth/data/models/user_signin_req.dart';
import 'package:shopping_store/features/auth/domain/repository/auth_repository.dart';

class SigninUseCase implements UseCase<Either, UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
