import 'package:dart_either/dart_either.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../entities/app_link_entity.dart';

abstract class AppLinksRepo {
  Future<Either<Failures, List<AppLinkEntity>>> getAllAppLinks();

  Future<Either<Failures, void>> addOrUpdateLink(AppLinkEntity appLink);
}
