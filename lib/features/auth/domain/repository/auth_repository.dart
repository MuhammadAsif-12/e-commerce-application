import 'package:dartz/dartz.dart';
import 'package:shopping_store/features/auth/data/models/user_creation_request.dart';
import 'package:shopping_store/features/auth/data/models/user_signin_req.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> getAges();
}
