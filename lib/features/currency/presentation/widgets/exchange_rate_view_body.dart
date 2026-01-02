import 'package:dalel_elsham/core/utils/colors_manager.dart';
import 'package:dalel_elsham/features/currency/presentation/manager/change_calculator_view_model/change_calculator_view_model.dart';
import 'package:dalel_elsham/features/currency/presentation/manager/get_usd_to_syp_view_model/get_usd_to_syp_view_model.dart';
import 'package:dalel_elsham/features/currency/presentation/manager/get_usd_to_syp_view_model/get_usd_to_syp_view_model_states.dart';
import 'package:dalel_elsham/features/currency/presentation/widgets/change_calculator_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExchangeRateViewBody extends StatefulWidget {
  const ExchangeRateViewBody({super.key});

  @override
  State<ExchangeRateViewBody> createState() => _ExchangeRateViewBodyState();
}

class _ExchangeRateViewBodyState extends State<ExchangeRateViewBody> {
  late final ChangeCalculatorViewModel changeVm;

  @override
  void initState() {
    super.initState();
    changeVm = ChangeCalculatorViewModel();
  }

  @override
  void dispose() {
    changeVm.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<GetUsdToSypViewModel>();
    return BlocBuilder<GetUsdToSypViewModel, GetUsdToSypViewModelStates>(
      builder: (context, state) {
            if (state is GetUsdToSypViewModelInitialState) {
            return const Center(child: CircularProgressIndicator(color: ColorsManager.primaryColor,));

    }
        if (state is GetUsdToSypViewModelLoadingState) {
         return const Center(child: CircularProgressIndicator(color: ColorsManager.primaryColor,));

        }

        if (state is GetUsdToSypViewModelErrorState) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (state is GetUsdToSypViewModelSuccessState ||
            state is GetUsdToSypViewModelCalculateState) {
          final rate = vm.currentRate;

          return SingleChildScrollView(
            child: Column(
              children: [
                // ================= HEADER =================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryColor.withAlpha(700),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'محول الليرة السورية',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28.sp,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: ColorsManager.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'سعر الدولار الرسمي: ${sypFormatter.format(rate.usdToSypOld)} ل.س',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          ' الدولار هو السعر المركزي فقط وليس سعر السوق السوداء',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                color: ColorsManager.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 8.sp,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _RateInputField(
                        label: 'الليرة السورية (القديمة)',
                        controller: vm.sypOldController,
                        background: Colors.grey.shade100,
                        symbol: 'ل.س',
                        onChanged: vm.onSypOldChanged,
                      ),

                      const SizedBox(height: 12),

                      _RateInputField(
                        label: 'الليرة السورية (الجديدة)',
                        controller: vm.sypNewController,
                        background: Colors.green.shade50,
                        symbol: 'ل.س',

                        onChanged: vm.onSypNewChanged,
                      ),

                      const SizedBox(height: 12),

                      _RateInputField(
                        label: 'الدولار الأمريكي',
                        controller: vm.usdController,
                        background: Colors.blue.shade50,
                        symbol: '\$',
                        badge: 'سعر رسمي',
                        onChanged: vm.onUsdChanged,
                      ),

                      const SizedBox(height: 24),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: OutlinedButton.icon(
                          onPressed: vm.clearAll,
                          icon: const Icon(Icons.refresh, color: Colors.red),
                          label: Text(
                            'مسح الكل',
                            style: Theme.of(context).textTheme.headlineMedium
                                ?.copyWith(
                                  color: Colors.red,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      BlocBuilder<ChangeCalculatorViewModel, void>(
                        bloc: changeVm,
                        builder: (context, _) {
                          return ChangeCalculatorCard(vm: changeVm);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

         return const Center(child: CircularProgressIndicator(color: ColorsManager.primaryColor,));
      },
    );
  }
}

class _RateInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Color background;
  final String symbol;
  final ValueChanged<String> onChanged;
  final String? badge;

  const _RateInputField({
    required this.label,
    required this.controller,
    required this.background,
    required this.symbol,
    required this.onChanged,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: Theme.of(context)?.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              if (badge != null) ...[
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    badge!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 8.sp,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: onChanged,

            cursorColor: ColorsManager.primaryColor,

            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: ColorsManager.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),

            decoration: InputDecoration(
              isDense: true,

              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  symbol,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: ColorsManager.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),

              prefixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),

              hintText: '0',
              hintStyle: TextStyle(
                color: ColorsManager.primaryColor.withOpacity(0.4),
                fontWeight: FontWeight.w500,
              ),

              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
