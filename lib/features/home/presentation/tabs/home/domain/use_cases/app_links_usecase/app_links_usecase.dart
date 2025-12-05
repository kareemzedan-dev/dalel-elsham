import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../entities/app_link_entity.dart';
import '../../repos/app_links_repo/app_links_repo.dart';

@injectable
class AppLinksUseCase {
  final AppLinksRepo repository;

  AppLinksUseCase(this.repository);

  Future<Either<Failures, List<AppLinkEntity>>> getAllAppLinks() async {
    return repository.getAllAppLinks();
  }

  Future<Either<Failures, void>> addOrUpdateLink(AppLinkEntity appLink) async {
    return repository.addOrUpdateLink(appLink);
  }
}
