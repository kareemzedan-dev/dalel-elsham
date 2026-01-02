import 'package:dalel_elsham/core/utils/assets_manager.dart';

enum WeatherType {
  sunny,
  partlyCloudy,
  cloudy,
  fog,
  rain,
  snow,
  thunder,
}

String getWeatherLottie(int code) {
  if (code == 0) return AssetsManager.sunny;
  if (code == 1 || code == 2) return AssetsManager.partlyCloudy;
  if (code == 3) return AssetsManager.cloudy;
    if (code == 45 || code == 48) return AssetsManager.fog;
  if ((code >= 51 && code <= 67) || (code >= 80 && code <= 82)) {
    return AssetsManager.rain;
  }
  if (code >= 71 && code <= 77) return AssetsManager.snow;
  if (code >= 95) return AssetsManager.thunder;
  return AssetsManager.sunny;
}
