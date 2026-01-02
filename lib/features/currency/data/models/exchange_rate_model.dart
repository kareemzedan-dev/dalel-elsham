import 'package:dalel_elsham/features/currency/domain/entites/exchange_rate_entity.dart';

class ExchangeRateModel extends ExchangeRateEntity {
  const ExchangeRateModel({
    required super.usdToSypOld,
    required super.usdToSypNew,
    required super.lastUpdate,
  });

  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) {
    final rates = json['rates'] as Map<String, dynamic>;

    final double oldSyp = (rates['SYP'] as num).toDouble();

    final String dateString = json['time_last_update_utc'] as String;

    return ExchangeRateModel(
      usdToSypOld: oldSyp,
      usdToSypNew: oldSyp / 100,
      lastUpdate: DateTime.tryParse(dateString) ?? DateTime.now(),
    );
  }
}
