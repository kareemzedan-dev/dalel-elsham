class ExchangeRateEntity {
  final double usdToSypOld; 
  final double usdToSypNew; 
  final DateTime lastUpdate;

  const ExchangeRateEntity({
    required this.usdToSypOld,
    required this.usdToSypNew,
    required this.lastUpdate,
  });
}
