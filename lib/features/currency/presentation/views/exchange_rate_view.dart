import 'package:dalel_elsham/core/components/custom_app_bar.dart';
import 'package:dalel_elsham/core/di/di.dart';
import 'package:dalel_elsham/features/currency/presentation/manager/get_usd_to_syp_view_model/get_usd_to_syp_view_model.dart';
import 'package:dalel_elsham/features/currency/presentation/widgets/exchange_rate_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeRateView extends StatelessWidget {
  const ExchangeRateView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(title: "محول الليره"),
      body: ExchangeRateViewBody(),
    );
  }
}