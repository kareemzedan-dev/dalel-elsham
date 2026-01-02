import 'package:dalel_elsham/core/errors/failures.dart';
import 'package:dalel_elsham/features/currency/domain/entites/exchange_rate_entity.dart';
import 'package:dalel_elsham/features/weather/domain/entites/weather_entity.dart';
import 'package:dart_either/dart_either.dart';

abstract class GetUsdToSypRepo {
  Future<Either<Failures, ExchangeRateEntity>> getUsdToSyp();
}
