import 'package:dart_either/dart_either.dart';

import '../../../../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/app_link_entity.dart';

abstract class AppLinksRemoteDataSource {
  Future<Either<Failures, List<AppLinkEntity>>> getAllAppLinks();

  Future<Either<Failures, void>> addOrUpdateLink(AppLinkEntity appLink);
}
