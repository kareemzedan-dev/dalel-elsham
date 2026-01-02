import 'package:dalel_elsham/core/components/custom_app_bar.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/services/widgets/services_tab_view_body.dart';
import 'package:flutter/material.dart';

class ServicesTabView extends StatelessWidget {
  const ServicesTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  CustomAppBar(title: "الخدمات",showBackButton: false,),
      body:ServicesTabViewBody() ,
    );
  }
}