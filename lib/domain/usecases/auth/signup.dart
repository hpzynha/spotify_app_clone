import 'package:dartz/dartz.dart';
import 'package:spotify_app_clone/core/usecase/usecase.dart';
import 'package:spotify_app_clone/domain/repository/auth/auth.dart';
import 'package:spotify_app_clone/service_locator.dart';

import '../../../data/models/auth/create_user_req.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepository>().signup(params!);
  }
}
