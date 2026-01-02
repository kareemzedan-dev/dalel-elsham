import 'package:dalel_elsham/core/errors/failures.dart';
import 'package:dalel_elsham/features/currency/domain/entites/exchange_rate_entity.dart';
import 'package:dalel_elsham/features/currency/domain/repos/get_usd_to_syp_repo/get_usd_to_syp_repo.dart';
import 'package:dart_either/dart_either.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUsdToSypUseCase {
  final GetUsdToSypRepo getUsdToSypRepo;

  GetUsdToSypUseCase(this.getUsdToSypRepo);

  Future<Either<Failures, ExchangeRateEntity>> call() async {
    return await getUsdToSypRepo.getUsdToSyp();
  }
}
