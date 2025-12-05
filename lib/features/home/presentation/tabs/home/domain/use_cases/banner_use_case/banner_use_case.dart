import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../entities/banner_entity.dart';
import '../../repos/banner_repository/banner_repository.dart';
@injectable
class BannerUseCase {
  final BannersRepository bannersRepository;

  BannerUseCase(this.bannersRepository);

  Future<Either<Failures, List<BannerEntity>>> getBannersByPosition(String position) {
    return bannersRepository.getBannersByPosition(position);
  }
}