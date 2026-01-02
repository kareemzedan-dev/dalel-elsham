import 'package:dalel_elsham/features/home/presentation/tabs/services/widgets/custom_service_container.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/services/widgets/services_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesTabViewBody extends StatelessWidget {
  const ServicesTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:   [
          ServicesGrid(),
          SizedBox(height: 20.h,),
        ],
      ),
    );
  }
}