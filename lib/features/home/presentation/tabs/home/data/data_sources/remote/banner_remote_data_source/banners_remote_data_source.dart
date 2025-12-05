import 'package:dart_either/dart_either.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/banner_entity.dart';

abstract class  BannersRemoteDataSource {
  Future<Either<Failures, List<BannerEntity>>> getBannersByPosition(String position);
}