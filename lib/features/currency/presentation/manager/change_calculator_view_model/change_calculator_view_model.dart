import 'package:dalel_elsham/features/currency/presentation/manager/change_calculator_view_model/change_calculator_view_model_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeCalculatorViewModel extends Cubit<ChangeCalculatorState> {
  ChangeCalculatorViewModel() : super(ChangeCalculatorInitial());

  final TextEditingController paidController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  double changeNew = 0;
  double changeOld = 0;
  String? errorMessage;

  void calculate() {
    final paid = double.tryParse(paidController.text);
    final  price = double.tryParse(priceController.text);

    errorMessage = null;

    if (paid == null  ) {
      errorMessage = 'من فضلك أدخل أرقام صحيحة';
      emit(ChangeCalculatorUpdated());
      return;
    }
 if (price == null  ) {
      errorMessage = '';
      emit(ChangeCalculatorUpdated());
      return;
    }
    if (paid < price) {
      errorMessage = 'المبلغ المدفوع أقل من سعر الغرض';
      changeNew = 0;
      changeOld = 0;
      emit(ChangeCalculatorUpdated());
      return;
    }

    changeNew = paid - price;
    changeOld = changeNew * 100;
    emit(ChangeCalculatorUpdated());
  }

  void clear() {
    paidController.clear();
    priceController.clear();
    changeNew = 0;
    changeOld = 0;
    errorMessage = null;
    emit(ChangeCalculatorUpdated());
  }

  @override
  Future<void> close() {
    paidController.dispose();
    priceController.dispose();
    return super.close();
  }
}
