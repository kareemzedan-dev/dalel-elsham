import 'package:dalel_elsham/core/utils/colors_manager.dart';
import 'package:dalel_elsham/features/currency/presentation/manager/change_calculator_view_model/change_calculator_view_model.dart';
import 'package:dalel_elsham/features/currency/presentation/manager/change_calculator_view_model/change_calculator_view_model_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangeCalculatorCard extends StatelessWidget {
  final ChangeCalculatorViewModel vm;

  const ChangeCalculatorCard({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeCalculatorViewModel, ChangeCalculatorState>(
      bloc: vm,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 18,
                  decoration: BoxDecoration(
                    color: ColorsManager.primaryColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'حاسبة التسوق والباقي',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CalcInput(
                    label: 'المبلغ الذي دفعته للمحل بالعمله الجديده',
                    controller: vm.paidController,
                    onChanged: (_) => vm.calculate(),
                  ),

                  const SizedBox(height: 16),

                  _CalcInput(
                    label: 'سعر الغرض بالعمله الجديده',
                    controller: vm.priceController,
                    onChanged: (_) => vm.calculate(),
                  ),

                  if (vm.errorMessage != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      vm.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],

                  const SizedBox(height: 20),

                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'الباقي بالليره (الجديدة)',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${vm.changeNew.toStringAsFixed(2)} ل.س',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Icon(Icons.currency_exchange_rounded),
                          const SizedBox(height: 8),
                          Text(
                            'الباقي بالليره (القديمة)',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${vm.changeOld.toStringAsFixed(0)} ل.س',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: ColorsManager.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: vm.clear,
                      icon: const Icon(Icons.refresh, color: Colors.red),
                      label: const Text(
                        'مسح الكل',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CalcInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const _CalcInput({
    required this.label,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: '0',
            filled: true,
            fillColor: Colors.blue.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
