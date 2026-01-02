import 'package:dalel_elsham/core/services/location_service.dart';
import 'package:dalel_elsham/features/weather/domain/use_cases/get_weather_use_case/get_weather_use_case.dart';
import 'package:dalel_elsham/features/weather/presentation/manager/get_weather_view_model/get_weather_view_model_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';@injectable
class GetWeatherViewModel extends Cubit<GetWeatherViewModelStates> {
  final GetWeatherUseCase getWeatherUseCase;

  GetWeatherViewModel(this.getWeatherUseCase)
      : super(GetWeatherViewModelInitial());

  Future<void> getWeatherFromCurrentLocation() async {
    emit(GetWeatherViewModelLoading());

    try {
      final position = await LocationService.getCurrentLocation();

      final result = await getWeatherUseCase.call(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      result.fold(
        ifLeft: (fail) =>
            emit(GetWeatherViewModelError(message: fail.message)),
        ifRight: (weather) =>
            emit(GetWeatherViewModelSuccess(weatherEntity: weather)),
      );
    } catch (e) {
      emit(
        GetWeatherViewModelError(
          message: 'فشل الحصول على الموقع',
        ),
      );
    }
  }
}
