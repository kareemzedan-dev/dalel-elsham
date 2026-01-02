import 'package:dalel_elsham/core/errors/failures.dart';
import 'package:dalel_elsham/features/currency/data/data_sources/remote/get_usd_to_syp_remote_data_source/get_usd_to_syp_remote_data_source.dart';
import 'package:dalel_elsham/features/currency/data/models/exchange_rate_model.dart';
import 'package:dalel_elsham/features/currency/domain/entites/exchange_rate_entity.dart';
import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetUsdToSypRemoteDataSource)
class GetUsdToSypRemoteDataSourceImpl
    implements GetUsdToSypRemoteDataSource {

  final Dio dio;

  GetUsdToSypRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<Failures, ExchangeRateEntity>> getUsdToSyp() async {
    try {
      final response = await dio.get(
        'https://open.er-api.com/v6/latest/USD',
      );
print(response.data);

      final model = ExchangeRateModel.fromJson(response.data);

      return Right(model);
    } on DioException catch (_) {
      return Left(
        ServerFailure('فشل الاتصال بخدمة سعر الصرف'),
      );
    } catch (_) {
      return Left(
        ServerFailure('حدث خطأ غير متوقع'),
      );
    }
  }
}
