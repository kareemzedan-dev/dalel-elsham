import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../../core/errors/failures.dart';
import '../../../domain/entities/app_link_entity.dart';
import '../../../domain/repos/app_links_repo/app_links_repo.dart';
import '../../data_sources/remote/app_links_remote_data_source/app_links_remote_data_source.dart';

@Injectable(as: AppLinksRepo)
class AppLinksRepoImpl implements AppLinksRepo {
  final AppLinksRemoteDataSource remoteDataSource;

  AppLinksRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, List<AppLinkEntity>>> getAllAppLinks() {
    return remoteDataSource.getAllAppLinks();
  }

  @override
  Future<Either<Failures, void>> addOrUpdateLink(AppLinkEntity appLink) {
    return remoteDataSource.addOrUpdateLink(appLink);
  }
}
