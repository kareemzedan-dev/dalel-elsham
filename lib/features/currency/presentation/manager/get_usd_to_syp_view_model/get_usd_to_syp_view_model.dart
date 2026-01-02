import 'package:dalel_elsham/core/services/location_service.dart';
import 'package:dalel_elsham/features/currency/domain/entites/exchange_rate_entity.dart';
import 'package:dalel_elsham/features/currency/domain/use_cases/get_usd_to_syp_use_case/get_usd_to_syp_use_case.dart';
import 'package:dalel_elsham/features/currency/presentation/manager/get_usd_to_syp_view_model/get_usd_to_syp_view_model_states.dart';
import 'package:dalel_elsham/features/weather/domain/use_cases/get_weather_use_case/get_weather_use_case.dart';
import 'package:dalel_elsham/features/weather/presentation/manager/get_weather_view_model/get_weather_view_model_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
@injectable
class GetUsdToSypViewModel extends Cubit<GetUsdToSypViewModelStates> {
  final GetUsdToSypUseCase getUsdToSypUseCase;

  GetUsdToSypViewModel(this.getUsdToSypUseCase)
      : super(GetUsdToSypViewModelInitialState());

  final usdController = TextEditingController();
  final sypOldController = TextEditingController();
  final sypNewController = TextEditingController();

  late ExchangeRateEntity currentRate;

  bool _isUpdating = false;

  // ================= INIT =================
  Future<void> getUsdToSyp() async {
    emit(GetUsdToSypViewModelLoadingState());
    final result = await getUsdToSypUseCase.call();

    result.fold(
      ifLeft: (f) => emit(GetUsdToSypViewModelErrorState(f.message)),
      ifRight: (r) {
        currentRate = r;
        emit(GetUsdToSypViewModelSuccessState(r));
      },
    );
  }

  // ================= CONVERSIONS =================
  void onUsdChanged(String value) {
    if (_isUpdating) return;
    _isUpdating = true;

    final usd = double.tryParse(value) ?? 0;

    sypOldController.text =
        (usd * currentRate.usdToSypOld).toStringAsFixed(0);

    sypNewController.text =
        (usd * currentRate.usdToSypNew).toStringAsFixed(0);

    emit(GetUsdToSypViewModelCalculateState());
    _isUpdating = false;
  }

  void onSypOldChanged(String value) {
    if (_isUpdating) return;
    _isUpdating = true;

    final sypOld = double.tryParse(value) ?? 0;

    usdController.text =
        (sypOld / currentRate.usdToSypOld).toStringAsFixed(2);

    sypNewController.text =
        (sypOld / 100).toStringAsFixed(0);

    emit(GetUsdToSypViewModelCalculateState());
    _isUpdating = false;
  }

  void onSypNewChanged(String value) {
    if (_isUpdating) return;
    _isUpdating = true;

    final sypNew = double.tryParse(value) ?? 0;

    final old = sypNew * 100;

    sypOldController.text = old.toStringAsFixed(0);
    usdController.text =
        (old / currentRate.usdToSypOld).toStringAsFixed(2);

    emit(GetUsdToSypViewModelCalculateState());
    _isUpdating = false;
  }

  // ================= CLEAR =================
  void clearAll() {
    _isUpdating = true;

    usdController.clear();
    sypOldController.clear();
    sypNewController.clear();

    emit(GetUsdToSypViewModelCalculateState());

    _isUpdating = false;
  }

  @override
  Future<void> close() {
    usdController.dispose();
    sypOldController.dispose();
    sypNewController.dispose();
    return super.close();
  }
}
final sypFormatter = NumberFormat('#,##0', 'ar');