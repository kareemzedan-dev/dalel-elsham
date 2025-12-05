import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repos/auth_repos/auth_repos.dart';
import '../data_sources/remote/auth_remote_data_source.dart';
@Injectable(as: AuthRepository)
class AuthRepoImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failures, AuthEntity>> login({
    required String email,
    required String password,
  }) {
    return authRemoteDataSource.login(email: email, password: password);
  }

  @override
  Future<Either<Failures, AuthEntity>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) {
    return authRemoteDataSource.register(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
  }

  @override
  Future<Either<Failures, AuthEntity>> getCurrentUser() {
    return authRemoteDataSource.getCurrentUser();
  }

  @override
  Future<void> logout() {
    return authRemoteDataSource.logout();
  }
  @override
  Future<Either<Failures, void>> deleteAccount() {
    return authRemoteDataSource.deleteAccount();
  }
}