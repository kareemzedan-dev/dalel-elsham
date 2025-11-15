import 'package:dalel_elsham/core/errors/failures.dart';

import 'package:dalel_elsham/features/home/presentation/tabs/home/domain/entities/banner_entity.dart';

import 'package:dart_either/src/dart_either.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repos/banner_repository/banner_repository.dart';
import '../../data_sources/remote/banner_remote_data_source/banners_remote_data_source.dart';
@Injectable(as: BannersRepository)
class BannersReposImpl implements BannersRepository {
  final BannersRemoteDataSource bannersRemoteDataSource;
  BannersReposImpl(this.bannersRemoteDataSource);

  @override
  Future<Either<Failures, List<BannerEntity>>> getBannersByPosition(String position) {
    return bannersRemoteDataSource.getBannersByPosition(position);
  }


}