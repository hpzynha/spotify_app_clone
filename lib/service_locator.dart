import 'package:get_it/get_it.dart';
import 'package:spotify_app_clone/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify_app_clone/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_app_clone/domain/repository/auth/auth.dart';
import 'package:spotify_app_clone/domain/usecases/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );
}
