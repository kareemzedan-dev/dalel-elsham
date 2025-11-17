import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/failures.dart';
import '../../entities/auth_entity.dart';
import '../../repos/auth_repos/auth_repos.dart';
@injectable
class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase(this.authRepository);

  Future<Either<Failures, AuthEntity>> login({
    required String email,
    required String password,
  }) async {
    return await authRepository.login(email: email, password: password);
  }

  Future<Either<Failures, AuthEntity>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    return await authRepository.register(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
  }

  Future<Either<Failures, AuthEntity>> getCurrentUser() async {
    return await authRepository.getCurrentUser();
  }

  Future<void> logout() async {
    await authRepository.logout();
  }
}