import 'package:dalel_elsham/features/currency/domain/entites/exchange_rate_entity.dart';
import 'package:dalel_elsham/features/weather/domain/entites/weather_entity.dart';
abstract class GetUsdToSypViewModelStates {}

class GetUsdToSypViewModelInitialState extends GetUsdToSypViewModelStates {}

class GetUsdToSypViewModelLoadingState extends GetUsdToSypViewModelStates {}

class GetUsdToSypViewModelSuccessState extends GetUsdToSypViewModelStates {
  final ExchangeRateEntity exchangeRateEntity;
  GetUsdToSypViewModelSuccessState(this.exchangeRateEntity);
}

class GetUsdToSypViewModelErrorState extends GetUsdToSypViewModelStates {
  final String message;
  GetUsdToSypViewModelErrorState(this.message);
}

class GetUsdToSypViewModelCalculateState extends GetUsdToSypViewModelStates {}

 