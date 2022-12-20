import 'package:porkinio/app/features/login/login_controller.dart';
import 'package:porkinio/app/features/sing_up/sign_up_controller.dart';
import 'package:porkinio/app/features/splash/splash_controller.dart';
import 'package:porkinio/app/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:porkinio/app/services/secure_storage.dart';

import 'app/services/firebase_auth_service.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService());

  locator.registerFactory<SplashController>(
      () => SplashController(const SecureStorage()));

  locator.registerFactory<LoginController>(
      () => LoginController(locator.get<AuthService>()));

  locator.registerFactory<SignUpController>(
      () => SignUpController(locator.get<AuthService>()));
}