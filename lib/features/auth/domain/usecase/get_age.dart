import 'package:dartz/dartz.dart';
import 'package:shopping_store/core/usecase/usecase.dart';
import 'package:shopping_store/dependency_injection.dart';
import 'package:shopping_store/features/auth/domain/repository/auth_repository.dart';

class GetAgesUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<AuthRepository>().getAges();
  }
}
