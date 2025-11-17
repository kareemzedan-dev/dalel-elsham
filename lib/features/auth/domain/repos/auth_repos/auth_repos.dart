import 'package:dart_either/dart_either.dart';

import '../../../../../core/errors/failures.dart';
import '../../entities/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<Failures, AuthEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failures, AuthEntity>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  });

  Future<Either<Failures, AuthEntity>> getCurrentUser();

  Future<void> logout();
}
