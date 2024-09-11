import 'package:dartz/dartz.dart';
import 'package:shopping_store/features/auth/data/models/user_creation_request.dart';

abstract class AuthRepository {

  Future<Either> signup(UserCreationReq user);
  Future<Either> getAges();
}