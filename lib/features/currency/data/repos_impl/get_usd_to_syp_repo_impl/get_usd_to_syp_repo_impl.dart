import 'package:dalel_elsham/core/errors/failures.dart';
import 'package:dalel_elsham/features/currency/data/data_sources/remote/get_usd_to_syp_remote_data_source/get_usd_to_syp_remote_data_source.dart';
import 'package:dalel_elsham/features/currency/domain/entites/exchange_rate_entity.dart';
import 'package:dalel_elsham/features/currency/domain/repos/get_usd_to_syp_repo/get_usd_to_syp_repo.dart';
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:GetUsdToSypRepo )
class GetUsdToSypRepoImpl implements GetUsdToSypRepo{
  final GetUsdToSypRemoteDataSource getUsdToSypRemoteDataSource;

  GetUsdToSypRepoImpl(this.getUsdToSypRemoteDataSource);
  @override
  Future<Either<Failures, ExchangeRateEntity>> getUsdToSyp() {
   return getUsdToSypRemoteDataSource.getUsdToSyp();
  }
}