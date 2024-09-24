import 'package:dartz/dartz.dart';
import 'package:shopping_store/dependency_injection.dart';
import 'package:shopping_store/features/auth/data/data_source/auth_firebase_service.dart';
import 'package:shopping_store/features/auth/data/models/user_creation_request.dart';
import 'package:shopping_store/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReq user) async {
    return await sl<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }
}
